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



class EntityController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function formFind() {
        $Entity= new mfn\models\Entity($this->data->id);
        $filter->idEntity = $this->data->idEntity;
        $this->data->query = $Entity->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@Entity/save';
        $this->render();
    }

    public function formObject() {
        $this->data->Entity = Entity::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $Entity= new mfn\models\Entity($this->data->id);
        $this->data->Entity = $Entity->getData();
        
        $this->data->action = '@Entity/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $Entity = new mfn\models\Entity($this->data->id);
        $ok = '>Entity/delete/' . $Entity->getId();
        $cancelar = '>Entity/formObject/' . $Entity->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do Entity [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new mfn\models\Entity();
        $filter->idEntity = $this->data->idEntity;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $Entity = new mfn\models\Entity($this->data->Entity);
            $Entity->save();
            $go = '>Entity/formObject/' . $Entity->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $Entity = new mfn\models\Entity($this->data->id);
            $Entity->delete();
            $go = '>Entity/formFind';
            $this->renderPrompt('information',"Entity [{$this->data->idEntity}] removido.", $go);
    }

}