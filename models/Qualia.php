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

class Qualia extends map\QualiaMap
{

    public static function config()
    {
        return array(
            'log' => array(),
            'validators' => array(
                'info' => array('notnull'),
                'idEntity' => array('notnull'),
            ),
            'converters' => array()
        );
    }

    public function getDescription()
    {
        return $this->getInfo();
    }

    public function getTypeFromRelation($relation) {
        $type = [
            'rel_qualia_formal' => 'qla_formal',
            'rel_qualia_agentive' => 'qla_agentive',
            'rel_qualia_telic' => 'qla_telic',
            'rel_qualia_constitutive' => 'qla_constitutive'
        ];
        $relationEntry = $relation->getRelationtype()->getEntry();
        return $type[$relationEntry];
    }

    public function listByFilter($filter)
    {
        $criteria = $this->getCriteria()->select('*')->orderBy('idTypeInstance');
        if ($filter->idTypeInstance) {
            $criteria->where("idTypeInstance LIKE '{$filter->idTypeInstance}%'");
        }
        return $criteria;
    }

    public function listByFrame($idFrame, $idLanguage = '')
    {
        $cmd = <<<HERE
        SELECT q.idQualia, concat(t.entry, ' [',q.info,']') name
        FROM Qualia q
        JOIN TypeInstance t on (q.idTypeInstance = t.idTypeInstance)
        JOIN View_Relation r on (r.idEntity1 = q.idEntity)
        JOIN Frame f on (r.idEntity2 = f.idEntity)
        WHERE (r.relationType = 'rel_qualia_frame') 
          AND (f.idFrame = {$idFrame})
        ORDER BY t.entry

HERE;
        $result = $this->getDb()->getQueryCommand($cmd)->chunkResult('idQualia', 'name');
        return $result;
    }

    public function listFEs($idLanguage = '1')
    {
        $idQualia = $this->getId();
        $cmd = <<<HERE
        SELECT fe.idFrameElement, concat('lu1: ',e.name) name
        FROM Qualia q
        JOIN View_Relation r on (r.idEntity1 = q.idEntity)
        JOIN FrameElement fe on (r.idEntity2 = fe.idEntity)
        JOIN Entry e on (fe.entry = e.entry)
        WHERE (r.relationType = 'rel_qualia_lu1_fe') 
          AND (q.idQualia = {$idQualia})
          AND (e.idLanguage = {$idLanguage})
        UNION
        SELECT fe.idFrameElement, concat('lu2: ',e.name) name
        FROM Qualia q
        JOIN View_Relation r on (r.idEntity1 = q.idEntity)
        JOIN FrameElement fe on (r.idEntity2 = fe.idEntity)
        JOIN Entry e on (fe.entry = e.entry)
        WHERE (r.relationType = 'rel_qualia_lu2_fe') 
          AND (q.idQualia = {$idQualia})
          AND (e.idLanguage = {$idLanguage})

HERE;
        $result = $this->getDb()->getQueryCommand($cmd)->chunkResult('idFrameElement', 'name');
        return $result;
    }

    public function listForLookup($type, $idLanguage = '1')
    {
        $whereType = ($type == '*') ? '' : "AND (t.entry = '{$type}')";
        $name= ($type == '*') ? "concat(substr(t.entry,5,10),': ', q.info, ' [',e.name,']') name" : "concat(q.info, ' [',e.name,']') name";
        $cmd = <<<HERE
        SELECT q.idQualia, {$name}
        FROM Qualia q
        JOIN TypeInstance t on (q.idTypeInstance = t.idTypeInstance)
        JOIN View_Relation r on (r.idEntity1 = q.idEntity)
        JOIN Frame f on (r.idEntity2 = f.idEntity)
        JOIN Entry e on (f.entry = e.entry)
        WHERE (r.relationType = 'rel_qualia_frame')  {$whereType}
          AND (e.idLanguage = {$idLanguage})
        ORDER BY t.entry, q.info

HERE;
        $query = $this->getDb()->getQueryCommand($cmd);
        return $query;
    }

