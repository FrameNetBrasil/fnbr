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



class ConstructionElementController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function formFind() {
        $ConstructionElement= new mfn\models\ConstructionElement($this->data->id);
        $filter->idConstructionElement = $this->data->idConstructionElement;
        $this->data->query = $ConstructionElement->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@ConstructionElement/save';
        $this->render();
    }

    public function formObject() {
        $this->data->ConstructionElement = ConstructionElement::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $ConstructionElement= new mfn\models\ConstructionElement($this->data->id);
        $this->data->ConstructionElement = $ConstructionElement->getData();
        
        $this->data->action = '@ConstructionElement/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $ConstructionElement = new mfn\models\ConstructionElement($this->data->id);
        $ok = '>ConstructionElement/delete/' . $ConstructionElement->getId();
        $cancelar = '>ConstructionElement/formObject/' . $ConstructionElement->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do ConstructionElement [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new mfn\models\ConstructionElement();
        $filter->idConstructionElement = $this->data->idConstructionElement;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $ConstructionElement = new mfn\models\ConstructionElement($this->data->ConstructionElement);
            $ConstructionElement->save();
            $go = '>ConstructionElement/formObject/' . $ConstructionElement->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $ConstructionElement = new mfn\models\ConstructionElement($this->data->id);
            $ConstructionElement->delete();
            $go = '>ConstructionElement/formFind';
            $this->renderPrompt('information',"ConstructionElement [{$this->data->idConstructionElement}] removido.", $go);
    }

}