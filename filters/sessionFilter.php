<?php

class SessionFilter extends MFilter
{

    public function preProcess()
    {
        // alteração da configuração dependendo do modulo sendo executado
        $module = $this->frontController->getContext()->getModule();
        if (($module == 'report') || ($module == 'grapher')) {
            Manager::setConf('session.check', false);
            Manager::setConf('login.check', false);
        }
        // alteração da configuração dependendo do controller sendo executado
        $controller = $this->frontController->getContext()->getController();
        if (($controller == 'grapher') || ($controller == 'reports') || ($controller == 'report') || ($controller == 'actions')) {
            Manager::setConf('session.check', false);
            Manager::setConf('login.check', false);
        }
        // é necessário validar a sessão?
        if (Manager::getConf('login.check') || Manager::getConf('session.check')) {
            $timeout = Manager::getSession()->checkTimeout(Manager::getConf('session.exception'));
        }
        if ($timeout) {
            $this->frontController->canCallHandler(false);
            $url = Manager::getURL(Manager::getApp() . '/main');
            $this->frontController->setResult(new MRedirect(NULL, $url));
        }
    }

}
