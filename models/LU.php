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

class LU extends map\LUMap
{
    private $idFrame;

    public static function config()
    {
        return array(
            'log' => array(),
            'validators' => array(
                'name' => array('notnull'),
                'idEntity' => array('notnull'),
                'idLemma' => array('notnull'),
            ),
            'converters' => array()
        );
    }

    public function getIdFrame()
    {
        return $this->idFrame;
    }

    public function setIdFrame($value)
    {
        $this->idFrame = (int)$value;
    }

    public function getById($id)
    {
        parent::getById($id);
        $criteria = $this->getCriteria()->select('frame.idFrame');
        Base::relation($criteria, 'LU', 'Frame', 'rel_evokes');
        $criteria->where("idLU = {$id}");
        $result = $criteria->asQuery()->getResult();
        $this->setIdFrame($result[0]['idFrame']);
    }

    public function getByIdEntity($idEntity)
    {
        $criteria = $this->getCriteria();
        $criteria->where("idEntity = {$idEntity}");
        $this->retrieveFromCriteria($criteria);
    }

    public function getData()
    {
        $data = parent::getData();
        $data->idFrame = $this->idFrame;
        $criteria = Base::relationCriteria('LU','SemanticType','rel_hastype','SemanticType.idEntity');
        $criteria->where("LU.idEntity", "=", $this->getIdEntity());
        $idEntitySemanticType = $criteria->asQuery()->getResult()[0]['idEntity'];
        if ($idEntitySemanticType) {
            $st = new SemanticType();
            $stData = $st->getByIdEntity($idEntitySemanticType);
            $data->idSemanticType = $stData->idSemanticType;
        }
        return $data;
    }

    public function setData($data)
    {
        parent::setData($data);
        $this->idFrame = $data->idFrame;
    }

    public function getDescription()
    {
        return $this->getIdLU();
    }

    public function getFullName()
    {
        $criteria = $this->getCriteria()->select("idLU, concat(frame.entries.name,'.',name) as fullname")->orderBy('frame.entries.name,name');
        $criteria->where("idLU = {$this->getId()}");
        Base::relation($criteria, 'LU', 'Frame frame', 'rel_evokes');
        Base::entryLanguage($criteria, 'frame');
        return $criteria->asQuery()->getResult()[0]['fullname'];
    }

    public function listByFilter($filter)
    {
        $criteria = $this->getCriteria()->select('*')->orderBy('idLU');
        if ($filter->idLU) {
            if (is_array($filter->idLU)) {
                $criteria->where("idLU", "IN", $filter->idLU);
            } else {
                $criteria->where("idLU = {$filter->idLU}");
            }
        }
        return $criteria;
    }

    public function listForLookup($filter = null)
    {
        $idLanguage = \Manager::getSession()->idLanguage;
        $criteria = $this->getCriteria()->select("idLU, concat(frame.entries.name,'.',name) as fullname")->orderBy('frame.entries.name,name');
        Base::relation($criteria, 'LU', 'Frame frame', 'rel_evokes');
        Base::entryLanguage($criteria, 'frame');
        $criteria->where("lemma.idLanguage = {$idLanguage}");
        $fullname = $filter ? $filter->fullname : '';
        $fullname = (strlen($fullname) > 2) ? $fullname: '-none-';
        $criteria->where("upper(name) LIKE upper('{$fullname}%')");
        return $criteria;
    }

    public function listForLookupEquivalent($filter = null)
    {
        $criteria = $this->getCriteria()->select("idLU, concat(frame.entries.name,'.',name) as fullname")->orderBy('frame.entries.name,name');
        Base::relation($criteria, 'LU', 'Frame frame', 'rel_evokes');
        $criteria->where("lemma.idLanguage = entry.idLanguage");
        $fullname = $filter ? $filter->fullname : '';
        $fullname = (strlen($fullname) > 2) ? $fullname: '-none-';
        $criteria->where("upper(name) LIKE upper('{$fullname}%')");
        return $criteria;
    }

    public function listForConstraint($array)
    {
        $idLanguage = \Manager::getSession()->idLanguage;
        $criteria = $this->getCriteria()->select("idLU as del, idLU, concat(frame.entries.name,'.',name) as fullname")->orderBy('frame.entries.name,name');
        $criteria->where("idLU", "IN", $array);
        Base::relation($criteria, 'LU', 'Frame frame', 'rel_evokes');
        Base::entryLanguage($criteria, 'frame');
        $criteria->where("lemma.idLanguage = {$idLanguage}");
        return $criteria;
    }

