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

class ViewAnnotationSet extends map\ViewAnnotationSetMap {

    public static function config()
    {
        return [];
    }

    public function listBySubCorpus($idSubCorpus, $sortable = NULL) {
        $criteria = $this->getCriteria()->
        select('idAnnotationSet, idSentence, sentence.text, entries.name as annotationStatus, idAnnotationStatus, annotationstatustype.color.rgbBg')->
        where("idSubCorpus = {$idSubCorpus}");
        if ($sortable) {
            if ($sortable->field == 'status') {
                $criteria->orderBy('entries.name ' . $sortable->order);
            }
        }
        Base::entryLanguage($criteria);
        return $criteria;
    }

    public function listSentencesByAS($idAnnotationSet) {
        $criteria = $this->getCriteria()->
        select('idAnnotationSet, idSentence, sentence.text, entries.name as annotationStatus, idAnnotationStatus, annotationstatustype.color.rgbBg');
        if (is_array($idAnnotationSet)) {
            $criteria->where('idAnnotationSet', 'IN', $idAnnotationSet);
        } else {
            $criteria->where('idAnnotationSet', '=', $idAnnotationSet);
        }
        $criteria->orderBy('idAnnotationSet');
        Base::entryLanguage($criteria);
        return $criteria;
    }

    public function listFECEBySubCorpus($idSubCorpus) {
        $idLanguage = \Manager::getSession()->idLanguage;
        $cmd = <<<HERE
        SELECT *
        FROM view_labelfecetarget
        WHERE (idSubCorpus = {$idSubCorpus})
            AND (idLanguage = {$idLanguage} )
        ORDER BY idSentence,startChar

HERE;
        $result = $this->getDb()->getQueryCommand($cmd)->treeResult('idSentence', 'startChar,endChar,rgbFg,rgbBg,instantiationType');
        return $result;
    }

    public function listFECEByAS($idAnnotationSet) {
        $idLanguage = \Manager::getSession()->idLanguage;
        if (is_array($idAnnotationSet)) {
            $set = implode(',', $idAnnotationSet);
            $condition = "(idAnnotationSet IN ({$set}))";
        } else {
            $condition = "(idAnnotationSet = {$idAnnotationSet})";
        }
        $cmd = <<<HERE
        SELECT l.idSentence, l.startChar, l.endChar, l.rgbFg, l. rgbBg, l.instantiationType, fe.entry as feEntry, layerTypeEntry
        FROM view_labelfecetarget l left join view_frameelement fe on (l.idFrameElement = fe.idFrameElement)
        WHERE {$condition} AND (idLanguage = {$idLanguage} )
        ORDER BY idSentence,startChar

HERE;
        $result = $this->getDb()->getQueryCommand($cmd)->treeResult('idSentence', 'startChar,endChar,rgbFg,rgbBg,instantiationType,feEntry,layerTypeEntry');
        return $result;
    }
}

