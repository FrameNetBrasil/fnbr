<?php

class ConstructionController extends MController {

    public function lookupData(){
        $model = new fnbr\models\Construction();
        $criteria = $model->listForLookupName($this->data->q);
        $this->renderJSON($model->gridDataAsJSON($criteria));
    }

    /*


    public function main() {
        $this->render("formBase");
    }

    public function formFind() {
        $Construction= new fnbr\models\Construction($this->data->id);
        $filter->idConstruction = $this->data->idConstruction;
        $this->data->query = $Construction->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@Construction/save';
        $this->render();
    }

    public function formObject() {
        $this->data->Construction = Construction::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $Construction= new fnbr\models\Construction($this->data->id);
        $this->data->Construction = $Construction->getData();
        
        $this->data->action = '@Construction/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $Construction = new fnbr\models\Construction($this->data->id);
        $ok = '>Construction/delete/' . $Construction->getId();
        $cancelar = '>Construction/formObject/' . $Construction->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do Construction [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new fnbr\models\Construction();
        $filter->idConstruction = $this->data->idConstruction;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $Construction = new fnbr\models\Construction($this->data->Construction);
            $Construction->save();
            $go = '>Construction/formObject/' . $Construction->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $Construction = new fnbr\models\Construction($this->data->id);
            $Construction->delete();
            $go = '>Construction/formFind';
            $this->renderPrompt('information',"Construction [{$this->data->idConstruction}] removido.", $go);
    }
    */

}