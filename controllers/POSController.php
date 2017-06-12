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



class POSController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function formFind() {
        $POS= new mfn\models\POS($this->data->id);
        $filter->idPOS = $this->data->idPOS;
        $this->data->query = $POS->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@POS/save';
        $this->render();
    }

    public function formObject() {
        $this->data->POS = POS::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $POS= new mfn\models\POS($this->data->id);
        $this->data->POS = $POS->getData();
        
        $this->data->action = '@POS/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $POS = new mfn\models\POS($this->data->id);
        $ok = '>POS/delete/' . $POS->getId();
        $cancelar = '>POS/formObject/' . $POS->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do POS [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new mfn\models\POS();
        $filter->idPOS = $this->data->idPOS;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $POS = new mfn\models\POS($this->data->POS);
            $POS->save();
            $go = '>POS/formObject/' . $POS->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $POS = new mfn\models\POS($this->data->id);
            $POS->delete();
            $go = '>POS/formFind';
            $this->renderPrompt('information',"POS [{$this->data->idPOS}] removido.", $go);
    }

}