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



class EntityRelationController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function formFind() {
        $EntityRelation= new fnbr\models\EntityRelation($this->data->id);
        $filter->idEntityRelation = $this->data->idEntityRelation;
        $this->data->query = $EntityRelation->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@EntityRelation/save';
        $this->render();
    }

    public function formObject() {
        $this->data->EntityRelation = EntityRelation::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $EntityRelation= new fnbr\models\EntityRelation($this->data->id);
        $this->data->EntityRelation = $EntityRelation->getData();
        
        $this->data->action = '@EntityRelation/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $EntityRelation = new fnbr\models\EntityRelation($this->data->id);
        $ok = '>EntityRelation/delete/' . $EntityRelation->getId();
        $cancelar = '>EntityRelation/formObject/' . $EntityRelation->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do EntityRelation [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new fnbr\models\EntityRelation();
        $filter->idEntityRelation = $this->data->idEntityRelation;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $EntityRelation = new fnbr\models\EntityRelation($this->data->EntityRelation);
            $EntityRelation->save();
            $go = '>EntityRelation/formObject/' . $EntityRelation->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $EntityRelation = new fnbr\models\EntityRelation($this->data->id);
            $EntityRelation->delete();
            $go = '>EntityRelation/formFind';
            $this->renderPrompt('information',"EntityRelation [{$this->data->idEntityRelation}] removido.", $go);
    }

}