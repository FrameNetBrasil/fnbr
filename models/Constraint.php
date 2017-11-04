<?php

/**
 *
 *
 * @category   Maestro
 * @package    UFJF
 *  @subpackage fnbr
 * @copyright  Copyright (c) 2003-2012 UFJF (http://www.ufjf.br)
 * @license    http://siga.ufjf.br/license
 * @version
 * @since
 */

namespace fnbr\models;

class Constraint extends map\EntityMap
{

    public static function config()
    {
        return [];
    }

    public function delete()
    {
        $transaction = $this->beginTransaction();
        try {
            $view = new ViewConstraint();
            $data = $view->getConstraintData($this->getId());
            mdump($data);
            if ($data->entry == 'rel_constraint_constraint') {
                Base::deleteAllEntityRelation($data->idConstrainedBy);
                $entity = new Entity($data->idConstrainedBy);
                $entity->delete();
            }
            // remove relations
            Base::deleteAllEntityRelation($this->getId());
            // remove this entity
            parent::delete();
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \Exception($e->getMessage());
        }
    }

    public function getConstraintData() {
        $view = new ViewConstraint();
        return $view->getConstraintData($this->getId());
    }

    public function listConstraints()
    {
        $constraint = new ViewConstraint();
        return $constraint->getByIdConstrained($this->getId());
    }

    public function listConstraintsCN()
    {
        $constraint = new ViewConstraint();
        $cn = $constraint->listConstraintsCNCE($this->getId());
        if ($cn[0]['name'] == '') {
            $cn = $constraint->listConstraintsCNCN($this->getId());
        }
        return $cn;
    }

    public function deleteConstraintLU($idEntityLU, $idEntityConstraint) {
        $er = new EntityRelation();
        $transaction = $er->beginTransaction();
        $criteria = $er->getDeleteCriteria();
        $criteria->where("idEntity1 = {$idEntityLU}");
        $criteria->where("idEntity2 = {$idEntityConstraint}");
        $criteria->delete();
        $transaction->commit();
    }

    public function deleteConstraintMetonymyFEFE($idEntity1FE, $idEntity2FE) {
        Base::deleteEntityRelation($idEntity1FE, 'rel_festandsforfe', $idEntity2FE);
    }

    public function deleteConstraintMetonymyFELU($idEntityFE, $idEntityLU) {
        Base::deleteEntityRelation($idEntityFE, 'rel_festandsforlu', $idEntityLU);
    }
}
