<?php
/**
 * 
 *
 * @category   Maestro
 * @package    UFJF
 * @subpackage mfn
 * @copyright  Copyright (c) 2003-2012 UFJF (http://www.ufjf.br)
 * @license    http://siga.ufjf.br/license
 * @version    
 * @since      
 */

namespace fnbr\models;

class TypeInstance extends map\TypeInstanceMap {

    public static function config() {
        return array(
            'log' => array(  ),
            'validators' => array(
                'entry' => array('notnull'),
                'info' => array('notnull'),
                'flag' => array('notnull'),
                'idType' => array('notnull'),
                'idColor' => array('notnull'),
                'idEntity' => array('notnull'),
            ),
            'converters' => array()
        );
    }
    
    public function getDescription(){
        return $this->getIdTypeInstance();
    }

    public function listByFilter($filter){
        $criteria = $this->getCriteria()->select('*')->orderBy('idTypeInstance');
        if ($filter->idTypeInstance){
            $criteria->where("idTypeInstance LIKE '{$filter->idTypeInstance}%'");
        }
        return $criteria;
    }
    
    public function listCoreType(){
        $criteria = $this->getCriteria()->select('idTypeInstance as idCoreType, entry, entries.name as name')->orderBy('info');
        Base::entryLanguage($criteria);
        $criteria->where("entry like 'cty_%'");
        return $criteria;
    }

    public function listStatusType(){
        $criteria = $this->getCriteria()->select('idTypeInstance as idStatusType, entry, entries.name as name')->orderBy('entries.name');
        Base::entryLanguage($criteria);
        $criteria->where("entry like 'stt_%'");
        return $criteria;
    }

    public function listAnnotationStatus($filter){
        $criteria = $this->getCriteria()->select('idTypeInstance as idAnnotationStatus, entry, entries.name as name, idColor, color.name as colorName, color.rgbFg, color.rgbBg')->orderBy('entry');
        Base::entryLanguage($criteria);
        $criteria->where("entry like 'ast_%'");
        if ($filter->entry){
            $criteria->where("entry LIKE '{$filter->entry}%'");
        }
        return $criteria;
    }

    public function getIdInstantiationTypeByEntry($entry){
        $criteria = $this->getCriteria()->select('idTypeInstance as idInstantiationType')->orderBy('info');
        $criteria->where("entry = '{$entry}'");
        return  $criteria->asQuery()->getResult()[0]['idInstantiationType'];
    }    

    public function getIdCoreTypeByEntry($entry){
        $criteria = $this->getCriteria()->select('idTypeInstance as idCoreType')->orderBy('info');
        $criteria->where("entry = '{$entry}'");
        return  $criteria->asQuery()->getResult()[0]['idCoreType'];
    }

    public function listBFF(){
        $criteria = $this->getCriteria()->select('idTypeInstance as idBFF, entry, entries.description as description')->orderBy('info');
        Base::entryLanguage($criteria);
        $criteria->where("entry like 'bff_%'");
        return $criteria;
    }

    public function save()
    {
        Base::entityTimelineSave($this->getIdEntity());
        parent::save();
    }

    public function delete()
    {
        Base::entityTimelineDelete($this->getIdEntity());
        parent::delete();
    }

}
