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

use fnbr\models\Base;

class PersonController extends MController {

    public function main()
    {
        $this->data->query = Manager::getAppURL('', 'auth/person/gridData');
        $this->render();
    }
    
    public function lookupData(){
        $model = new auth\models\Person();
        $criteria = $model->listForLookup();
        $this->renderJSON($model->gridDataAsJSON($criteria));
    }

    public function gridData()
    {
        $model = new auth\models\Person();
        $criteria = $model->listByFilter($this->data->filter);
        $this->renderJSON($model->gridDataAsJSON($criteria));
    }

    public function formObject()
    {
        $model = new auth\models\Person($this->data->id);
        $this->data->forUpdate = ($this->data->id != '');
        $this->data->object = $model->getData();
        $this->data->title = $this->data->forUpdate ? $model->getDescription() : _M("new mfn\models\Person");
        $this->data->save = "@auth/person/save/" . $model->getId() . '|formObject';
        $this->data->delete = "@auth/person/delete/" . $model->getId() . '|formObject';
        $this->render();
    }

    public function save()
    {
        try {
            $model = new auth\models\Person($this->data->id);
            $model->setData($this->data->person);
            $model->save();
            $this->renderPrompt('information', 'OK');
        } catch (\Exception $e) {
            $this->renderPrompt('error', $e->getMessage());
        }
    }

    public function delete()
    {
        try {
            $model = new auth\models\Person($this->data->id);
            $model->delete();
            $go = "!$('#formObject_dialog').dialog('close');";
            $this->renderPrompt('information', _M("Record [%s] removed.", $model->getDescription()), $go);
        } catch (\Exception $e) {
            $this->renderPrompt('error', _M("Deletion denied."));
        }
    }

}