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



class LemmaController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function lookupData(){
        if (strlen($this->data->q) < 3) {
            $json = json_encode([]);
        } else {
            $model = new mfn\models\Lemma();
            $criteria = $model->listForLookup($this->data->q);
            $json = $model->gridDataAsJSON($criteria);
        }
        $this->renderJSON($json);
    }
    
    public function formFind() {
        $Lemma= new mfn\models\Lemma($this->data->id);
        $filter->idLemma = $this->data->idLemma;
        $this->data->query = $Lemma->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@Lemma/save';
        $this->render();
    }

    public function formObject() {
        $this->data->Lemma = Lemma::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $Lemma= new mfn\models\Lemma($this->data->id);
        $this->data->Lemma = $Lemma->getData();
        
        $this->data->action = '@Lemma/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $Lemma = new mfn\models\Lemma($this->data->id);
        $ok = '>Lemma/delete/' . $Lemma->getId();
        $cancelar = '>Lemma/formObject/' . $Lemma->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do Lemma [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new mfn\models\Lemma();
        $filter->idLemma = $this->data->idLemma;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $Lemma = new mfn\models\Lemma($this->data->Lemma);
            $Lemma->save();
            $go = '>Lemma/formObject/' . $Lemma->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $Lemma = new mfn\models\Lemma($this->data->id);
            $Lemma->delete();
            $go = '>Lemma/formFind';
            $this->renderPrompt('information',"Lemma [{$this->data->idLemma}] removido.", $go);
    }

}