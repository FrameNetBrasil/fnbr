<?php
/**
 *
 *
 * @category   Maestro
 * @package    UFJF
 * @subpackage fnbr
 * @copyright  Copyright (c) 2003-2012 UFJF (http://www.ufjf.br)
 * @license    http://siga.ufjf.br/license
 * @version
 * @since
 */

namespace fnbr\models;

class Construction extends map\ConstructionMap
{

    public static function config()
    {
        return array(
            'log' => array(),
            'validators' => array(
                'entry' => array('notnull'),
                'active' => array('notnull'),
                'idEntity' => array('notnull'),
            ),
            'converters' => array()
        );
    }

    public function getDescription()
    {
        return $this->getEntry();
    }

    public function getEntryObject()
    {
        $criteria = $this->getCriteria()->select('entries.name, entries.description, entries.nick');
        $criteria->where("idConstruction = {$this->getId()}");
        Base::entryLanguage($criteria);
        return $criteria->asQuery()->asObjectArray()[0];
    }

    public function getName()
    {
        $criteria = $this->getCriteria()->select('entries.name as name');
        $criteria->where("idConstruction = {$this->getId()}");
        Base::entryLanguage($criteria);
        return $criteria->asQuery()->getResult()[0]['name'];
    }

    public function getNick()
    {
        $criteria = $this->getCriteria()->select('entries.nick as nick');
        $criteria->where("idConstruction = {$this->getId()}");
        Base::entryLanguage($criteria);
        return $criteria->asQuery()->getResult()[0]['nick'];
    }

    public function getByIdEntity($idEntity)
    {
        $filter = (object)[
            'idEntity' => $idEntity
        ];
        $criteria = $this->listByFilter($filter);
        $this->retrieveFromCriteria($criteria);
    }

    public function listAll()
    {
        $criteria = $this->getCriteria()->select('*, entries.name as name')->orderBy('entries.name');
        Base::entryLanguage($criteria);
        return $criteria;
    }

    public function listByFilter($filter)
    {
        $criteria = $this->getCriteria()->select('*, entries.name as name')->orderBy('entries.name');
        Base::entryLanguage($criteria);
        if ($filter->idConstruction) {
            $criteria->where("idConstruction = {$filter->idConstruction}");
        }
        if ($filter->active == '1') {
            $criteria->where("active = 1");
        }
        if ($filter->idEntity != '') {
            $criteria->where("idEntity = {$filter->idEntity}");
        }
        if ($filter->cxn) {
            $criteria->where("upper(entries.name) LIKE upper('%{$filter->cxn}%')");
        }
        if ($filter->name) {
            $name = (strlen($filter->name) > 1) ? $filter->name : 'none';
            $criteria->where("upper(entries.name) LIKE upper('{$name}%')");
        }
        return $criteria;
    }

    public function listForLookupName($name = '')
    {
        $criteria = $this->getCriteria()->select('idConstruction,entries.name as name')->orderBy('entries.name');
        Base::entryLanguage($criteria);
        $name = (strlen($name) > 1) ? $name : 'none';
        $criteria->where("upper(entries.name) LIKE upper('{$name}%')");
        return $criteria;
    }

    public function listCE()
    {
        $ce = new ConstructionElement();
        $criteria = $ce->getCriteria()->select('idConstructionElement, entry, entries.name as name, color.rgbFg, color.rgbBg, color.idColor, idEntity');
        Base::entryLanguage($criteria);
        Base::relation($criteria, 'ConstructionElement', 'construction', 'rel_elementof');
        $criteria->where("construction.idConstruction = {$this->getId()}");
        $criteria->orderBy('entries.name');
        return $criteria;
    }

    public function listConstraints()
    {
        $constraint = new ViewConstraint();
        return $constraint->getByIdConstrained($this->getIdEntity());
    }

