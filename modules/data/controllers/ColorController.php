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
        $model = new fnbr\models\Color();
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

}