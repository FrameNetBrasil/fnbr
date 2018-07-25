<?php

class CxnController extends MController
{

    private $idLanguage;

    public function init()
    {
        parent::init();
        $this->idLanguage = Manager::getSession()->idLanguage;
    }

    public function main()
    {
        $this->data->isMaster = Manager::checkAccess('MASTER', A_EXECUTE) ? 'true' : 'false';
        $domain = new fnbr\models\Domain();
        $this->data->domain = $domain->gridDataAsJson($domain->listForSelection(), true);
        $this->render();
    }

    public function cxnTree()
    {
        $structure = Manager::getAppService('structurecxn');
        if ($this->data->id == '') {
            $children = $structure->listCxns($this->data, $this->idLanguage);
            $data = (object) [
                        'id' => 'root',
                        'state' => 'open',
                        'text' => 'Constructions',
                        'children' => $children
            ];
            $json = json_encode([$data]);
        } elseif ($this->data->id{0} == 'c') {
            //$json = $structure->listCEs(substr($this->data->id, 1), $this->idLanguage);
            $json = $structure->listCEsConstraintsCX(substr($this->data->id, 1), $this->idLanguage);
        } elseif ($this->data->id{0} == 'e') {
            $json = $structure->listConstraintsCE(substr($this->data->id, 1), $this->idLanguage);
        } elseif ($this->data->id{0} == 'x') {
            $json = $structure->listConstraintsCN(substr($this->data->id, 1), $this->idLanguage);
        } elseif ($this->data->id{0} == 'n') {
            $json = $structure->listConstraintsCNCN(substr($this->data->id, 1), $this->idLanguage);
        }
        $this->renderJson($json);
    }

    public function formNewCxn()
    {
        $this->data->title = _M('new Construction');
        $this->render();
    }

    public function formUpdateCxn()
    {
        $model = new fnbr\models\Construction($this->data->id);
        $this->data->object = $model->getData();
        $this->data->title = 'Construction: ' . $model->getEntry() . '  [' . $model->getName() . ']';
        $this->render();
    }

    public function formDeleteCxn()
    {
        $ok = ">structure/cxn/deleteCxn/" . $this->data->id;
        $this->renderPrompt('confirmation', 'Atenção: A Cxn e todos os CxnElements serão removidos! Continua?', $ok);
    }
    
    public function formNewCxnElement()
    {
        $this->data->idConstruction = $this->data->id;
        $model = new fnbr\models\Construction($this->data->idConstruction);
        $this->data->cxn = $model->getEntry() . '  [' . $model->getName() . ']';
        $this->data->save = "@structure/cxn/newCxnElement|formNewCxnElement";
        $this->data->close = "!$('#formNewCxnElement_dialog').dialog('close');";
        $this->data->title = _M('new Construction Element');
        $this->render();
    }

    public function formUpdateCxnElement()
    {
        $model = new fnbr\models\ConstructionElement($this->data->id);
        $this->data->object = $model->getData();
        mdump($this->data);
        $this->data->save = "@structure/cxn/updateCxnElement|formUpdateCxnElement";
        $this->data->close = "!$('#formUpdateCxnElement_dialog').dialog('close');";
        $this->data->title = 'CxnElement: ' . $model->getEntry() . '  [' . $model->getName() . ']';
        $this->render();
    }

    public function formDeleteCxnElement()
    {
        $ok = "^structure/cxn/deleteCxnElement/" . $this->data->id;
        $this->renderPrompt('confirmation', 'Atenção: O CxnElement será removido! Continua?', $ok);
    }

    public function newCxn()
    {
        try {
            $model = new fnbr\models\Construction();
            $this->data->cxn->entry = 'cxn_' . strtolower(str_replace('cxn_','',$this->data->cxn->entry));
            $model->setData($this->data->cxn);
            $model->createNew($this->data->cxn);
            $this->renderResponse('ok', 'Construction created.');
        } catch (\Exception $e) {
            $this->renderResponse('error', $e->getMessage());
        }
    }

    public function updateCxn()
    {
        try {
            $model = new fnbr\models\Construction($this->data->cxn->idConstruction);
            $model->setData($this->data->cxn);
            $model->updateEntry($this->data->cxn->entry);
            $this->renderResponse('information', 'OK');
//            $this->renderPrompt('information', 'Cxn updated.', "structure.editEntry('{$this->data->cxn->entry}');");            
        } catch (\Exception $e) {
            $this->renderResponse('error', $e->getMessage());
        }
    }

