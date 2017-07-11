<?php

class CorpusController extends MController
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

    public function reportCorpus()
    {
        $this->data->idCorpus = $this->data->id;
        $corpus = new fnbr\models\Corpus($this->data->idCorpus);
        $this->data->title = $corpus->getName();
        $this->render();
    }

    public function reportDocument()
    {
        $this->data->idDocument = $this->data->id;
        $document = new fnbr\models\Document($this->data->idDocument);
        $this->data->title = $document->getName();
        $this->render();
    }
}
