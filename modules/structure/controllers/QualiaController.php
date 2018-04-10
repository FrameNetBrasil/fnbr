<?php

class QualiaController extends MController
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
        $this->data->isAnno = 'false';
        $this->render();
    }

    public function formQualiaFormal()
    {
        $this->data->title = 'Formal Qualia';
        $this->data->qualiaType = 'qla_formal';
        $this->data->idFrame = $this->data->id;
        $frame = new fnbr\models\Frame($this->data->idFrame);
        $this->data->frame = $frame->getEntry() . '  [' . $frame->getName() . ']';
        $this->data->close = "!$('#formQualia_dialog').dialog('close');";
        $this->data->save = "@structure/qualia/newQualia|formQualia";
        $this->render('formQualia');
    }

    public function newQualia()
    {
        try {
            $model = new fnbr\models\Qualia();
            $model->saveData($this->data->qualia);
            $this->renderPrompt('ok', 'Qualia created.',"!$('#formQualia_dialog').dialog('close');");
        } catch (\Exception $e) {
            $this->renderPrompt('error', $e->getMessage());
        }
    }

    public function formDeleteQualia()
    {
        $ok = "^structure/qualia/deleteQualia/" . $this->data->id;
        $this->renderPrompt('confirmation', 'Atenção: A estrutura qualia será removida! Continua?', $ok);
    }

    public function deleteQualia()
    {
        try {
            $model = new fnbr\models\Qualia($this->data->id);
            $model->delete();
            $this->renderPrompt('information', 'OK', "!structure.reloadRoot();");
        } catch (\Exception $e) {
            $this->renderPrompt('error', $e->getMessage());
        }

    }


}
