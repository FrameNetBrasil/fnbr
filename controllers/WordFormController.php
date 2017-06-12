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



class WordFormController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function formFind() {
        $WordForm= new mfn\models\WordForm($this->data->id);
        $filter->idWordForm = $this->data->idWordForm;
        $this->data->query = $WordForm->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@WordForm/save';
        $this->render();
    }

    public function formObject() {
        $this->data->WordForm = WordForm::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $WordForm= new mfn\models\WordForm($this->data->id);
        $this->data->WordForm = $WordForm->getData();
        
        $this->data->action = '@WordForm/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $WordForm = new mfn\models\WordForm($this->data->id);
        $ok = '>WordForm/delete/' . $WordForm->getId();
        $cancelar = '>WordForm/formObject/' . $WordForm->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do WordForm [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new mfn\models\WordForm();
        $filter->idWordForm = $this->data->idWordForm;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $WordForm = new mfn\models\WordForm($this->data->WordForm);
            $WordForm->save();
            $go = '>WordForm/formObject/' . $WordForm->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $WordForm = new mfn\models\WordForm($this->data->id);
            $WordForm->delete();
            $go = '>WordForm/formFind';
            $this->renderPrompt('information',"WordForm [{$this->data->idWordForm}] removido.", $go);
    }

}