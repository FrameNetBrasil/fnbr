<?php

class LemmaController extends MController
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

    public function lemmaTree()
    {
        $structure = Manager::getAppService('structurelemma');
        if ($this->data->id == '') {
            $children = $structure->listLemmas($this->data, $this->idLanguage);
            $data = (object)[
                'id' => 'root',
                'state' => 'open',
                'iconCls' => 'icon-blank fa fa-sitemap fa16px entity_lemma',
                'text' => 'Lemmas',
                'children' => $children
            ];
            $json = json_encode([$data]);
        } elseif ($this->data->id{0} == 'l') {
            $json = $structure->listLemmaLexeme(substr($this->data->id, 1), $this->idLanguage);
        }
        $this->renderJson($json);
    }

    public function formNewLemma()
    {
        $this->data->idLanguage = $this->idLanguage;
        $this->data->save = "@structure/lemma/newLemma|formNewLemma";
        $this->data->close = "!$('#formNewLemma_dialog').dialog('close');";
        $this->render();
    }

    public function newLemma()
    {
        try {
            $model = new fnbr\models\Lemma();
            $model->saveData($this->data->lemma);
            $this->renderResponse('ok', 'Lemma created.');
        } catch (\Exception $e) {
            $this->renderResponse('error', $e->getMessage());
        }
    }

    public function formUpdateLemma()
    {
        $model = new fnbr\models\Lemma($this->data->id);
        $this->data->object = $model->getData();
        $this->data->title = 'Lemma: ' . $model->getEntry() . '  [' . $model->getName() . ']';
        $this->render();
    }

    public function updateLemma()
    {
        try {
            $model = new fnbr\models\Lemma($this->data->lemma->idLemma);
            $model->updateEntry($this->data->lemma->entry);
            $this->renderResponse('ok', 'Lemma updated.');
        } catch (\Exception $e) {
            $this->renderResponse('error', $e->getMessage());
        }
    }

    public function formDeleteLemma()
    {
        $ok = ">structure/lemma/deleteLemma/" . $this->data->id;
        $this->renderPrompt('confirmation', 'Atenção: O Lemma e todos os LemmaElements serão removidos! Continua?', $ok);
    }

    public function deleteLemma()
    {
        try {
            $structure = Manager::getAppService('structurelemma');
            $structure->deleteLemma($this->data->id);
            $this->renderResponse('information', 'OK', "!structure.reloadLemma();");
        } catch (\Exception $e) {
            $this->renderResponse('error', $e->getMessage());
        }

    }

    public function formNewLemmaElement()
    {
        $this->data->idLemma = $this->data->id;
        $model = new fnbr\models\Lemma($this->data->idLemma);
        $this->data->lemma = $model->getEntry() . '  [' . $model->getName() . ']';
        $this->data->save = "@structure/lemma/newLemmaElement|formNewLemmaElement";
        $this->data->close = "!$('#formNewLemmaElement_dialog').dialog('close');";
        $this->data->title = _M('new LemmaElement');
        $this->render();
    }

    public function newLemmaElement()
    {
        try {
            $model = new fnbr\models\LemmaElement();
            $this->data->lemmaelement->entry = 'fe_' . $this->data->lemmaelement->entry;
            $model->setData($this->data->lemmaelement);
            $model->save($this->data->lemmaelement);
            $this->renderPrompt('information', 'OK', "structure.editEntry('{$this->data->lemmaelement->entry}');");
        } catch (\Exception $e) {
            $this->renderPrompt('error', $e->getMessage());
        }
    }


    public function formUpdateLemmaElement()
    {
        $model = new fnbr\models\LemmaElement($this->data->id);
        $this->data->object = $model->getData();
        $this->data->save = "@structure/lemma/updateLemmaElement|formUpdateLemmaElement";
        $this->data->close = "!$('#formUpdateLemmaElement_dialog').dialog('close');";
        $this->data->title = 'LemmaElement: ' . $model->getEntry() . '  [' . $model->getName() . ']';
        $this->render();
    }

    public function updateLemmaElement()
    {
        try {
            $model = new fnbr\models\LemmaElement($this->data->lemmaelement->idLemmaElement);
            $model->updateEntry($this->data->lemmaelement->entry);
            $model->setData($this->data->lemmaelement);
            $model->save($this->data->lemmaelement);
            $this->renderPrompt('information', 'OK', "structure.editEntry('{$this->data->lemmaelement->entry}');");
        } catch (\Exception $e) {
            $this->renderPrompt('error', $e->getMessage());
        }
    }

    public function formDeleteLemmaElement()
    {
        $ok = "^structure/lemma/deleteLemmaElement/" . $this->data->id;
        $this->renderPrompt('confirmation', 'Warning: LemmaElement will be removed! Continue?', $ok);
    }

    public function deleteLemmaElement()
    {
        try {
            $model = new fnbr\models\LemmaElement($this->data->id);
            $model->safeDelete();
            $this->renderPrompt('information', 'LemmaElement removed.', "!structure.reloadLemma();");
        } catch (\Exception $e) {
            $this->renderPrompt('error', $e->getMessage());
        }
    }


}
