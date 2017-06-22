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



class LUController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function lookupData(){
        $model = new fnbr\models\LU();
        $filter = (object)[
            'fullname' => $this->data->q
        ];
        $criteria = $model->listForLookup($filter);
        $this->renderJSON($model->gridDataAsJSON($criteria));
    }

    public function lookupEquivalent(){
        $model = new fnbr\models\LU();
        $filter = (object)[
            'fullname' => $this->data->q
        ];
        $criteria = $model->listForLookup($filter);
        $this->renderJSON($model->gridDataAsJSON($criteria));
    }

    public function formFind() {
        $LU= new fnbr\models\LU($this->data->id);
        $filter->idLU = $this->data->idLU;
        $this->data->query = $LU->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@LU/save';
        $this->render();
    }

    public function formObject() {
        $this->data->LU = LU::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $LU= new fnbr\models\LU($this->data->id);
        $this->data->LU = $LU->getData();
        $this->data->action = '@LU/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $LU = new fnbr\models\LU($this->data->id);
        $ok = '>LU/delete/' . $LU->getId();
        $cancelar = '>LU/formObject/' . $LU->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do LU [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new fnbr\models\LU();
        $filter->idLU = $this->data->idLU;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $LU = new fnbr\models\LU($this->data->LU);
            $LU->save();
            $go = '>LU/formObject/' . $LU->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $LU = new fnbr\models\LU($this->data->id);
            $LU->delete();
            $go = '>LU/formFind';
            $this->renderPrompt('information',"LU [{$this->data->idLU}] removido.", $go);
    }

}