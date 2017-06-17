<?php
/**
 * 
 *
 * @category   Maestro
 * @package    UFJF
 * @subpackage 
 * @copyright  Copyright (c) 2003-2012 UFJF (http://www.ufjf.br)
 * @license    http://siga.ufjf.br/license
 * @version    
 * @since      
 */

use fnbr\models\Base,
    fnbr\models\Language,
    fnbr\auth\models\User;

class MainController extends \MController {

    public function init(){
        Manager::checkLogin(false);
    }

    public function main() {
        if (Manager::isLogged()) {
            $this->render('formMain');
        } else {
            $this->data->datasources = Manager::getConf('mfn.datasource');
            $this->data->action = "@auth/login/authenticate|formLogin";
            $this->render('formLogin');
        }
    }

    public function formMain() {
        $this->render();
    }

    public function changeLanguage() {
        $idLanguage = Base::getIdLanguage($this->data->id);
        Manager::getSession()->idLanguage = $idLanguage;
        $this->redirect(Manager::getURL('main'));
    }

    public function changeLevel() {
        $login = Manager::getLogin(); 
        $toLevel = $this->data->id;
        $user = $login->getUser();
        $levels = $user->getAvaiableLevels();
        if ($levels[$toLevel]) {
            $newUser = new fnbr\auth\models\User($levels[$toLevel]);
            $login->setUser($newUser);
            Manager::getSession()->mfnLayers = $newUser->getConfigData('mfnLayers');
            Manager::getSession()->mfnLevel = $toLevel;
            $this->redirect(Manager::getURL('main'));
        } else {
            $this->renderPrompt('error',_M('You don\'t have such level.'));
        }
        
    }
    
    public function jcryption(){
        $path = Manager::getAppPath('conf');
        $pathPUB = $path . '/rsa_1024_pub.pem';
        $pathPVT = $path . '/rsa_1024_priv.pem';
        $jc = new fnbr\models\jcryption($pathPUB, $pathPVT);
        $jc->go();
        header('Content-type: text/plain');
        print_r($_POST);
        die();
    }
}