    public function listCEConstraints()
    {
        $idLanguage = \Manager::getSession()->idLanguage;
        $cmd = <<<HERE
SELECT ce.idEntity,  ceentries.name as name
    FROM View_ConstructionElement ce 
    JOIN entry ceentries on (ce.entry = ceentries.entry)
    WHERE ceentries.idLanguage = {$idLanguage}
    AND ce.idConstruction = {$this->getId()}
UNION
SELECT cn2.idConstraint, concat(ce1entries.name,'.',ce2entries.name) name
    FROM View_ConstructionElement ce1 
    JOIN View_Constraint cn1 on (ce1.idEntity = cn1.idConstrained)
    JOIN View_Constraint cn2 on (cn1.idConstraint = cn2.idConstrained)
    JOIN View_ConstructionElement ce2 on (cn2.idConstrainedBy = ce2.idEntity)
    JOIN entry ce1entries on (ce1.entry = ce1entries.entry)
    JOIN entry ce2entries on (ce2.entry = ce2entries.entry)
    WHERE (cn1.entry = 'rel_constraint_cxn')
    AND (cn2.entry = 'rel_constraint_element')
    AND (ce1entries.idLanguage = {$idLanguage})
    AND (ce2entries.idLanguage = {$idLanguage})
    AND (ce1.idConstruction = {$this->getId()})
UNION
SELECT cn4.idConstraint, concat(ce1entries.name,'.',ce2entries.name,'.',ce3entries.name) name
    FROM View_ConstructionElement ce1
    JOIN View_Constraint cn1 on (ce1.idEntity = cn1.idConstrained)
    JOIN View_Constraint cn2 on (cn1.idConstraint = cn2.idConstrained)
    JOIN View_ConstructionElement ce2 on (cn2.idConstrainedBy = ce2.idEntity)
    JOIN View_Constraint cn3 on (cn2.idConstraint = cn3.idConstrained)
    JOIN View_Constraint cn4 on (cn3.idConstraint = cn4.idConstrained)
    JOIN View_ConstructionElement ce3 on (cn4.idConstrainedBy = ce3.idEntity)
    JOIN entry ce1entries on (ce1.entry = ce1entries.entry)
    JOIN entry ce2entries on (ce2.entry = ce2entries.entry)
    JOIN entry ce3entries on (ce3.entry = ce3entries.entry)
    WHERE (cn1.entry = 'rel_constraint_cxn')
    AND (cn2.entry = 'rel_constraint_element')
    AND (cn3.entry = 'rel_constraint_cxn')
    AND (cn4.entry = 'rel_constraint_element')
    AND (ce1entries.idLanguage = {$idLanguage})
    AND (ce2entries.idLanguage = {$idLanguage})
    AND (ce3entries.idLanguage = {$idLanguage})
    AND (ce1.idConstruction = {$this->getId()})        

HERE;

        $result = $this->getDb()->getQueryCommand($cmd)->chunkResult('idEntity', 'name');
        return $result;
    }

    public function listDirectRelations()
    {
        $idLanguage = \Manager::getSession()->idLanguage;
        $cmd = <<<HERE

        SELECT RelationType.entry, entry_relatedCxn.name, relatedCxn.idEntity, relatedCxn.idConstruction
        FROM Construction
            INNER JOIN Entity entity1
                ON (Construction.idEntity = entity1.idEntity)
            INNER JOIN EntityRelation
                ON (entity1.idEntity = EntityRelation.idEntity1)
            INNER JOIN RelationType 
                ON (EntityRelation.idRelationType = RelationType.idRelationType)
            INNER JOIN Entity entity2
                ON (EntityRelation.idEntity2 = entity2.idEntity)
            INNER JOIN Construction relatedCxn
                ON (entity2.idEntity = relatedCxn.idEntity)
            INNER JOIN Entry entry_relatedCxn
                ON (relatedCxn.entry = entry_relatedCxn.entry)
        WHERE (Construction.idConstruction = {$this->getId()})
            AND (RelationType.entry in (
                'rel_inheritance_cxn', 'rel_inhibits'))
           AND (entry_relatedCxn.idLanguage = {$idLanguage} )
        ORDER BY RelationType.entry, entry_relatedCxn.name
            
HERE;
        $result = $this->getDb()->getQueryCommand($cmd)->treeResult('entry', 'name,idEntity,idConstruction');
        return $result;

    }

