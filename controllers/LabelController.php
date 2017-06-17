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



class LabelController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function formFind() {
        $Label= new fnbr\models\Label($this->data->id);
        $filter->idLabel = $this->data->idLabel;
        $this->data->query = $Label->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@Label/save';
        $this->render();
    }

    public function formObject() {
        $this->data->Label = Label::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $Label= new fnbr\models\Label($this->data->id);
        $this->data->Label = $Label->getData();
        
        $this->data->action = '@Label/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $Label = new fnbr\models\Label($this->data->id);
        $ok = '>Label/delete/' . $Label->getId();
        $cancelar = '>Label/formObject/' . $Label->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do Label [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new fnbr\models\Label();
        $filter->idLabel = $this->data->idLabel;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $Label = new fnbr\models\Label($this->data->Label);
            $Label->save();
            $go = '>Label/formObject/' . $Label->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $Label = new fnbr\models\Label($this->data->id);
            $Label->delete();
            $go = '>Label/formFind';
            $this->renderPrompt('information',"Label [{$this->data->idLabel}] removido.", $go);
    }

}