    public function listConstraints()
    {
        $constraint = new ViewConstraint();
        $constraints = $constraint->listLUSTConstraints($this->getIdEntity());
        //$qualiaConstraints = $constraint->listLUQualiaConstraints($this->getIdEntity());
        //foreach ($qualiaConstraints as $qualia) {
        //    $constraints[] = $qualia;
        //}
        $domainConstraints = $constraint->listLUDomainConstraints($this->getIdEntity());
        foreach ($domainConstraints as $domain) {
            $constraints[] = $domain;
        }
        $equivalenceConstraints = $constraint->listLUEquivalenceConstraints($this->getIdEntity());
        foreach ($equivalenceConstraints as $equivalence) {
            $constraints[] = $equivalence;
        }
        $metonymyConstraints = $constraint->listLUMetonymyConstraints($this->getIdEntity());
        foreach ($metonymyConstraints as $metonymy) {
            $constraints[] = $metonymy;
        }
        return $constraints;
    }


    public function getPOS()
    {
        $lemma = $this->getLemma();
        $pos = $lemma->getPOS();
        return $pos->getPOS();
    }

    public function save($data)
    {
        $transaction = $this->beginTransaction();
        try {
            $this->setData($data);
            if (!$this->isPersistent()) {
                $entity = new Entity();
                $alias = 'lu_' . $data->name . '_' . $data->idFrame . '_' . $data->idLemma;
                $entity->getByAlias($alias);
                if ($entity->getIdEntity()) {
                    throw new \Exception("This LU already exists!.");
                } else {
                    $entity->setAlias($alias);
                    $entity->setType('LU');
                    $entity->save();
                    $this->setIdEntity($entity->getId());
                }
            }
            Base::deleteEntity1Relation($this->getIdEntity(), 'rel_hastype');
            if ($data->idSemanticType) {
                $st = new SemanticType();
                $st->getById($data->idSemanticType);
                Base::createEntityRelation($this->getIdEntity(), 'rel_hastype', $st->getIdEntity());
            }
            Base::entityTimelineSave($this->getIdEntity());
            $this->setActive(true);
            parent::save();
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
            $sc = new ViewSubCorpusLU();
            $count = count($sc->listByLU($this->getId())->asQuery()->getResult());
            if ($count > 0) {
                throw new \Exception("This LU has SubCorpus! Removal canceled.");
            }
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
    /**
     * Upload LU from simple text file
     * Line: wordform|lexeme|lemma|frame(english)
     * Parâmetro data informa: idLanguage
     * @param type $data
     * @param type $file
     */
    public function uploadLUOffline($data) {
        $idLanguage = $data->idLanguage;
        $pos = new POS();
        $POS = $pos->listAll()->asQuery()->chunkResult('idPOS','POS');
        $lexeme = new Lexeme();
        $lemma = new Lemma();
        $frame = new Frame();
        $wf = new WordForm();
        $transaction = $this->beginTransaction();
        try {
            $lineNum = 0;
            $rows = $data->rows;
            foreach ($rows as $row) {
                $lineNum++;
                $row = trim($row);
                if (($row == '') || (substr($row, 0, 2) == "//")) {
                    continue;
                }
                list($wordform, $lexemePOS, $lemmaFull, $frameName) = explode('|', $row);
                $frameEntry = 'frm_' . strtolower($frameName);
                $frame->getByEntry($frameEntry);
                $idFrame = $frame->getId();
                if ($idFrame != '') {
                    list($lexemeName, $POSName) = explode('.', $lexemePOS);
                    $line = $wordform . ' ' . $POSName . ' ' . $lexemeName;
                    list($lemmaName, $lemmaPOS) = explode('.', $lemmaFull);
                    $lemmaFullLower = $lemmaName . '.' . strtolower($lemmaPOS);
                    print_r($line . ' lemma = ' . $lemmaFullLower . "\n");

                    $lexeme->createLexemeWordform($line, $wf, $POS, $idLanguage);
                    $lemma = new Lemma();
                    $lemma->getByNameIdLanguage($lemmaFull, $idLanguage);
                    $lemmaIdPOS = array_search($lemmaPOS, $POS);
                    $luData = (object)[];
                    $luData->POS = $POS;
                    $luData->lemma = (object)[
                        'name' => $lemmaFullLower,
                        'idPOS' => $lemmaIdPOS,
                        'idLanguage' => $idLanguage
                    ];
                    $luData->lexemes = [
                        $lexemeName => (object)[
                            'POS' => $POSName,
                            'headWord' => true,
                            'breakBefore' => false
                        ]
                    ];
                    $luData->lu = (object)[
                        'idFrame' => $idFrame
                    ];
                    print_r($luData);
                    $lemma->saveForLU($luData);

                }
            }
            $transaction->commit();
        } catch (\Exception $e) {
            // rollback da transação em caso de algum erro
            $transaction->rollback();
            print_r($e->getMessage() . ' LineNum: '. $lineNum);
            throw new \Exception($e->getMessage() . ' LineNum: '. $lineNum);
        }
    }

}