    public function listInverseRelations()
    {
        $idLanguage = \Manager::getSession()->idLanguage;
        $cmd = <<<HERE

        SELECT RelationType.entry, entry_relatedCxn.name, relatedCxn.idEntity, relatedCxn.idConstruction
        FROM Construction
            INNER JOIN Entity entity2
                ON (Construction.idEntity = entity2.idEntity)
            INNER JOIN EntityRelation
                ON (entity2.idEntity = EntityRelation.idEntity2)
            INNER JOIN RelationType 
                ON (EntityRelation.idRelationType = RelationType.idRelationType)
            INNER JOIN Entity entity1
                ON (EntityRelation.idEntity1 = entity1.idEntity)
            INNER JOIN Construction relatedCxn
                ON (entity1.idEntity = relatedCxn.idEntity)
            INNER JOIN Entry entry_relatedCxn
                ON (relatedCxn.entry = entry_relatedCxn.entry)
        WHERE (Construction.idConstruction = {$this->getId()})
            AND (RelationType.entry in (
                'rel_inheritance_cxn' ))
           AND (entry_relatedCxn.idLanguage = {$idLanguage} )
        ORDER BY RelationType.entry, entry_relatedCxn.name
            
HERE;
        $result = $this->getDb()->getQueryCommand($cmd)->treeResult('entry', 'name,idEntity,idConstruction');
        return $result;

    }

    public function listInheritanceFromRelations()
    {
        $idLanguage = \Manager::getSession()->idLanguage;
        $cmd = <<<HERE

        SELECT RelationType.entry, Entry.name, Construction.idEntity, Construction.idConstruction, Construction.entry as cxnEntry
        FROM Construction
            INNER JOIN Entity entity1
                ON (Construction.idEntity = entity1.idEntity)
            INNER JOIN EntityRelation
                ON (entity1.idEntity = EntityRelation.idEntity1)
            INNER JOIN RelationType
                ON (EntityRelation.idRelationType = RelationType.idRelationType)
            INNER JOIN Entity entity2
                ON (EntityRelation.idEntity2 = entity2.idEntity)
            INNER JOIN Construction relatedCxn
                ON (entity2.idEntity = relatedCxn.idEntity)
            INNER JOIN Entry
                ON (Entry.entry = Construction.entry)
        WHERE (relatedCxn.idConstruction = {$this->getId()})
            AND (RelationType.entry in (
                'rel_inheritance_cxn'))
           AND (Entry.idLanguage = {$idLanguage} )
        ORDER BY RelationType.entry, Entry.name

HERE;
        $result = $this->getDb()->getQueryCommand($cmd)->treeResult('entry', 'name,idEntity,idConstruction,cxnEntry');
        return $result;

    }

    public function listEvokesRelations()
    {
        $idLanguage = \Manager::getSession()->idLanguage;
        $cmd = <<<HERE

        SELECT RelationType.entry, entry_relatedFrame.name, entry_relatedFrame.nick, relatedFrame.idEntity, relatedFrame.idFrame, relatedFrame.entry as frameEntry
        FROM Construction
            INNER JOIN Entity entity1
                ON (Construction.idEntity = entity1.idEntity)
            INNER JOIN EntityRelation
                ON (entity1.idEntity = EntityRelation.idEntity1)
            INNER JOIN RelationType 
                ON (EntityRelation.idRelationType = RelationType.idRelationType)
            INNER JOIN Entity entity2
                ON (EntityRelation.idEntity2 = entity2.idEntity)
            INNER JOIN Frame relatedFrame
                ON (entity2.idEntity = relatedFrame.idEntity)
            INNER JOIN Entry entry_relatedFrame
                ON (relatedFrame.entry = entry_relatedFrame.entry)
        WHERE (Construction.idConstruction = {$this->getId()})
            AND (RelationType.entry in (
                'rel_evokes'))
           AND (entry_relatedFrame.idLanguage = {$idLanguage} )
        ORDER BY RelationType.entry, entry_relatedFrame.name
            
HERE;
        $result = $this->getDb()->getQueryCommand($cmd)->treeResult('entry', 'name,idEntity,idFrame,frameEntry');
        return $result;

    }

