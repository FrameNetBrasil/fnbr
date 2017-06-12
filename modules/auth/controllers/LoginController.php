<?php

use  mfn\models\Base;

class LoginController extends \MController
{

    public function init()
    {
        Manager::checkLogin(false);
    }

    public function logout()
    {
        Manager::getAuth()->logout();
        $this->redirect(Manager::getURL('main'));
    }

    public function authenticate()
    {
        if ($this->data->datasource == '') {
            $this->data->datasource = Manager::getConf('mfn.db'); //$this->renderPrompt('error', 'Inform database name.');
        }
        Manager::setConf('mfn.db', $this->data->datasource);
        Manager::getSession()->mfndb = $this->data->datasource;
        $auth = Manager::getAuth();
        $this->data->result = $auth->authenticate($this->data->user, $this->data->challenge, $this->data->response);
        if ($this->data->result) {
            $user = Manager::getLogin()->getUser();
            $this->data->idLanguage = $user->getConfigData('mfnIdLanguage');
            if ($this->data->idLanguage == '') {
                $this->data->idLanguage = 1;
                $user->setConfigData('mfnIdLanguage', $this->data->idLanguage);
            }
            if ($this->data->ifLanguage == '') {
                $this->data->ifLanguage = 'en';
            }

            Manager::getSession()->idLanguage = $this->data->idLanguage;
            Manager::getSession()->lang = $this->data->ifLanguage;
            Manager::getSession()->mfnLevel = $user->getUserLevel();

            $this->redirect(Manager::getURL('main'));
        } else {
            $this->renderPrompt('error', 'Login or password not valid.');
        }
    }

}
