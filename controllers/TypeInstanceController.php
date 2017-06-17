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



class TypeInstanceController extends MController {

    public function main() {
        $this->render("formBase");
    }
    
    public function lookupCoreType() {
        $model = new fnbr\models\TypeInstance();
        $result = $model->listCoreType()->asQuery()->getResult(\FETCH_ASSOC);
        $this->renderJSON($model->gridDataAsJSON($result));
    }

    public function lookupStatusType() {
        $model = new fnbr\models\TypeInstance();
        $result = $model->listStatusType()->asQuery()->getResult(\FETCH_ASSOC);
        mdump($result);
        $this->renderJSON($model->gridDataAsJSON($result));
    }

    public function lookupBFF() {
        $model = new fnbr\models\TypeInstance();
        $result = $model->listBFF()->asQuery()->getResult(\FETCH_ASSOC);
        $this->renderJSON($model->gridDataAsJSON($result));
    }

    public function formFind() {
        $TypeInstance= new fnbr\models\TypeInstance($this->data->id);
        $filter->idTypeInstance = $this->data->idTypeInstance;
        $this->data->query = $TypeInstance->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@TypeInstance/save';
        $this->render();
    }

    public function formObject() {
        $this->data->TypeInstance = TypeInstance::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $TypeInstance= new fnbr\models\TypeInstance($this->data->id);
        $this->data->TypeInstance = $TypeInstance->getData();
        
        $this->data->action = '@TypeInstance/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $TypeInstance = new fnbr\models\TypeInstance($this->data->id);
        $ok = '>TypeInstance/delete/' . $TypeInstance->getId();
        $cancelar = '>TypeInstance/formObject/' . $TypeInstance->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do TypeInstance [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new fnbr\models\TypeInstance();
        $filter->idTypeInstance = $this->data->idTypeInstance;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $TypeInstance = new fnbr\models\TypeInstance($this->data->TypeInstance);
            $TypeInstance->save();
            $go = '>TypeInstance/formObject/' . $TypeInstance->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $TypeInstance = new fnbr\models\TypeInstance($this->data->id);
            $TypeInstance->delete();
            $go = '>TypeInstance/formFind';
            $this->renderPrompt('information',"TypeInstance [{$this->data->idTypeInstance}] removido.", $go);
    }

}