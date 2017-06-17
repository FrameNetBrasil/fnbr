<?php

use fnbr\models\Base;

class fnbrFilter extends MFilter {

    public function preProcess() {
        $data = Manager::getData();
        if (Manager::isLogged()) {
            $login = Manager::getLogin();
            $userIdLanguage = $login->getUser()->getConfigData('mfnIdLanguage');
        }        
        $idLanguage = $data->lang;
        if ($idLanguage == '') {
            $idLanguage = Manager::getSession()->idLanguage;
            if ($idLanguage == '') {
                $idLanguage = $userIdLanguage;
                if ($idLanguage == '') {
                    $idLanguage = 1;
                }
            }
        }
        Manager::getSession()->idLanguage = $idLanguage;
        $db = $data->datasource ? : (Manager::getSession()->fnbrdb ? : Manager::getConf('fnbr.db'));
        Manager::getSession()->fnbrdb = $db;
        Manager::setConf('fnbr.db', $db);
        Manager::setConf('options.language', Base::languages()[$idLanguage]);
    }

}