    public function deleteCxn() {
        try {
            $structure = Manager::getAppService('structurecxn');
            $structure->deleteCxn($this->data->id);
            $this->renderPrompt('information', 'Cxn deleted.');
        } catch (\Exception $e) {
            $this->renderPrompt('error', "Não é possível remover esta construção.");
        }
        
    }
    
    public function newCxnElement()
    {
        try {
            $model = new fnbr\models\ConstructionElement();
            $this->data->cxnelement->entry = 'ce_' . strtolower(str_replace('ce_', '', $this->data->cxnelement->entry));
            $model->setData($this->data->cxnelement);
            $model->save($this->data->cxnelement);
            $this->renderPrompt('information', 'OK', "structure.editEntry('{$this->data->cxnelement->entry}');");
        } catch (\Exception $e) {
            $this->renderPrompt('error', $e->getMessage());
        }
    }

    public function updateCxnElement()
    {
        try {
            $model = new fnbr\models\ConstructionElement($this->data->cxnelement->idConstructionElement);
            $model->updateEntry($this->data->cxnelement->entry);
            $model->setData($this->data->cxnelement);
            $model->save($this->data->cxnelement);
            $this->renderPrompt('information', 'OK', "structure.editEntry('{$this->data->cxnelement->entry}');");
        } catch (\Exception $e) {
            $this->renderPrompt('error', $e->getMessage());
        }
    }

    public function deleteCxnElement() {
        try {
            $structure = Manager::getAppService('structurecxn');
            $structure->deleteCxnElement($this->data->id);
            $this->renderPrompt('information', 'CxnElement deleted.',"!structure.reloadCxnParent();");
        } catch (\Exception $e) {
            $this->renderPrompt('error', "Não é possível remover este elemento.");
        }

    }

    public function formImportTxt()
    {
        $model = new fnbr\models\Construction($this->data->id);
        $this->data->cxn = $model->getEntry() . '  [' . $model->getName() . ']';
        $this->data->languages = fnbr\models\Base::languages();
        $this->data->message = _M("Importing from a plain text file - one sentence by line.");
        $this->data->save = "@structure/cxn/importTxt|formImportTxt";
        $this->data->close = "!$('#formImportTxt_dialog').dialog('close')";
        $this->render();
    }

    public function importTxt()
    {
        try {
            $files = Mutil::parseFiles('uploadFile');
            $model = new fnbr\models\Corpus();
            $result = $model->uploadCxnSimpleText($this->data, $files[0]);
            $this->renderPrompt('information', 'OK');
        } catch (EMException $e) {
            $this->renderPrompt('error', $e->getMessage());
        }
    }

    public function formCxnDomain()
    {
        $model = new fnbr\models\Construction($this->data->id);
        $this->data->object = $model->getData();
        $this->data->idConstruction = $model->getIdConstruction();
        $this->data->form = "formCxnDomain";
        $this->data->close = "!$('#formCxnDomain_dialog').dialog('close');";
        $this->data->title = 'Cxn: ' . $model->getEntry() . '  [' . $model->getName() . ']';
        $this->render();
    }

    public function formAddConstraintCX()
    {
        $this->data->idConstruction = $this->data->id;
        $cxn = new fnbr\models\Construction($this->data->idConstruction);
        $this->data->cxn = 'Cxn: ' . $cxn->getName();
        $this->data->ces = $cxn->listCEConstraints();
        mdump($this->data->ces);
        $this->data->relations = ['rel_evokes' => 'rel_evokes'];
        mdump($this->data->relations);
        $this->data->save = "@structure/cxn/addConstraintCX|formAddConstraintCX";
        $this->data->close = "!$('#formAddConstraintCX_dialog').dialog('close');";
        $this->data->title = _M('Add Constraint Cxn');
        $this->render();
    }

    public function formAddConstraintCE()
    {
        $this->data->idConstructionElement = $this->data->id;
        $model = new fnbr\models\ConstructionElement($this->data->idConstructionElement);
        $cxn = $model->getConstruction();
        $this->data->ce = 'CE: ' . $cxn->getName() . '.' . $model->getName();
        $this->data->siblingsCE = $model->listSiblingsCE()->chunkResult('idConstructionElement', 'name');
        $this->data->save = "@structure/cxn/addConstraintCE|formAddConstraintCE";
        $this->data->close = "!$('#formAddConstraintCE_dialog').dialog('close');";
        $this->data->title = _M('Add Constraint CE');
        $this->render();
    }

