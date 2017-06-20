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

class ViewConstraint extends map\ViewConstraintMap
{
    public $prefix = [
        'rel_constraint_frame' => 'frm',
        'rel_constraint_semtype' => 'sem',
        'rel_constraint_cxn' => 'cxn',
        'rel_constraint_framefamily' => 'fam',
        'rel_constraint_before' => 'bef',
        'rel_constraint_meets' => 'mee',
        'rel_constraint_element' => 'ele',
        'rel_constraint_constraint' => 'cnt',
        'rel_constitutive_qualia' => 'cst',
        'rel_agentive_qualia' => 'agt',
        'rel_telic_qualia' => 'tlc',
        'rel_formal_qualia' => 'fml',
        'rel_evokes' => 'evk',
        'rel_hasdomain' => 'dom',
        'rel_luequivalence' => 'equ',
    ];

    public $type = [
        'rel_constraint_frame' => 'FR',
        'rel_constraint_semtype' => 'ST',
        'rel_constraint_cxn' => 'CX',
        'rel_constraint_framefamily' => 'FR',
        'rel_constraint_before' => 'CE',
        'rel_constraint_meets' => 'CE',
        'rel_constraint_element' => 'CE',
        'rel_constraint_constraint' => 'CN',
        'rel_constitutive_qualia' => 'LU',
        'rel_agentive_qualia' => 'LU',
        'rel_telic_qualia' => 'LU',
        'rel_formal_qualia' => 'LU',
        'rel_evokes' => 'FR',
        'rel_hasdomain' => 'DO',
        'rel_luequivalence' => 'LU',
    ];

    public static function config()
    {
        return [];
    }

    public function getByIdConstrained($idConstrained)
    {

        $idLanguage = \Manager::getSession()->idLanguage;

        $cmd = <<<HERE
        SELECT c.idConstraint, c.idConstrained, c.idConstrainedBy, c.entry,
            ifnull(e2fe.name, ifnull(e2ce.name, ifnull(e2se.name, ifnull(e2ce2.name, e2cne.name)))) AS name,
            ifnull(e2fe.entry, ifnull(e2ce.entry, ifnull(e2se.entry, ifnull(e2ce2.entry, e2cne.entry)))) AS cxEntry,
            ifnull(e2fe.nick, ifnull(e2ce.nick, ifnull(e2se.nick, ifnull(e2ce2.nick, e2cne.nick)))) AS nick
        FROM View_Constraint c
        LEFT JOIN View_FrameElement e1fe ON (c.idConstrained = e1fe.idEntity)
        LEFT JOIN View_Construction e1ce ON (c.idConstrained = e1ce.idEntity)
        LEFT JOIN View_Frame e2f ON (c.idConstrainedBy = e2f.idEntity)
        LEFT JOIN View_EntryLanguage e2fe ON (e2f.entry = e2fe.entry)
        LEFT JOIN View_Construction e2c ON (c.idConstrainedBy = e2c.idEntity)
        LEFT JOIN View_EntryLanguage e2ce ON (e2c.entry = e2ce.entry)
        LEFT JOIN View_SemanticType e2s ON (c.idConstrainedBy = e2s.idEntity)
        LEFT JOIN View_EntryLanguage e2se ON (e2s.entry = e2se.entry)
        LEFT JOIN View_ConstructionElement e2cel ON (c.idConstrainedBy = e2cel.idEntity)
        LEFT JOIN View_EntryLanguage e2ce2 ON (e2cel.entry = e2ce2.entry)
        LEFT JOIN View_Constraint e2cn ON (c.idConstrainedBy = e2cn.idConstraint)
        LEFT JOIN View_EntryLanguage e2cne ON (e2cn.entry = e2cne.entry)
        WHERE (c.idConstrained = {$idConstrained})
            AND ((e2fe.idLanguage = {$idLanguage}) or (e2fe.idLanguage is null))
            AND ((e2ce.idLanguage = {$idLanguage}) or (e2ce.idLanguage is null))
            AND ((e2se.idLanguage = {$idLanguage}) or (e2se.idLanguage is null))
            AND ((e2ce2.idLanguage = {$idLanguage}) or (e2ce2.idLanguage is null))
            AND ((e2cne.idLanguage = {$idLanguage}) or (e2cne.idLanguage is null))

HERE;
        $query = $this->getDb()->getQueryCommand($cmd);
        $constraints = $query->getResult();
        foreach ($constraints as $i => $constraint) {
            $constraints[$i]['name'] = $this->prefix[$constraint['entry']] . '_' . $constraints[$i]['name'];
            $constraints[$i]['type'] = $this->type[$constraint['entry']];
            $constraints[$i]['entry'] = $constraint['cxEntry'];
        }
        return $constraints;
    }

    public function getChainByIdConstrained($idConstrained, $idConstrainedBase, &$chain)
    {
        $constraints = $this->getByIdConstrained($idConstrained);
        foreach($constraints as $constraint) {
            $chain[] = [
                'idConstrained' => $idConstrainedBase,//$constraint['idConstrained'],
                'idConstrainedBy' => $constraint['idConstrainedBy'],
                'name' => $constraint['name'],
                'entry' => $constraint['entry'],
                'nick' => $constraint['nick'],
                'type' => $constraint['type']
            ];
            $this->getChainByIdConstrained($constraint['idConstraint'], $constraint['idConstrainedBy'], $chain);
        }
    }

    public function hasChild($idConstraint)
    {
        $cmd = <<<HERE
        SELECT c.idConstraint
        FROM View_Constraint c
        WHERE (c.idConstrained = {$idConstraint})
HERE;
        return count($this->getDb()->getQueryCommand($cmd)->getResult()) > 0;
    }

