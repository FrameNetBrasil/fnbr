<?php

use Maestro\MVC\MApp;
use Maestro\Types\MFile;



class ExportController extends MController
{

    private $idLanguage;

    public function init()
    {
        parent::init();
        $this->idLanguage = Manager::getConf('mfn.lang');
    }

    public function formExportFrames()
    {
        $this->data->query = Manager::getAppURL('', 'utils/export/gridDataFrames');
        $this->data->action = '@utils/export/exportFrames';
        $this->render();
    }
    
    public function gridDataFrames()
    {
        $model = new mfn\models\Frame();
        $criteria = $model->listByFilter($this->data->filter);
        $this->renderJSON($model->gridDataAsJSON($criteria));
    }    
    
    public function exportFrames(){
        try {
            $service = MApp::getService('', '', 'data');
            $json = $service->exportFramesToJSON($this->data->gridExportFrames->data->checked);
            $fileName = $this->data->fileName . '.json';
            $mfile = MFile::file($json, false, $fileName);
            $this->renderFile($mfile);
        } catch (EMException $e) {
            $this->renderPrompt('error',$e->getMessage());
        }
    }

    public function formExportDocWf()
    {
        $this->data->action = '@utils/export/exportDocWf';
        $this->render();
    }

    public function exportDocWf(){
        try {
            $files = \Maestro\Utils\Mutil::parseFiles('uploadFile');
            mdump($files);
            if (count($files)) {
                $service = MApp::getService('', '', 'data');
                $mfile = $service->parseDocWf($files[0]);
                $this->renderFile($mfile);
            } else {
                $this->renderPrompt('information','OK');
            }
        } catch (EMException $e) {
            $this->renderPrompt('error',$e->getMessage());
        }

    }

    public function formExportCxnFS()
    {
        $this->data->action = '@utils/export/exportCxnFS';
        $this->render();
    }

    public function exportCxnFS(){
        try {
            $service = MApp::getService('', '', 'data');
            $fs =  $service->exportCxnToFS();
            $fileName = $this->data->fileName . '.txt';
            $mfile = MFile::file($fs, false, $fileName);
            $this->renderFile($mfile);
        } catch (EMException $e) {
            $this->renderPrompt('error',$e->getMessage());
        }
    }

}
