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



class LayerTypeController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function formFind() {
        $LayerType= new mfn\models\LayerType($this->data->id);
        $filter->idLayerType = $this->data->idLayerType;
        $this->data->query = $LayerType->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@LayerType/save';
        $this->render();
    }

    public function formObject() {
        $this->data->LayerType = LayerType::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $LayerType= new mfn\models\LayerType($this->data->id);
        $this->data->LayerType = $LayerType->getData();
        
        $this->data->action = '@LayerType/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $LayerType = new mfn\models\LayerType($this->data->id);
        $ok = '>LayerType/delete/' . $LayerType->getId();
        $cancelar = '>LayerType/formObject/' . $LayerType->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do LayerType [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new mfn\models\LayerType();
        $filter->idLayerType = $this->data->idLayerType;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $LayerType = new mfn\models\LayerType($this->data->LayerType);
            $LayerType->save();
            $go = '>LayerType/formObject/' . $LayerType->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $LayerType = new mfn\models\LayerType($this->data->id);
            $LayerType->delete();
            $go = '>LayerType/formFind';
            $this->renderPrompt('information',"LayerType [{$this->data->idLayerType}] removido.", $go);
    }

}