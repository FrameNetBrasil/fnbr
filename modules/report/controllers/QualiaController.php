<?php

class QualiaController extends MController
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
    }

    public function main()
    {
        $this->data->isMaster = Manager::checkAccess('MASTER', A_EXECUTE) ? 'true' : 'false';
        Manager::getSession()->idDomain = $this->data->idDomain;
        $this->render();
    }

    public function showAll() {
        $typeInstance = new fnbr\models\TypeInstance();
        $this->data->qualiaType = $typeInstance->gridDataAsJson($typeInstance->listQualiaType(), true);

        /*
        $idFrame = $this->data->id;
        $report = Manager::getAppService('reportframe');
        $frame = new fnbr\models\Frame($idFrame);
        $this->data->frame->entry = $frame->getEntryObject();
        $this->data->fe = $report->getFEData($idFrame);
        $this->data->fecoreset = $report->getFECoreSet($frame);
        $this->data->frame->entry->description = $report->decorate($this->data->frame->entry->description, $this->data->fe['styles']);
        $this->data->relations = $report->getRelations($frame);
        $this->data->lus = $report->getLUs($frame, $this->idLanguage );
        */
        $this->render();
    }
    
}
