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

class ViewConstraintMap extends \MBusinessModel {

    
    public static function ORMMap() {

        return array(
            'class' => \get_called_class(),
            'database' => \Manager::getConf('fnbr.db'),
            'table' => 'view_constraint',
            'attributes' => array(
                'idConstraint' => array('column' => 'idConstraint', 'type' => 'integer','key' => 'primary'),
                'entry' => array('column' => 'entry','type' => 'string'),
                'idConstrained' => array('column' => 'idConstrained','type' => 'integer'),
                'constrainedType' => array('column' => 'constrainedType','type' => 'string'),
                'idConstrainedBy' => array('column' => 'idConstrainedBy','type' => 'integer'),
                'constrainedByType' => array('column' => 'constrainedByType','type' => 'string'),
            ),
            'associations' => array(
            )
        );
    }
    

}
