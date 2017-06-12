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



class ColorController extends MController {

    public function main() {
        $this->render("formBase");
    }
    
    public function lookupData(){
        $model = new mfn\models\Color();
        $colors = $model->listForLookup()->asQuery()->getResult(\FETCH_ASSOC);
        $data = [];
        foreach($colors as $color) {
            $style = 'background-color:#' . $color['rgbBg'] . ';color:#' . $color['rgbFg'] . ';';
            $decorated = "<span style='{$style}'>" . $color['name'] . "</span>";            
            $data[] = (object) [
                'idColor' => $color['idColor'],
                'decorated' => $decorated,
                'name' => $color['name']
            ];
        }
        $this->renderJSON(json_encode($data));
    }
    

    public function formFind() {
        $Color= new mfn\models\Color($this->data->id);
        $filter->idColor = $this->data->idColor;
        $this->data->query = $Color->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function formNew() {
        $this->data->action = '@Color/save';
        $this->render();
    }

    public function formObject() {
        $this->data->Color = Color::create($this->data->id)->getData();
        $this->render();
    }

    public function formUpdate() {
        $Color= new mfn\models\Color($this->data->id);
        $this->data->Color = $Color->getData();
        
        $this->data->action = '@Color/save/' .  $this->data->id;
        $this->render();
    }

    public function formDelete() {
        $Color = new mfn\models\Color($this->data->id);
        $ok = '>Color/delete/' . $Color->getId();
        $cancelar = '>Color/formObject/' . $Color->getId();
        $this->renderPrompt('confirmation', "Confirma remoção do Color [{$model->getDescription()}] ?", $ok, $cancelar);
    }

    public function lookup() {
        $model = new mfn\models\Color();
        $filter->idColor = $this->data->idColor;
        $this->data->query = $model->listByFilter($filter)->asQuery();
        $this->render();
    }

    public function save() {
            $Color = new mfn\models\Color($this->data->Color);
            $Color->save();
            $go = '>Color/formObject/' . $Color->getId();
            $this->renderPrompt('information','OK',$go);
    }

    public function delete() {
            $Color = new mfn\models\Color($this->data->id);
            $Color->delete();
            $go = '>Color/formFind';
            $this->renderPrompt('information',"Color [{$this->data->idColor}] removido.", $go);
    }

}