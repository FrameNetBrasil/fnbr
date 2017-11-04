<?php

class ConstraintController extends MController {

    public function lookupDataByCE(){
        $constraint = new fnbr\models\Constraint($this->data->id);
        $constraintData = $constraint->getConstraintData();
        $constraint->setIdEntity($constraintData->idConstrainedBy);
        $constraints = $constraint->listConstraints();
        mdump($constraints);
        $data = [];
        $cxn = new fnbr\models\Construction();
        foreach($constraints as $cn) {
            if ($cn['relationType'] == 'rel_constraint_cxn') {
                $cxn->getByIdEntity($cn['idConstrainedBy']);
                $data[] = [
                    'idConstruction' => $cxn->getId(),
                    'name' => $cxn->getName()
                ];
            }
            
        }
        mdump($data);
        $this->renderJSON($constraint->gridDataAsJSON($data));
    }


}