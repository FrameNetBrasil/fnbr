<?php
/**
 * @category   Maestro
 * @package    UFJF
 *  @subpackage fnbr
 * @copyright  Copyright (c) 2003-2013 UFJF (http://www.ufjf.br)
 * @license    http://siga.ufjf.br/license
 * @version
 * @since
 */

// wizard - code section created by Wizard Module

namespace fnbr\models\map;

class GenreMap extends \MBusinessModel {

    
    public static function ORMMap() {

        return array(
            'class' => \get_called_class(),
            'database' => \Manager::getConf('fnbr.db'),
            'table' => 'genre',
            'attributes' => array(
                'idGenre' => array('column' => 'idGenre','key' => 'primary','idgenerator' => 'identity','type' => 'integer'),
                'entry' => array('column' => 'entry','type' => 'string'),
            ),
            'associations' => array(
                'documents' => array('toClass' => 'fnbr\models\Document', 'cardinality' => 'oneToMany' , 'keys' => 'idGenre:idGenre'), 
                'entries' => array('toClass' => 'fnbr\models\Entry', 'cardinality' => 'oneToMany' , 'keys' => 'entry:entry'), 
            )
        );
    }
    
    /**
     * 
     * @var integer 
     */
    protected $idGenre;
    /**
     * 
     * @var string 
     */
    protected $entry;

    /**
     * Associations
     */
    protected $documents;
    protected $entries;
    

    /**
     * Getters/Setters
     */
    public function getIdGenre() {
        return $this->idGenre;
    }

    public function setIdGenre($value) {
        $this->idGenre = $value;
    }

    public function getEntry() {
        return $this->entry;
    }

    public function setEntry($value) {
        $this->entry = $value;
    }
    /**
     *
     * @return Association
     */
    public function getDocuments() {
        if (is_null($this->documents)){
            $this->retrieveAssociation("documents");
        }
        return  $this->documents;
    }
    /**
     *
     * @param Association $value
     */
    public function setDocuments($value) {
        $this->documents = $value;
    }
    /**
     *
     * @return Association
     */
    public function getAssociationDocuments() {
        $this->retrieveAssociation("documents");
    }
    /**
     *
     * @return Association
     */
    public function getEntries() {
        if (is_null($this->entries)){
            $this->retrieveAssociation("entries");
        }
        return  $this->entries;
    }
    /**
     *
     * @param Association $value
     */
    public function setEntries($value) {
        $this->entries = $value;
    }
    /**
     *
     * @return Association
     */
    public function getAssociationEntries() {
        $this->retrieveAssociation("entries");
    }

    

}
// end - wizard

?>