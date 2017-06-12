<?php
/**
 * $_comment
 *
 * @category   Maestro
 * @package    UFJF
 * @subpackage $_package
 * @copyright  Copyright (c) 2003-2012 UFJF (http://www.ufjf.br)
 * @license    http://siga.ufjf.br/license
 * @version    
 * @since      
 */



class CorpusController extends MController {

    public function main() {
        $this->render("formBase");
    }
    
    public function lookupData(){
        $model = new mfn\models\Corpus();
        $criteria = $model->listAll();
        $this->renderJSON($model->gridDataAsJSON($criteria));
    }
    

    public function formFind() {
        $Corpus= new mfn\models\Corpus($this->data->id);
        $filter->idCorpus = $this->data->idCorpus;
        $this->data->query = $Corpus->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@Corpus/save';
        $this->render();
    }

    public function formObject() {
        $this->data->Corpus = Corpus::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $Corpus= new mfn\models\Corpus($this->data->id);
        $this->data->Corpus = $Corpus->getData();
        
        $this->data->action = '@Corpus/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $Corpus = new mfn\models\Corpus($this->data->id);
        $ok = '>Corpus/delete/' . $Corpus->getId();
        $cancelar = '>Corpus/formObject/' . $Corpus->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do Corpus [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new mfn\models\Corpus();
        $filter->idCorpus = $this->data->idCorpus;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $Corpus = new mfn\models\Corpus($this->data->Corpus);
            $Corpus->save();
            $go = '>Corpus/formObject/' . $Corpus->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $Corpus = new mfn\models\Corpus($this->data->id);
            $Corpus->delete();
            $go = '>Corpus/formFind';
            $this->renderPrompt('information',"Corpus [{$this->data->idCorpus}] removido.", $go);
    }

}