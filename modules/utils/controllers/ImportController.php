<?php

class ImportController extends MController
{

    private $idLanguage;

    public function init()
    {
        //parent::init();
        $this->idLanguage = Manager::getConf('fnbr.lang');
    }

    public function formImportWSDoc()
    {
        $language = new fnbr\models\Language(); 
        $this->data->languages = $language->listAll()->asQuery()->chunkResult('idLanguage','language');
        $this->data->tags = array('N'=>'Não','S'=>'Sim');
        $this->data->action = '@utils/import/importWSDoc';
        $this->render();
    }
    
    public function importWSDoc(){
        try {
            if ($this->data->idDocument != '') {
                $files = Mutil::parseFiles('uploadFile');
                $model = new fnbr\models\Corpus($this->data->idCorpus);
                if ($this->data->tags == 'N') {
                    $model->uploadSentences($this->data, $files[0]);
                } else {
                    $model->uploadSentencesPenn($this->data, $files[0]);
                }
                $this->renderPrompt('information','Sentences loaded successfully.');
            } else {
                throw new \Exception("No Document");
            }
        } catch (\Exception $e) {
            $this->renderPrompt('error',$e->getMessage());
        }
    }
    
    public function formImportLexWf()
    {
        $language = new fnbr\models\Language(); 
        $this->data->languages = $language->listForCombo()->asQuery()->chunkResult('idLanguage','language');
        $this->data->action = '@utils/import/importLexWf';
        $this->render();
    }
    
    public function importLexWf(){
        try {
            $files = Mutil::parseFiles('uploadFile');
            $model = new fnbr\models\Lexeme();
            $model->uploadLexemeWordform($this->data, $files[0]);
            $this->renderPrompt('information','Wordforms loaded successfully.');
        } catch (EMException $e) {
            $this->renderPrompt('error',$e->getMessage());
        }
    }

    public function importLexWfOffline(){
        try {
            $model = new fnbr\models\Lexeme();
            $model->uploadLexemeWordformOffline($this->data);
            //$this->renderJSON(json_encode('ok'));
        } catch (EMException $e) {
            $this->renderJSON(json_encode('error'));
        }
    }

    public function formImportFullText()
    {
        $language = new fnbr\models\Language(); 
        $this->data->languages = $language->listAll()->asQuery()->chunkResult('idLanguage','language');
        $this->data->action = '@utils/import/importFullText';
        $this->render();
    }
    
    public function importFullText(){
        try {
            $files = Mutil::parseFiles('uploadFile');
            $model = new fnbr\models\Document($this->data->idDocument);
            $model->uploadFullText($this->data, $files[0]);
            $this->renderPrompt('information','Fulltext loaded successfully.');
        } catch (EMException $e) {
            $this->renderPrompt('error',$e->getMessage());
        }
    }
    
    public function formImportFrames()
    {
        $this->data->action = '@utils/import/importFrames';
        $this->render();
    }
    
    public function importFrames(){
        try {
            $service = Manager::getAppService('data');
            $files = Mutil::parseFiles('uploadFile');
            $json = file_get_contents($files[0]->getTmpName());
            $service->importFramesFromJSON($json);
            $this->renderPrompt('information','OK');
        } catch (EMException $e) {
            $this->renderPrompt('error',$e->getMessage());
        }
    }

    public function formImportMWE()
    {
        $language = new fnbr\models\Language();
        $this->data->languages = $language->listAll()->asQuery()->chunkResult('idLanguage','language');
        $this->data->action = '@utils/import/importMWE';
        $this->render();
    }

    public function importMWE(){
        try {
            $files = Mutil::parseFiles('uploadFile');
            $model = new fnbr\models\Lemma();
            $mfile = $model->uploadMWE($this->data, $files[0]);
            $this->renderFile($mfile);
            //$this->renderPrompt('information','OK');
        } catch (EMException $e) {
            $this->renderPrompt('error',$e->getMessage());
        }
    }

}
