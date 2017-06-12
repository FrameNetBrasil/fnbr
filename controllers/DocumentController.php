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



class DocumentController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function lookupData(){
        $model = new mfn\models\Document();
        $criteria = $model->listForLookup($this->data->q);
        $this->renderJSON($model->gridDataAsJSON($criteria));
    }
    
    public function formFind() {
        $Document= new mfn\models\Document($this->data->id);
        $filter->idDocument = $this->data->idDocument;
        $this->data->query = $Document->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@Document/save';
        $this->render();
    }

    public function formObject() {
        $this->data->Document = Document::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $Document= new mfn\models\Document($this->data->id);
        $this->data->Document = $Document->getData();
        
        $this->data->action = '@Document/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $Document = new mfn\models\Document($this->data->id);
        $ok = '>Document/delete/' . $Document->getId();
        $cancelar = '>Document/formObject/' . $Document->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do Document [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new mfn\models\Document();
        $filter->idDocument = $this->data->idDocument;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $Document = new mfn\models\Document($this->data->Document);
            $Document->save();
            $go = '>Document/formObject/' . $Document->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $Document = new mfn\models\Document($this->data->id);
            $Document->delete();
            $go = '>Document/formFind';
            $this->renderPrompt('information',"Document [{$this->data->idDocument}] removido.", $go);
    }

}