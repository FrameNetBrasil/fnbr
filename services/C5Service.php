<?php

require __DIR__ . '/../modules/c5/ws/vendor/autoload.php';

class C5Service extends MService
{

    public function fullActivation()
    {
        mdump($this->data);
        $cxn = new fnbr\models\Construction();
        $cxn->getById($this->data->idCxn);
        $cpt = new fnbr\models\Concept();
        $idConcepts = [];
        foreach($this->data->idConcept as $idConcept) {
            $cpt->getById($idConcept);
            $idConcepts[] = $cpt->getIdEntity();
        }
        $c5 = new C5\Service\C5Service();
        $c5->setIdConcepts($idConcepts);
        return $c5->fullActivation($cxn->getIdEntity());
    }

    public function fullActivationQuery()
    {
        mdump($this->data);
        $cxn = new fnbr\models\Construction();
        $cxn->getById($this->data->idCxn);
        $cpt = new fnbr\models\Concept();
        $idConcepts = [];
        foreach($this->data->idConcept as $idConcept) {
            $cpt->getById($idConcept);
            $idConcepts[] = $cpt->getIdEntity();
        }
        $c5 = new C5\Service\C5Service();
        $c5->setIdConcepts($idConcepts);
        $cxnNodes = $c5->fullActivationQuery($cxn->getIdEntity());
        mdump($cxnNodes);
        return '';
    }

}