    public function getStructure()
    {
        $typeSystem = [
            'CX' => 'cxn',
            'FR' => 'frame',
            'FE' => 'fe',
            'CE' => 'ce'
        ];
        $idEntity = $this->getIdEntity();
        $cxnObject = (object)[
            'id' => $idEntity,
            'name' => $this->getName(),
            'entry' => $this->getEntry(),
            'type' => 'cxn',
            'abstract' => $this->getAbstract() ? true : false,
            'attributes' => (object)[],
            //'relations' => [],
        ];
        $vce = new ViewConstructionElement();
        $ces = $vce->listCEByIdConstruction($this->getId())->getResult();
        if (count($ces) == 0) {
            $cxnObject->type = 'pos';
        }
        $vc = new ViewConstraint();
        mdump('=============' . $this->getEntry());
        $d = [];
        $e = [];
        //$cxnConstraints = [];
        foreach ($ces as $ce) {
            $ceObject = (object)[];
            $ceEntry = $ce['entry'];
            $ceIdEntity = $ce['idEntity'];
            $cxnObject->attributes->$ceEntry = $ceObject;
            //$ceObject->optional = $ce['optional'] ? true : false;
            //$ceObject->type = 'ce';
            $chain = [];
            $vc->getChainByIdConstrained($ce['idEntity'], $ce['idEntity'], $chain);
            //mdump($chain);
            $d[$ceEntry] = (object)[
                //'ce' => $ce['entry'],
                'name' => $ce['name'],
                'id' => $ceIdEntity,
                'type' => 'ce',
                'optional' => $ce['optional'] ? true : false,
                'head' => $ce['head'] ? true : false,
                'multiple' => $ce['multiple'] ? true : false,
            ];
            $e[$ceIdEntity] = $ceEntry;
            //mdump($chain);
            foreach ($chain as $constraint) {
                //mdump($constraint);
                if (($constraint['relationType'] == 'rel_constraint_cxn')
                    || ($constraint['relationType'] == 'rel_constraint_element')) {

                    $j = $constraint['idConstrainedBy'];
                    $i = $constraint['idConstrained'];
                    $k = $constraint['idConstraint'];
                    $e[$j] = $constraint['entry'];
                    $d[$e[$j]] = (object)[];
                    //mdump($constraint['type']);
                    //mdump('i=' . $i . '   j=' . $j);
                    //mdump($e);
                    if ($constraint['type'] == 'CX') {
                        if ($d[$e[$i]]->value == '') {
                            $d[$e[$i]]->value = [];
                        }
                        /*
                        $d[$e[$i]]->value[] = $d[$e[$j]];
                        if (substr($constraint['name'],0,7) == 'cxn_cxn') {
                            $d[$e[$j]]->id = $j;
                        } else {
                            $d[$e[$j]]->id = $k;
                        }
                        $d[$e[$j]]->extends = $e[$j];
                        $d[$e[$j]]->attributes = (object)[];
                        */
                        $d[$e[$i]]->value[] = $e[$j];
                    }
                    if ($constraint['type'] == 'CE') {
                        $entry = $e[$j];
                        $o = $d[$e[$i]]->attributes->$entry = (object)[
                            'id' => $k,
                            'name' => $constraint['name']
                        ];
                        $d[$e[$j]] = $o;
                    }
                }
                //if ($constraint['type'] == 'LU') {
                //    $cxnConstraints[] = $constraint['idConstraint'];
                //}
            }
            //mdump($d[$ce['idEntity']]);
        }
        foreach ($ces as $ce) {
            $ceEntry = $ce['entry'];
            $ceObject = $d[$ceEntry];
            $constraints = $vc->getByIdConstrained($ce['idEntity']);
            foreach ($constraints as $constraint) {
                if (($constraint['relationType'] == 'rel_constraint_before')
                    || ($constraint['relationType'] == 'rel_constraint_meets')) {
                    if ($ceObject->constraints == '') {
                        $ceObject->constraints = (object)[];
                    }
                    $c = ($constraint['relationType'] == 'rel_constraint_before') ? 'before' : 'meets';
                    if ($ceObject->constraints->$c == '') {
                        $ceObject->constraints->$c = [];
                    }
                    $j = $constraint['idConstrainedBy'];
                    $ceObject->constraints->$c[] = $e[$j];
                }
            }
            $cxnObject->attributes->$ceEntry = $ceObject;
        }

        $chain = [];
        $vc->getChainByIdConstrained($idEntity, $idEntity, $chain);
        foreach($chain as $constrainedBy) {
            $idConstraint = $constrainedBy['idConstrainedBy'];
            if ($cxnObject->constraints == '') {
                $cxnObject->constraints = (object)[];
            }
            $constraint = $vc->getConstraintData($idConstraint);
            mdump($constraint);
            $type = $constraint->entry;
            if ($cxnObject->constraints->$type == '') {
                $cxnObject->constraints->$type = [];
            }
            $cxnObject->constraints->$type = [
                $constraint->entry,
                $constraint->idConstrained,
                $constraint->idConstrainedBy
            ];
        }

        $er = new EntityRelation();
        $vfe = new ViewFrameElement();
        $evokes = $this->listEvokesRelations();
        if (is_array($evokes['rel_evokes'])) {
            foreach ($evokes['rel_evokes'] as $frame) {
                if ($cxnObject->evokes == '') {
                    $cxnObject->evokes = (object)[];
                }
                $frameEntry = $frame['frameEntry'];
                $frameObject = $cxnObject->evokes->$frameEntry = (object)[];
                $cefeRelation = $er->listCEFERelations($idEntity, $frame['idEntity'], 'rel_evokes')->asQuery()->getResult();
                foreach ($cefeRelation as $relation) {
                    $ceEntry = $e[$relation['idEntity1']];
                    if ($frameObject->$ceEntry == '') {
                        $frameObject->$ceEntry = [];
                    }
                    $fe = $vfe->getByIdEntity($relation['idEntity2']);
                    $feEntry = $fe->entry;
                    $frameObject->$ceEntry[] = $feEntry;
                }
            }
        }

        $extends = $this->listInverseRelations();
        mdump('======================== extends');
        mdump($extends);
        if (is_array($extends['rel_inheritance_cxn'])) {
            foreach ($extends['rel_inheritance_cxn'] as $extend) {
                mdump($extend);
                if ($cxnObject->extends == '') {
                    $cxnObject->extends = [];
                }
                $parent = new Construction($extend['idConstruction']);
                $cxnObject->extends[] = $parent->getEntry();
                $ceceRelations = $er->listCERelations($extend['idEntity'],$idEntity, 'rel_inheritance_cxn')->asQuery()->getResult();
                mdump($ceceRelations);
                foreach ($ces as $ce) {
                    $ceObject = $d[$ce['entry']];
                    $ceObject->extends = [];
                    $ceIdEntity = $ce['idEntity'];
                    foreach($ceceRelations as $ceceRelation) {
                        mdump('=== ceceRelation');
                        mdump($ceceRelation);
                        if ($ceceRelation['subCE'] == $ceIdEntity) {
                            $ceObject->extends[] = $ceceRelation['superCE'];
                        }
                    }
                }
            }
        }

        $inhibits = $this->listDirectRelations();
        mdump('======================== inhibits');
        mdump($inhibits);
        if (is_array($inhibits['rel_inhibits'])) {
            foreach ($inhibits['rel_inhibits'] as $inhibit) {
                mdump($inhibit);
                if ($cxnObject->inhibits == '') {
                    $cxnObject->inhibits = [];
                }
                $inhibited = new Construction($inhibit['idConstruction']);
                $cxnObject->inhibits[] = $inhibited->getEntry();
            }
        }

        return $cxnObject;
    }

