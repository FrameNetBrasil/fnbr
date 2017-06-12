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



class LayerGroupController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function formFind() {
        $LayerGroup= new mfn\models\LayerGroup($this->data->id);
        $filter->idLayerGroup = $this->data->idLayerGroup;
        $this->data->query = $LayerGroup->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@LayerGroup/save';
        $this->render();
    }

    public function formObject() {
        $this->data->LayerGroup = LayerGroup::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $LayerGroup= new mfn\models\LayerGroup($this->data->id);
        $this->data->LayerGroup = $LayerGroup->getData();
        
        $this->data->action = '@LayerGroup/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $LayerGroup = new mfn\models\LayerGroup($this->data->id);
        $ok = '>LayerGroup/delete/' . $LayerGroup->getId();
        $cancelar = '>LayerGroup/formObject/' . $LayerGroup->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do LayerGroup [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new mfn\models\LayerGroup();
        $filter->idLayerGroup = $this->data->idLayerGroup;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $LayerGroup = new mfn\models\LayerGroup($this->data->LayerGroup);
            $LayerGroup->save();
            $go = '>LayerGroup/formObject/' . $LayerGroup->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $LayerGroup = new mfn\models\LayerGroup($this->data->id);
            $LayerGroup->delete();
            $go = '>LayerGroup/formFind';
            $this->renderPrompt('information',"LayerGroup [{$this->data->idLayerGroup}] removido.", $go);
    }

}