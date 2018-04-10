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

class Qualia extends map\QualiaMap {

    public static function config() {
        return array(
            'log' => array(  ),
            'validators' => array(
                'info' => array('notnull'),
                'idEntity' => array('notnull'),
            ),
            'converters' => array()
        );
    }
    
    public function getDescription(){
        return $this->getInfo();
    }

    public function listByFilter($filter){
        $criteria = $this->getCriteria()->select('*')->orderBy('idTypeInstance');
        if ($filter->idTypeInstance){
            $criteria->where("idTypeInstance LIKE '{$filter->idTypeInstance}%'");
        }
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
