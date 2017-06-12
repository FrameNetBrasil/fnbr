<?php
/**
 * @category   Maestro
 * @package    UFJF
 * @subpackage mfn
 * @copyright  Copyright (c) 2003-2013 UFJF (http://www.ufjf.br)
 * @license    http://siga.ufjf.br/license
 * @version
 * @since
 */

// wizard - code section created by Wizard Module

namespace fnbr\models\map;

class ViewAnnotationStatusTypeMap extends \MBusinessModel {

    public static function ORMMap() {

        return array(
            'class' => \get_called_class(),
            'database' => \Manager::getConf('fnbr.db'),
            'table' => 'view_annotationstatustype',
            'attributes' => array(
                'idType' => array('column' => 'idType','key' => 'primary','type' => 'integer'),
                'entry' => array('column' => 'entry','type' => 'string'),
                'info' => array('column' => 'info','type' => 'string'),
                'flag' => array('column' => 'flag','type' => 'boolean'),
                'idColor' => array('column' => 'idColor','key' => 'foreign','type' => 'integer'),
                'idEntity' => array('column' => 'idEntity','key' => 'foreign','type' => 'integer'),
            ),
            'associations' => array(
                'entries' => array('toClass' => 'mfn\models\ViewEntryLanguage', 'cardinality' => 'oneToOne' , 'keys' => 'entry:entry'),
                'color' => array('toClass' => 'mfn\models\Color', 'cardinality' => 'oneToOne' , 'keys' => 'idColor:idColor'),
            )
        );
    }
    

}
