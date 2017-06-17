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



class AnnotationSetController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function formFind() {
        $AnnotationSet= new fnbr\models\AnnotationSet($this->data->id);
        $filter->idAnnotationSet = $this->data->idAnnotationSet;
        $this->data->query = $AnnotationSet->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@AnnotationSet/save';
        $this->render();
    }

    public function formObject() {
        $this->data->AnnotationSet = AnnotationSet::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $AnnotationSet= new fnbr\models\AnnotationSet($this->data->id);
        $this->data->AnnotationSet = $AnnotationSet->getData();
        
        $this->data->action = '@AnnotationSet/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $AnnotationSet = new fnbr\models\AnnotationSet($this->data->id);
        $ok = '>AnnotationSet/delete/' . $AnnotationSet->getId();
        $cancelar = '>AnnotationSet/formObject/' . $AnnotationSet->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do AnnotationSet [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new fnbr\models\AnnotationSet();
        $filter->idAnnotationSet = $this->data->idAnnotationSet;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $AnnotationSet = new fnbr\models\AnnotationSet($this->data->AnnotationSet);
            $AnnotationSet->save();
            $go = '>AnnotationSet/formObject/' . $AnnotationSet->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $AnnotationSet = new fnbr\models\AnnotationSet($this->data->id);
            $AnnotationSet->delete();
            $go = '>AnnotationSet/formFind';
            $this->renderPrompt('information',"AnnotationSet [{$this->data->idAnnotationSet}] removido.", $go);
    }

}