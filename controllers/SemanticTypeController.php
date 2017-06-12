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



class SemanticTypeController extends MController {

    public function main() {
        $this->render("formBase");
    }

    public function lookupData($rowsOnly = false, $idDomain = 0){
        $model = new mfn\models\SemanticType();
        $filter = (object) ['idDomain' => $idDomain, 'name' => $this->data->q];
        $criteria = $model->listForLookup($filter);
        $this->renderJSON($model->gridDataAsJSON($criteria, $rowsOnly));
    }

    public function lookupDataForLU($rowsOnly = false){
        $model = new mfn\models\SemanticType();
        $query = $model->listForLookupLU();
        $this->renderJSON($model->gridDataAsJSON($query, $rowsOnly));
    }
}