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



class ParagraphController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function formFind() {
        $Paragraph= new fnbr\models\Paragraph($this->data->id);
        $filter->idParagraph = $this->data->idParagraph;
        $this->data->query = $Paragraph->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@Paragraph/save';
        $this->render();
    }

    public function formObject() {
        $this->data->Paragraph = Paragraph::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $Paragraph= new fnbr\models\Paragraph($this->data->id);
        $this->data->Paragraph = $Paragraph->getData();
        
        $this->data->action = '@Paragraph/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $Paragraph = new fnbr\models\Paragraph($this->data->id);
        $ok = '>Paragraph/delete/' . $Paragraph->getId();
        $cancelar = '>Paragraph/formObject/' . $Paragraph->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do Paragraph [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new fnbr\models\Paragraph();
        $filter->idParagraph = $this->data->idParagraph;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $Paragraph = new fnbr\models\Paragraph($this->data->Paragraph);
            $Paragraph->save();
            $go = '>Paragraph/formObject/' . $Paragraph->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $Paragraph = new fnbr\models\Paragraph($this->data->id);
            $Paragraph->delete();
            $go = '>Paragraph/formFind';
            $this->renderPrompt('information',"Paragraph [{$this->data->idParagraph}] removido.", $go);
    }

}