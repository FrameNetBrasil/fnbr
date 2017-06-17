<?php

use fnbr\models\Base,
    fnbr\models\LU,
    fnbr\auth\models\User;

class UserController extends MController {

    public function main() {
        $this->data->query = Manager::getAppURL('', 'auth/user/gridData');
        $this->render();
    }

    public function gridData() {
        $model = new fnbr\auth\models\User();
        $criteria = $model->listForGrid($this->data->filter);
        $this->renderJSON($model->gridDataAsJSON($criteria));
    }

    public function formObject() {
        $model = new fnbr\auth\models\User($this->data->id);
        $this->data->forUpdate = ($this->data->id != '');
        $this->data->object = $model->getData();
        $this->data->object->userLevel = $model->getUserLevel();
        $this->data->title = $this->data->forUpdate ? $model->getDescription() : _M("new fnbr\auth\models\User");
        $this->data->userLevel = Base::userLevel();
        $this->data->save = "@auth/user/save/" . $model->getId() . '|formObject';
        $this->data->delete = "@auth/user/delete/" . $model->getId() . '|formObject';
        $this->render();
    }

    public function formConstraintsLU() {
        $model = new fnbr\auth\models\User($this->data->id);
        $this->data->title = $model->getLogin() . ' :: Constraints_LU';
        $this->data->save = "@auth/user/saveConstraintsLU/" . $model->getId() . '|formConstraintsLU';
        $this->render();
    }

    public function formPreferences() {
        $user = new fnbr\auth\models\User($this->data->id);
        $this->data->title = $user->getLogin() . ' :: Preferences';
        $this->data->save = "@auth/user/savePreferences|formPreferences";
        $userLevel = $user->getUserLevel();
        if ($userLevel == 'BEGINNER') {
            $this->data->isBeginner = true;
            $this->data->idJunior = $user->getConfigData('mfnJuniorUser');
            $this->data->junior = $user->getUsersOfLevel('JUNIOR');
            mdump($this->data);
        }
        if ($userLevel == 'JUNIOR') {
            $this->data->isJunior = true;
            $this->data->idSenior = $user->getConfigData('mfnSeniorUser');
            $this->data->senior = $user->getUsersOfLevel('SENIOR');
            mdump($this->data);
        }
        if ($userLevel == 'SENIOR') {
            $this->data->isSenior = true;
            $this->data->idMaster = $user->getConfigData('mfnMasterUser');
            $this->data->master = $user->getUsersOfLevel('MASTER');
            mdump($this->data);
        }
        $this->data->userLevel = $userLevel;
        $this->render();
    }

    public function formResetPassword() {
        $yes = ">auth/user/resetPassword/" . $this->data->id;
        $this->renderPrompt('question', _M("Confirm password reset?"), $yes, "");
    }

    public function save() {
        try {
            $model = new fnbr\auth\models\User($this->data->id);
            $model->setData($this->data->user);
            $model->save();
            $model->setUserLevel($this->data->user->userLevel);
            $this->renderPrompt('information', 'OK', "jQuery('#gf_LU').datagrid('reload');");
        } catch (\Exception $e) {
            $this->renderPrompt('error', $e->getMessage());
        }
    }

    public function delete() {
        try {
            $model = new fnbr\auth\models\User($this->data->id);
            $model->delete();
            $go = "!$('#formObject_dialog').dialog('close');";
            $this->renderPrompt('information', _M("Record [%s] removed.", $model->getDescription()), $go);
        } catch (\Exception $e) {
            $this->renderPrompt('error', $e->getMessage());
        }
    }

    public function getConstraintsLU() {
        $idUser = $this->data->id;
        $user = new fnbr\auth\models\User($idUser);
        $lus = $user->getConfigData('mfnConstraintsLU');
        $lu = new fnbr\models\LU();
        if (is_array($lus) && count($lus)) {
            $result = $lu->listForConstraint($lus)->asQuery()->getResult();
            foreach ($result as $row) {
                $l[] = (object) $row;
            }
            $r = $l;
        } else {
            $r = null;
        }
        $this->renderJson(json_encode($r));
    }

    public function saveConstraintsLU() {
        try {
            $user = new fnbr\auth\models\User($this->data->user->idUser);
            $lus = $user->getConfigData('mfnConstraintsLU');
            foreach ($this->data->gridfieldlu->listLU as $lu) {
                $lus[] = $lu->idLU;
            }
            $user->setConfigData('mfnConstraintsLU', $lus);
            // assign same LU to supervisor
            $userLevel = $user->getUserLevel();
            if ($userLevel == 'BEGINNER') {
                $idSupervisor = $user->getConfigData('mfnJuniorUser');
                if ($idSupervisor != '') {
                    $supervisor = new fnbr\auth\models\User($idSupervisor);
                    $lus = $supervisor->getConfigData('mfnConstraintsLU');
                    foreach ($this->data->gridfieldlu->listLU as $lu) {
                        $lus[] = $lu->idLU;
                    }
                    $supervisor->setConfigData('mfnConstraintsLU', $lus);
                }    
            }
            $this->renderPrompt('information', 'Ok');
        } catch (\Exception $e) {
            $this->renderPrompt('error', $e->getMessage());
        }
    }

    public function savePreferences() {
        try {
            $user = new fnbr\auth\models\User($this->data->user->idUser);
            $userLevel = $this->data->user->level;
            if ($userLevel == 'BEGINNER') {
                $user->setConfigData('mfnJuniorUser', $this->data->idJunior);
            } else if ($userLevel == 'JUNIOR') {
                $user->setConfigData('mfnSeniorUser', $this->data->idSenior);
            } else if ($userLevel == 'SENIOR') {
                $user->setConfigData('mfnMasterUser', $this->data->idMaster);
            }
            $user->setConfigData('mfnIdLanguage', $this->data->user->idLanguage);
            $this->renderPrompt('information', 'Ok');
        } catch (\Exception $e) {
            $this->renderPrompt('error', $e->getMessage());
        }
    }

    public function resetPassword() {
        try {
            $user = new fnbr\auth\models\User($this->data->id);
            $user->resetPassword();
            $this->renderPrompt('information', 'Ok');
        } catch (\Exception $e) {
            $this->renderPrompt('error', $e->getMessage());
        }
    }

}