    public function formAddConstraintCN()
    {
        $this->data->idConstraint = $this->data->id;
        $model = new fnbr\models\Constraint($this->data->idConstraint);
        $constraintData = $model->getConstraintData();
        //mdump($constraintData);
        $this->data->showCxnCE = $this->data->showCE = false;
        if ($constraintData->constrainedByType == 'CX') {
            $this->data->showCxnCE = true;
            $ce = new fnbr\models\ViewConstructionElement();
            $this->data->cxnCE =  $ce->listCEByConstructionEntity($constraintData->idConstrainedBy)->chunkResult('idConstructionElement', 'name');;
        }
        if ($constraintData->constrainedByType == 'CE') {
            $this->data->showCE = true;
        }
        $this->data->save = "@structure/cxn/addConstraintCN|formAddConstraintCN";
        $this->data->close = "!$('#formAddConstraintCN_dialog').dialog('close');";
        $this->data->title = _M('Add Constraint to Constraint');
        $this->render();
    }

    public function formAddConstraintCXNew()
    {
        $this->data->idConstruction = $this->data->id;
        $cxn = new fnbr\models\Construction($this->data->idConstruction);
        $this->data->cxn = 'Cxn: ' . $cxn->getName();
        $this->data->ces = $cxn->listCEConstraints();
        mdump($this->data->ces);
        $this->data->relations = ['rel_evokes' => 'rel_evokes'];
        mdump($this->data->relations);
        $this->data->save = "@structure/cxn/addConstraintCX|formAddConstraintCX";
        $this->data->close = "!$('#formAddConstraintCX_dialog').dialog('close');";
        $this->data->title = $this->data->title = 'Cxn: ' . $cxn->getName() . '  [' . $cxn->getEntry() . ']: Add Constraints';
        $this->render();
    }


    public function formDeleteConstraint()
    {
        $structure = Manager::getAppService('structureconstraints');
        $hasChild = $structure->constraintHasChild($this->data->id);
        if (!$hasChild) {
            $ok = "^structure/cxn/deleteConstraint/" . $this->data->id;
            $this->renderPrompt('confirmation', 'Warning: Constraint will be deleted! Continue?', $ok);
        } else {
            $this->renderPrompt('error', "This constraint has children; it can't be deleted!");
        }
    }

    public function addConstraintCX() {
        mdump($this->data);
        try {
            $structure = Manager::getAppService('structurecxn');
            $structure->addConstraintsCX($this->data);
            $this->renderPrompt('information', 'Constraint added.');
        } catch (\Exception $e) {
            $this->renderPrompt('error', "Add Constraint failed." . $e->getMessage());
        }
    }

    public function addConstraintCE() {
        mdump($this->data);
        try {
            $structure = Manager::getAppService('structurecxn');
            $structure->addConstraintsCE($this->data);
            $this->renderPrompt('information', 'Constraint added.');
        } catch (\Exception $e) {
            $this->renderPrompt('error', "Add Constraint failed.");
        }
    }

    public function addConstraintCN() {
        mdump($this->data);
        try {
            $structure = Manager::getAppService('structurecxn');
            $structure->addConstraintsCN($this->data);
            $this->renderPrompt('information', 'Constraint added.');
        } catch (\Exception $e) {
            $this->renderPrompt('error', "Add Constraint failed.");
        }
    }

    public function addConstraintCXNew() {
        mdump($this->data);
        try {
            $structure = Manager::getAppService('structurecxn');
            $this->renderPrompt('information', 'Constraint added.');
        } catch (\Exception $e) {
            $this->renderPrompt('error', "Add Constraint failed." . $e->getMessage());
        }
    }

    public function deleteConstraint() {
        try {
            $model = fnbr\models\Constraint::create($this->data->id);
            $model->delete();
            $this->renderPrompt('information', 'Constraint deleted.', "!structure.reloadCxnParent();");
        } catch (\Exception $e) {
            $this->renderPrompt('error', "Delete Constraint failed.","!structure.reloadCxn();");
        }
    }

    public function graphCxn() {
        $this->data->isMaster = Manager::checkAccess('MASTER', A_EXECUTE) ? 'true' : 'false';
        $cxn = fnbr\models\Construction::create($this->data->id);
        $this->data->cxnName = $cxn->getName();
        $grapher = Manager::getAppService('grapher');
        $this->data->relationData = $grapher->getRelationData();
        $this->data->relationEntry = MUtil::php2js($this->data->relationData);

        $this->render();
    }

}
