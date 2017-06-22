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



class TypeController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function formFind() {
        $Type= new fnbr\models\Type($this->data->id);
        $filter->idType = $this->data->idType;
        $this->data->query = $Type->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@Type/save';
        $this->render();
    }

    public function formObject() {
        $this->data->Type = Type::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $Type= new fnbr\models\Type($this->data->id);
        $this->data->Type = $Type->getData();
        
        $this->data->action = '@Type/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $Type = new fnbr\models\Type($this->data->id);
        $ok = '>Type/delete/' . $Type->getId();
        $cancelar = '>Type/formObject/' . $Type->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do Type [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new fnbr\models\Type();
        $filter->idType = $this->data->idType;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $Type = new fnbr\models\Type($this->data->Type);
            $Type->save();
            $go = '>Type/formObject/' . $Type->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $Type = new fnbr\models\Type($this->data->id);
            $Type->delete();
            $go = '>Type/formFind';
            $this->renderPrompt('information',"Type [{$this->data->idType}] removido.", $go);
    }

}