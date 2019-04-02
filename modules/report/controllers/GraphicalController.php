<?php

class GraphicalController extends MController
{

    private $idLanguage;

    public function init()
    {
        Manager::checkLogin(false);
        $this->idLanguage = Manager::getSession()->idLanguage;
        $languages = \fnbr\models\Base::languages();
        $msgDir = Manager::getAppPath('conf/report');
        Manager::$msg->file = 'messages.' . $languages[$this->idLanguage] . '.php';
        Manager::$msg->addMessages($msgDir);
        Manager::setConf('theme.template','content');
    }

    public function annotation()
    {
        $this->data->isMaster = Manager::checkAccess('MASTER', A_EXECUTE) ? 'true' : 'false';
        Manager::getSession()->idDomain = $this->data->idDomain;
        $as = new \fnbr\models\ViewAnnotationSet();
        $result = $as->listLUCountByLanguage();
        $max = 0;
        foreach($result as $i => $r) {
            $max = ($r['n'] > $max) ? $r['n'] : $max;
        }
        foreach($result as $i => $r) {
            $result[$i]['log'] = ($r['n']/$max) * 100;//(int)(log(($r['n']/$max) * 1000));
        }
        foreach($result as $i => $r) {
            $result[$i]['percent'] = (int) ($r['log']) ;
        }

        $this->data->resultLUs = $result;

        $result = $as->listASCountByLanguage();
        $max = 0;
        foreach($result as $i => $r) {
            $max = ($r['n'] > $max) ? $r['n'] : $max;
        }
        foreach($result as $i => $r) {
            $result[$i]['log'] = ($r['n']/$max) * 100;//(int)(log(($r['n']/$max) * 1000));
        }
        foreach($result as $i => $r) {
            $result[$i]['percent'] = (int) ($r['log']) ;
        }

        $this->data->resultASs = $result;

        $result = $as->listCountTargetInTextByLanguage();
        $max = 0;
        foreach($result as $i => $r) {
            $max = ($r['n'] > $max) ? $r['n'] : $max;
        }
        foreach($result as $i => $r) {
            $result[$i]['log'] = ($r['n']/$max) * 100;
        }
        foreach($result as $i => $r) {
            $result[$i]['percent'] = (int) ($r['log']) ;
        }

        $this->data->resultTargets = $result;

        $this->render();
    }

}