    public function getConstraintData($idConstraint)
    {
        $cmd = <<<HERE
        SELECT *
        FROM View_Constraint
        WHERE (idConstraint = {$idConstraint})
HERE;
        return (object)$this->getDb()->getQueryCommand($cmd)->getResult()[0];
    }

    public function listLUSTConstraints($idEntityLU)
    {
        $idLanguage = \Manager::getSession()->idLanguage;

        $cmd = <<<HERE
        SELECT r.idEntity2 as idConstraint,
            e.name  AS name
        FROM View_Relation r
        JOIN SemanticType st ON (r.idEntity2 = st.idEntity)
        JOIN Entry e ON (st.entry = e.entry)
        WHERE (r.idEntity1 = {$idEntityLU})
            AND (r.relationType = 'rel_hassemtype')
            AND (e.idLanguage = {$idLanguage})

HERE;
        $query = $this->getDb()->getQueryCommand($cmd);
        $constraints = $query->getResult();
        foreach ($constraints as $i => $constraint) {
            $constraints[$i]['name'] = $this->prefix['rel_constraint_semtype'] . '_' . $constraints[$i]['name'];
            $constraints[$i]['type'] = $this->type['rel_constraint_semtype'];
        }
        return $constraints;
    }

    public function listLUQualiaConstraints($idEntityLU)
    {
        $idLanguage = \Manager::getSession()->idLanguage;

        $cmd = <<<HERE
        SELECT r.idEntity2 as idConstraint,
            relatedLU.name  AS name,
            r.relationtype  AS qualia
        FROM View_Relation r
        JOIN LU relatedLU ON (r.idEntity2 = relatedLU.idEntity)
        WHERE (r.idEntity1 = {$idEntityLU})
            AND (r.relationGroup = 'rgp_qualia')

HERE;
        $query = $this->getDb()->getQueryCommand($cmd);
        $constraints = $query->getResult();
        foreach ($constraints as $i => $constraint) {
            $constraints[$i]['name'] = $this->prefix[$constraint['qualia']] . '_' . $constraints[$i]['name'];
            $constraints[$i]['type'] = $this->type[$constraint['qualia']];
        }
        return $constraints;
    }

    public function listLUEquivalenceConstraints($idEntityLU)
    {
        $idLanguage = \Manager::getSession()->idLanguage;

        $cmd = <<<HERE
        SELECT r.idEntity2 as idConstraint,
            relatedLU.name  AS name,
            r.relationtype  AS equivalence
        FROM View_Relation r
        JOIN LU relatedLU ON (r.idEntity2 = relatedLU.idEntity)
        WHERE (r.idEntity1 = {$idEntityLU})
            AND (r.relationType = 'rel_luequivalence')

HERE;
        $query = $this->getDb()->getQueryCommand($cmd);
        $constraints = $query->getResult();
        foreach ($constraints as $i => $constraint) {
            $constraints[$i]['name'] = $this->prefix[$constraint['equivalence']] . '_' . $constraints[$i]['name'];
            $constraints[$i]['type'] = $this->type[$constraint['equivalence']];
        }
        return $constraints;
    }

    public function listLUDomainConstraints($idEntityLU)
    {
        $idLanguage = \Manager::getSession()->idLanguage;

        $cmd = <<<HERE
        SELECT r.idEntity2 as idConstraint,
            relatedLU.name  AS name,
            r.relationtype  AS domain
        FROM View_Relation r
        JOIN LU relatedLU ON (r.idEntity2 = relatedLU.idEntity)
        WHERE (r.idEntity1 = {$idEntityLU})
            AND (r.relationType = 'rel_hasdomain')

HERE;
        $query = $this->getDb()->getQueryCommand($cmd);
        $constraints = $query->getResult();
        foreach ($constraints as $i => $constraint) {
            $constraints[$i]['name'] = $this->prefix[$constraint['domain']] . '_' . $constraints[$i]['name'];
            $constraints[$i]['type'] = $this->type[$constraint['domain']];
        }
        return $constraints;
    }

    public function listConstraintsCN($idConstraint)
    {
        $idLanguage = \Manager::getSession()->idLanguage;

        $cmd = <<<HERE
        SELECT c2.idConstrained, c2.idConstrainedBy,
            e2ce1.name ce1Name,
            e2ce2.name ce2Name
        FROM View_Constraint c1
        JOIN View_Constraint c2 ON (c1.idConstrainedBy = c2.idConstraint)
        LEFT JOIN View_ConstructionElement ce1 ON (c2.idConstrained = ce1.idEntity)
        LEFT JOIN View_EntryLanguage e2ce1 ON (ce1.entry = e2ce1.entry)
        LEFT JOIN View_ConstructionElement ce2 ON (c2.idConstrainedBy = ce2.idEntity)
        LEFT JOIN View_EntryLanguage e2ce2 ON (ce2.entry = e2ce2.entry)
        WHERE (c1.idConstraint = {$idConstraint})
            AND ((e2ce1.idLanguage = {$idLanguage}) or (e2ce1.idLanguage is null))
            AND ((e2ce2.idLanguage = {$idLanguage}) or (e2ce2.idLanguage is null))

HERE;
        $query = $this->getDb()->getQueryCommand($cmd);
        $constraint = $query->getResult()[0];
        $constraints[0]['name'] = $constraint['ce1Name'];
        $constraints[1]['name'] = $constraint['ce2Name'];
        return $constraints;
    }

}