    public function save($data)
    {
        $transaction = $this->beginTransaction();
        try {
            $entity = new Entity();
            $entity->setAlias($this->getEntry());
            $entity->setType('CX');
            $entity->save();
            $entry = new Entry();
            $entry->newEntry($this->getEntry());
            $this->setIdEntity($entity->getId());
            $this->setActive(true);
            Base::entityTimelineSave($this->getIdEntity());
            parent::save();
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \Exception($e->getMessage());
        }
    }

    public function updateEntry($newEntry)
    {
        $transaction = $this->beginTransaction();
        try {
            Base::updateTimeLine($this->getEntry(), $newEntry);
            $entity = new Entity($this->getIdEntity());
            $entity->setAlias($newEntry);
            $entity->save();
            $entry = new Entry();
            $entry->updateEntry($this->getEntry(), $newEntry);
            $this->setEntry($newEntry);
            parent::save();
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \Exception($e->getMessage());
        }
    }

    public function createNew($data)
    {
        $transaction = $this->beginTransaction();
        try {
            $this->save($data);
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \Exception($e->getMessage());
        }
    }

    public function delete()
    {
        $transaction = $this->beginTransaction();
        try {
            $idEntity = $this->getIdEntity();
            // remove entry
            $entry = new Entry();
            $entry->deleteEntry($this->getEntry());
            // remove frame-relations
            Base::deleteAllEntityRelation($idEntity);
            Base::entityTimelineDelete($this->getIdEntity());
            // remove this frame
            parent::delete();
            // remove entity
            $entity = new Entity($idEntity);
            $entity->delete();
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \Exception($e->getMessage());
        }
    }

}

