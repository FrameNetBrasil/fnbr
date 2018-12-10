<?php


namespace fnbr\models;

class ConstraintType extends map\ConstraintTypeMap
{

    public static function config()
    {
        return [];
    }

    public function getByEntry($entry)
    {
        $criteria = $this->getCriteria()->select('*')->where("entry = '{$entry}'");
        $this->retrieveFromCriteria($criteria);
    }

    public function listByFilter($filter)
    {
        $criteria = $this->getCriteria()->select('idConstraintType, entry, entries.name as name')->orderBy('entries.name');
        Base::entryLanguage($criteria);
        if ($filter->idConstraintType) {
            $criteria->where("idConstraintType = {$filter->idConstraint}");
        }
        if ($filter->constraint) {
            $criteria->where("upper(entries.name) LIKE upper('{$filter->type}%')");
        }
        return $criteria;
    }

}
