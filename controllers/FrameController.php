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



class FrameController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function lookupData(){
        $model = new mfn\models\Frame();
        $criteria = $model->listForLookupName($this->data->q);
        $this->renderJSON($model->gridDataAsJSON($criteria));
    }

    public function formFind() {
        $Frame= new mfn\models\Frame($this->data->id);
        $filter->idFrame = $this->data->idFrame;
        $this->data->query = $Frame->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@Frame/save';
        $this->render();
    }

    public function formObject() {
        $this->data->Frame = Frame::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $Frame= new mfn\models\Frame($this->data->id);
        $this->data->Frame = $Frame->getData();
        
        $this->data->action = '@Frame/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $Frame = new mfn\models\Frame($this->data->id);
        $ok = '>Frame/delete/' . $Frame->getId();
        $cancelar = '>Frame/formObject/' . $Frame->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do Frame [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new mfn\models\Frame();
        $filter->idFrame = $this->data->idFrame;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $Frame = new mfn\models\Frame($this->data->Frame);
            $Frame->save();
            $go = '>Frame/formObject/' . $Frame->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $Frame = new mfn\models\Frame($this->data->id);
            $Frame->delete();
            $go = '>Frame/formFind';
            $this->renderPrompt('information',"Frame [{$this->data->idFrame}] removido.", $go);
    }

}