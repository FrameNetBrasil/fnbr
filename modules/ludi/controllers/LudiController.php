<?php





class LudiController extends MController
{

    private $idLanguage;

    public function init()
    {
        Manager::checkLogin(false);
        $this->idLanguage = Manager::getConf('mfn.lang');
        $msgDir = Manager::getAppPath('conf/report');
        Manager::$msg->file = 'messages.' . $this->idLanguage . '.php';
        Manager::$msg->addMessages($msgDir);
    }

    public function main()
    {
        $this->data->isMaster = Manager::checkAccess('MASTER', A_EXECUTE) ? 'true' : 'false';
        $grapher = Manager::getAppService('grapher');
        $this->data->relationData = $grapher->getRelationData();
        $this->render();
    }

}