    public function listForGrid($data, $idLanguage = '1')
    {
        $whereType = ($data->idQualiaType == '') ? '' : "AND (t.idTypeInstance = {$data->idQualiaType})";
        $whereFrame = ($data->frame == '') ? '' : "AND (upper(e.name) like upper('{$data->frame}%'))";
        $cmd = <<<HERE
SELECT q.idQualia, et.name qualiaType, e.name frame, e1.name fe1, e2.name fe2
  FROM Qualia q
  JOIN TypeInstance t on (q.idTypeInstance = t.idTypeInstance)
  JOIN Entry et on (t.entry = et.entry)
  JOIN View_Relation r on (r.idEntity1 = q.idEntity)
  JOIN Frame f on (r.idEntity2 = f.idEntity)
  JOIN Entry e on (f.entry = e.entry)
  JOIN View_Relation r1 on (r1.idEntity1 = q.idEntity)
  JOIN FrameElement fe1 on (r1.idEntity2 = fe1.idEntity)
  JOIN Entry e1 on (fe1.entry = e1.entry)
  JOIN View_Relation r2 on (r2.idEntity1 = q.idEntity)
  JOIN FrameElement fe2 on (r2.idEntity2 = fe2.idEntity)
  JOIN Entry e2 on (fe2.entry = e2.entry)
        WHERE (r.relationType = 'rel_qualia_frame') 
          AND (r1.relationType = 'rel_qualia_lu1_fe')
          AND (r2.relationType = 'rel_qualia_lu2_fe')
          {$whereType} {$whereFrame}
          AND (e.idLanguage = {$idLanguage})
          AND (e1.idLanguage = {$idLanguage})
          AND (e2.idLanguage = {$idLanguage})
          AND (et.idLanguage = {$idLanguage})
        ORDER BY 2,3,4

HERE;
        $query = $this->getDb()->getQueryCommand($cmd);
        return $query;
    }

    public function listLUQualia($idLU)
    {
        $constraint = new ViewConstraint();
        $lu = new LU($idLU);
        $qualiaConstraints = $constraint->listLUQualiaConstraints($lu->getIdEntity());
        foreach ($qualiaConstraints as $qualia) {
            $constraints[] = $qualia;
        }
        return $constraints;
    }

    public function saveData($data)
    {
        $transaction = $this->beginTransaction();
        try {
            $frame = new Frame($data->idFrame);
            $alias = $data->type . '_' . $data->idFrame . '_' . $data->idFE1 . '_' . $data->idFE2;
            $entity = new Entity();
            $entity->setAlias($alias);
            $entity->setType('QR');  // Qualia Relation
            $entity->save();
            Base::createEntityRelation($entity->getId(), 'rel_qualia_frame', $frame->getIdEntity());
            $fe1 = new FrameElement($data->idFE1);
            $fe2 = new FrameElement($data->idFE2);
            Base::createEntityRelation($entity->getId(), 'rel_qualia_lu1_fe', $fe1->getIdEntity());
            Base::createEntityRelation($entity->getId(), 'rel_qualia_lu2_fe', $fe2->getIdEntity());
            $this->setIdEntity($entity->getId());
            Base::entityTimelineSave($this->getIdEntity());
            $typeInstance = new TypeInstance();
            $this->setIdTypeInstance($typeInstance->getIdQualiaTypeByEntry($data->type));
            $this->setInfo($data->info);
            parent::save();
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \Exception($e->getMessage());
        }
    }

    public function saveRelation($data)
    {
        $transaction = $this->beginTransaction();
        try {
            $lu1 = new LU($data->idLU1);
            $lu2 = new LU($data->idLU2);
            $this->getById($data->idQualia);
            $relationType = [
                'qla_formal' => 'rel_qualia_formal',
                'qla_agentive' => 'rel_qualia_agentive',
                'qla_telic' => 'rel_qualia_telic',
                'qla_constitutive' => 'rel_qualia_constitutive',
            ];
            Base::createEntityRelation($lu1->getIdEntity(), $relationType[$data->type], $lu2->getIdEntity(), $this->getIdEntity());
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
            Base::entityTimelineDelete($idEntity);
            Base::deleteAllEntityRelation($idEntity);
            parent::delete();
            $entity = new Entity($idEntity);
            $entity->delete();
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \Exception($e->getMessage());
        }
    }

    public function deleteRelation($idRelation)
    {
        $transaction = $this->beginTransaction();
        try {
            $relation = new EntityRelation($idRelation);
            $relation->delete();
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \Exception($e->getMessage());
        }
    }

    public function updateRelation($idRelation)
    {
        $transaction = $this->beginTransaction();
        try {
            $relation = new EntityRelation($idRelation);
            $relation->setIdEntity3($this->getIdEntity());
            $relation->save();
            $transaction->commit();
        } catch (\Exception $e) {
            $transaction->rollback();
            throw new \Exception($e->getMessage());
        }
    }
}
