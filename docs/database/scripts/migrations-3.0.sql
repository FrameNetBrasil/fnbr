-- MySQL Workbench Synchronization
-- Generated: 2017-07-11 09:55
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Administrator

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `mfn_db`.`auth_user` 
DROP FOREIGN KEY `fk_auth_person`;

ALTER TABLE `mfn_db`.`Translation` 
DROP INDEX `idx_resource` ,
ADD INDEX `idx_resource` (`resource` ASC);

ALTER TABLE `mfn_db`.`Type` 
DROP INDEX `idx_Type_entry` ,
ADD INDEX `idx_Type_entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`Frame` 
DROP INDEX `idx_Frame_Entry` ,
ADD INDEX `idx_Frame_Entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`FrameElement` 
DROP INDEX `idx_FrameElement_Entry` ,
ADD INDEX `idx_FrameElement_Entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`Template` 
DROP INDEX `idx_Template_Entry` ,
ADD INDEX `idx_Template_Entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`RelationType` 
DROP INDEX `idx_Resource_nameEntity1` ,
ADD INDEX `idx_Resource_nameEntity1` (`nameEntity1` ASC),
DROP INDEX `idx_Resource_nameEntity2` ,
ADD INDEX `idx_Resource_nameEntity2` (`nameEntity2` ASC),
DROP INDEX `idx_RelationType_entry` ,
ADD INDEX `idx_RelationType_entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`WordForm` 
DROP INDEX `idx_WordForm_form` ,
ADD INDEX `idx_WordForm_form` (`form` ASC);

ALTER TABLE `mfn_db`.`Lexeme` 
DROP INDEX `idx_Lexeme_name` ,
ADD INDEX `idx_Lexeme_name` (`name` ASC);

ALTER TABLE `mfn_db`.`POS` 
DROP INDEX `idx_POS_Entry` ,
ADD INDEX `idx_POS_Entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`Lemma` 
DROP INDEX `idx_Lemma_name` ,
ADD INDEX `idx_Lemma_name` (`name` ASC);

ALTER TABLE `mfn_db`.`Genre` 
DROP INDEX `idx_Genre_Entry` ,
ADD INDEX `idx_Genre_Entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`Corpus` 
DROP INDEX `idx_Corpus_Entry` ,
ADD INDEX `idx_Corpus_Entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`Document` 
DROP INDEX `idx_Document_Entry` ,
ADD INDEX `idx_Document_Entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`GenericLabel` 
DROP INDEX `idx_GenericLabel_Name` ,
ADD INDEX `idx_GenericLabel_Name` (`name` ASC);

ALTER TABLE `mfn_db`.`LayerType` 
DROP INDEX `idx_LayerType_Entry` ,
ADD INDEX `idx_LayerType_Entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`SubCorpus` 
DROP INDEX `idx_SubCorpus_Entry` ,
ADD INDEX `idx_SubCorpus_Entry` (`name` ASC);

ALTER TABLE `mfn_db`.`Domain` 
DROP INDEX `idx_Domain_entry` ,
ADD INDEX `idx_Domain_entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`TypeInstance` 
DROP INDEX `idx_TypeInstance_Entry` ,
ADD INDEX `idx_TypeInstance_Entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`auth_user` 
CHANGE COLUMN `idPerson` `idPerson` INT(11) NULL DEFAULT NULL ,
ADD COLUMN `status` CHAR(1) NULL DEFAULT NULL AFTER `active`,
ADD COLUMN `name` VARCHAR(255) NULL DEFAULT NULL AFTER `status`,
ADD COLUMN `email` VARCHAR(255) NULL DEFAULT NULL AFTER `name`,
ADD COLUMN `nick` VARCHAR(50) NULL DEFAULT NULL AFTER `email`,
ADD COLUMN `auth0IdUser` VARCHAR(255) NULL DEFAULT NULL AFTER `nick`,
ADD COLUMN `auth0CreatedAt` VARCHAR(50) NULL DEFAULT NULL AFTER `auth0IdUser`,
ADD COLUMN `lastLogin` TIMESTAMP NULL DEFAULT NULL AFTER `auth0CreatedAt`;

ALTER TABLE `mfn_db`.`auth_person` 
ADD COLUMN `auth0IdUser` VARCHAR(255) NULL DEFAULT NULL AFTER `nick`,
ADD COLUMN `auth0CreatedAt` VARCHAR(50) NULL DEFAULT NULL AFTER `auth0IdUser`;

ALTER TABLE `mfn_db`.`Entry` 
DROP INDEX `idx_Entry_Entry` ,
ADD INDEX `idx_Entry_Entry` (`entry` ASC),
DROP INDEX `idx_Entry_Name` ,
ADD INDEX `idx_Entry_Name` (`name` ASC);

ALTER TABLE `mfn_db`.`Construction` 
DROP INDEX `idx_Construction_Entry` ,
ADD INDEX `idx_Construction_Entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`ConstructionElement` 
DROP INDEX `idx_ConstructionElement_Entry` ,
ADD INDEX `idx_ConstructionElement_Entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`SemanticType` 
DROP INDEX `idx_SemanticType_Entry` ,
ADD INDEX `idx_SemanticType_Entry` (`entry` ASC);

ALTER TABLE `mfn_db`.`Timeline` 
DROP INDEX `idx_Timeline_Timeline` ,
ADD INDEX `idx_Timeline_Timeline` (`timeline` ASC);

DROP TABLE IF EXISTS `mfn_db`.`carmanode` ;

DROP TABLE IF EXISTS `mfn_db`.`carmalink` ;

ALTER TABLE `mfn_db`.`auth_user` 
ADD CONSTRAINT `fk_auth_person`
  FOREIGN KEY (`idPerson`)
  REFERENCES `mfn_db`.`auth_person` (`idPerson`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_entrylanguage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_entrylanguage` (`idEntry` INT, `entry` INT, `name` INT, `description` INT, `nick` INT, `idLanguage` INT, `language` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_frame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_frame` (`idFrame` INT, `entry` INT, `active` INT, `idEntity` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_frameelement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_frameelement` (`idFrame` INT, `frameEntry` INT, `frameIdEntity` INT, `idFrameElement` INT, `entry` INT, `active` INT, `idEntity` INT, `idColor` INT, `typeEntry` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_coretype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_coretype` (`entry` INT, `info` INT, `flag` INT, `idType` INT, `idColor` INT, `idEntity` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_annotationstatustype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_annotationstatustype` (`entry` INT, `info` INT, `flag` INT, `idType` INT, `idColor` INT, `idEntity` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_lu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_lu` (`idLU` INT, `name` INT, `senseDescription` INT, `active` INT, `importNum` INT, `incorporatedFE` INT, `idEntity` INT, `idLemma` INT, `idFrame` INT, `frameEntry` INT, `lemmaName` INT, `idPOS` INT, `idLanguage` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_subcorpuslu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_subcorpuslu` (`idSubCorpus` INT, `name` INT, `rank` INT, `idLU` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_annotationset`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_annotationset` (`idAnnotationSet` INT, `idSubCorpus` INT, `idSentence` INT, `idAnnotationStatus` INT, `entry` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_subcorpuscxn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_subcorpuscxn` (`idSubCorpus` INT, `name` INT, `rank` INT, `idConstruction` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_construction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_construction` (`idConstruction` INT, `entry` INT, `abstract` INT, `active` INT, `idEntity` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_constructionelement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_constructionelement` (`idConstruction` INT, `constructionEntry` INT, `constructionIdEntity` INT, `idConstructionElement` INT, `entry` INT, `optional` INT, `active` INT, `idEntity` INT, `idColor` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_instantiationtype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_instantiationtype` (`entry` INT, `info` INT, `flag` INT, `idTypeInstance` INT, `idType` INT, `idColor` INT, `idEntity` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_labelfecetarget`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_labelfecetarget` (`idAnnotationSet` INT, `idSubCorpus` INT, `idSentence` INT, `layerTypeEntry` INT, `idFrameElement` INT, `idConstructionElement` INT, `idGenericLabel` INT, `startChar` INT, `endChar` INT, `rgbFg` INT, `rgbBg` INT, `idLanguage` INT, `instantiationType` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_relation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_relation` (`idEntityRelation` INT, `domain` INT, `relationGroup` INT, `idRelationType` INT, `relationType` INT, `idEntity1` INT, `entity1Type` INT, `idEntity2` INT, `entity2Type` INT, `idEntity3` INT, `entity3Type` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_layer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_layer` (`idLayer` INT, `rank` INT, `idAnnotationSet` INT, `idLayerType` INT, `entry` INT, `idEntity` INT, `layerOrder` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_constraint`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_constraint` (`idEntityRelation` INT, `entry` INT, `idConstraint` INT, `constraintType` INT, `idConstrained` INT, `constrainedType` INT, `idConstrainedBy` INT, `constrainedByType` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_semantictype`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_semantictype` (`idSemanticType` INT, `entry` INT, `idEntity` INT, `idDomain` INT, `domainEntry` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_valencepattern`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_valencepattern` (`idValenceLU` INT, `idFrame` INT, `idLU` INT, `idLanguage` INT, `idValencePattern` INT, `countPattern` INT, `idFrameElement` INT, `GF` INT, `GFSource` INT, `PT` INT, `luName` INT, `frameName` INT, `feName` INT, `language` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_domain`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_domain` (`idDomain` INT, `entry` INT, `idEntity` INT, `name` INT, `idEntityRel` INT, `entityType` INT, `idLanguage` INT, `entryRel` INT, `nameRel` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_wflexemelemma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_wflexemelemma` (`idWordForm` INT, `form` INT, `idLexeme` INT, `lexeme` INT, `idPOSLexeme` INT, `POSLexeme` INT, `idLanguage` INT, `idLexemeEntry` INT, `lexemeOrder` INT, `breakBefore` INT, `headWord` INT, `idLemma` INT, `lemma` INT, `idPOSLemma` INT, `POSLemma` INT, `language` INT);

-- -----------------------------------------------------
-- Placeholder table for view `mfn_db`.`view_sentence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mfn_db`.`view_sentence` (`idSentence` INT, `text` INT, `paragraphOrder` INT, `idParagraph` INT, `idLanguage` INT, `documentOrder` INT, `idDocument` INT, `documentEntry` INT, `author` INT, `idGenre` INT, `idCorpus` INT, `corpusEntry` INT);


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_entrylanguage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_entrylanguage`;
USE `mfn_db`;
create or replace view view_entrylanguage as
select entry.idEntry, entry.entry, entry.name, entry.description, entry.nick, entry.idLanguage, language.language
from Entry inner join Language on (entry.idLanguage = language.idLanguage);


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_frame`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_frame`;
USE `mfn_db`;
create or replace view view_frame as
select frame.idFrame, frame.entry, frame.active, frame.idEntity
from Frame;


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_frameelement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_frameelement`;
USE `mfn_db`;
create or replace view view_frameelement as
select frame.idFrame, frame.entry as frameEntry, frame.idEntity as frameIdEntity, fe.idFrameElement, fe.entry, fe.active, fe.idEntity, fe.idColor, ti.entry as typeEntry
from frameelement fe join entityrelation er1 on (fe.idEntity = er1.idEntity1)
join relationtype rt1 on (er1.idRelationType = rt1.idRelationType)
join frame on (er1.idEntity2 = frame.idEntity)
join entityrelation er2 on (fe.idEntity = er2.idEntity1)
join relationtype rt2 on (er2.idRelationType = rt2.idRelationType)
join typeinstance ti on (er2.idEntity2 = ti.idEntity)
where (rt1.entry = 'rel_elementof') and (rt2.entry = 'rel_hastype');


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_coretype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_coretype`;
USE `mfn_db`;
create or replace view view_coretype as
select ti.entry, ti.info, ti.flag, ti.idType, ti.idColor, ti.idEntity
from typeinstance ti join type on (ti.idType = type.idType)
where (type.entry = 'typ_coretype');


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_annotationstatustype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_annotationstatustype`;
USE `mfn_db`;
create or replace view view_annotationstatustype as
select ti.entry, ti.info, ti.flag, ti.idType, ti.idColor, ti.idEntity
from typeinstance ti join type on (ti.idType = type.idType)
where (type.entry = 'typ_annotationstatustype');


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_lu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_lu`;
USE `mfn_db`;
create or replace view view_lu as
select lu.idLU, lu.name, lu.senseDescription, lu.active, lu. importNum, lu.incorporatedFE, lu.idEntity, lu.idLemma, frame.idFrame, frame.entry as frameEntry, lemma.name as lemmaName, lemma.idPOS, lemma.idLanguage
from lu join entityrelation er1 on (lu.idEntity = er1.idEntity1)
join relationtype rt1 on (er1.idRelationType = rt1.idRelationType)
join frame on (er1.idEntity2 = frame.idEntity)
join lemma on (lu.idLemma = lemma.idLemma)
where (rt1.entry = 'rel_evokes');


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_subcorpuslu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_subcorpuslu`;
USE `mfn_db`;
create or replace view view_subcorpuslu as
select sc.idSubCorpus, sc.name, sc.rank, lu.idLU
from lu join entityrelation er1 on (lu.idEntity = er1.idEntity1)
join relationtype rt1 on (er1.idRelationType = rt1.idRelationType)
join subcorpus sc on (er1.idEntity2 = sc.idEntity)
where (rt1.entry = 'rel_hassubcorpus');


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_annotationset`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_annotationset`;
USE `mfn_db`;
create or replace view view_annotationset as
select a.idAnnotationSet, a.idSubCorpus, a.idSentence, a.idAnnotationStatus,  ti.entry 
from annotationset a join typeinstance ti on (a.idAnnotationStatus = ti.idTypeInstance);


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_subcorpuscxn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_subcorpuscxn`;
USE `mfn_db`;
create or replace view view_subcorpuscxn as
select sc.idSubCorpus, sc.name, sc.rank, cxn.idConstruction
from construction cxn join entityrelation er1 on (cxn.idEntity = er1.idEntity1)
join relationtype rt1 on (er1.idRelationType = rt1.idRelationType)
join subcorpus sc on (er1.idEntity2 = sc.idEntity)
where (rt1.entry = 'rel_hassubcorpus');


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_construction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_construction`;
USE `mfn_db`;
create or replace view view_construction as
select construction.idConstruction, construction.entry, construction.abstract,construction.active, construction.idEntity
from Construction;


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_constructionelement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_constructionelement`;
USE `mfn_db`;
create or replace view view_constructionelement as
select construction.idConstruction, construction.entry as constructionEntry, construction.idEntity as constructionIdEntity, ce.idConstructionElement, ce.entry, ce.optional, ce.active, ce.idEntity, ce.idColor
from constructionelement ce join entityrelation er1 on (ce.idEntity = er1.idEntity1)
join relationtype rt1 on (er1.idRelationType = rt1.idRelationType)
join construction on (er1.idEntity2 = construction.idEntity)
where (rt1.entry = 'rel_elementof');


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_instantiationtype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_instantiationtype`;
USE `mfn_db`;
create or replace view view_instantiationtype as
select ti.entry, ti.info, ti.flag, ti.idTypeInstance, ti.idType, ti.idColor, ti.idEntity
from typeinstance ti join type on (ti.idType = type.idType)
where (type.entry = 'typ_instantiationtype');


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_labelfecetarget`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_labelfecetarget`;
USE `mfn_db`;
create or replace view view_labelfecetarget as
SELECT
    AnnotationSet.idAnnotationSet,
    AnnotationSet.idSubCorpus,
    AnnotationSet.idSentence,
    LayerType.entry as layerTypeEntry,
    fe.idFrameElement, 
    ce.idConstructionElement, 
    gl.idGenericLabel,
    ifnull(Label.startChar,-1) AS startChar,
    ifnull(Label.endChar,-1) AS endChar,
    ifnull(color_ce.rgbFg, ifnull(color_fe.rgbFg, color_gl.rgbFg)) AS rgbFg,
    ifnull(color_ce.rgbBg, ifnull(color_fe.rgbBg, color_gl.rgbBg)) AS rgbBg,
    entry_it.idLanguage, 
    entry_it.name AS instantiationType
FROM AnnotationSet
    INNER JOIN Layer
        ON (AnnotationSet.idAnnotationSet = Layer.idAnnotationSet)
    INNER JOIN LayerType
        ON (Layer.idLayerType = LayerType.idLayerType)
    INNER JOIN Label
        ON (Layer.idLayer = Label.idLayer)
    INNER JOIN TypeInstance
        ON (Label.idInstantiationType = TypeInstance.idTypeInstance)
    INNER JOIN Entry entry_it
        ON (TypeInstance.entry = entry_it.entry)
    LEFT JOIN FrameElement fe
        ON (Label.idLabelType=fe.idEntity)
    LEFT JOIN Color color_fe
        ON (fe.idColor = color_fe.idColor)
    LEFT JOIN ConstructionElement ce
        ON (Label.idLabelType=ce.idEntity)
    LEFT JOIN Color color_ce
        ON (ce.idColor = color_ce.idColor)
    LEFT JOIN GenericLabel gl
        ON (Label.idLabelType=gl.idEntity)
    LEFT JOIN Color color_gl
        ON (gl.idColor = color_gl.idColor)
    WHERE ((LayerType.entry = 'lty_fe') or (LayerType.entry = 'lty_ce') or (LayerType.entry = 'lty_target'))
    ORDER BY AnnotationSet.idSentence,Label.startChar;


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_relation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_relation`;
USE `mfn_db`;
create or replace view view_relation as
select er.idEntityRelation, d.entry as domain, rg.entry as relationGroup, rt.idRelationType, rt.entry as relationType, er.idEntity1, e1.type as entity1Type, er.idEntity2, e2.type as entity2Type, er.idEntity3, e3.type as entity3Type
from entityrelation er join relationtype rt on (er.idRelationType = rt.idRelationType)
join relationgroup rg on (rt.idRelationGroup = rg.idRelationGroup)
join domain d on (rt.idDomain = d.idDomain)
join entity e1 on (er.idEntity1 = e1.idEntity)
join entity e2 on (er.idEntity2 = e2.idEntity)
left join entity e3 on (er.idEntity3 = e3.idEntity);


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_layer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_layer`;
USE `mfn_db`;
create or replace view view_layer as
select l.idLayer, l.rank, l.idAnnotationSet, l.idLayerType, lt.entry, lt.idEntity, lt.layerOrder 
from Layer l inner join LayerType lt on (l.idLayerType = lt.idLayerType);


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_constraint`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_constraint`;
USE `mfn_db`;
create or replace view view_constraint as
select r.idEntityRelation, r.relationType as entry, 
    r.idEntity1 as idConstraint, r.entity1Type as constraintType, 
    r.idEntity2 as idConstrained, r.entity2Type as constrainedType,
    r.idEntity3 as idConstrainedBy, r.entity3Type as constrainedByType
from view_relation r
where (r.relationGroup = 'rgp_constraints') or (r.entity1Type = 'CN');


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_semantictype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_semantictype`;
USE `mfn_db`;
create or replace view view_semantictype as
select st.idSemanticType, st.entry, st.idEntity, st.idDomain, d.entry as domainEntry
from SemanticType st join Domain d on (st.idDomain = d.idDomain);


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_valencepattern`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_valencepattern`;
USE `mfn_db`;
create or replace view view_valencepattern as
select vl.idValenceLU, vl.idFrame, vl.idLU, vl.idLanguage, vp.idValencePattern, vp.countPattern, vv.idFrameElement, vv.GF, vv.GFSource, vv.PT, 
  lu.name as luName, fentry.name as frameName, feentry.name as feName, l.language
from ValenceLU vl
join ValencePattern vp on (vl.idValenceLU = vp.idValenceLU)
join ValenceValent vv on (vp.idValencePattern = vv.idValencePattern)
join Frame f on (vl.idFrame = f.idFrame)
join FrameElement fe on (vv.idFrameElement = fe.idFrameElement)
join LU on (vl.idLU = lu.idLU)
join Language l on (vl.idLanguage = l.idLanguage)
join entry fentry on (f.entry = fentry.entry)
join entry feentry on (fe.entry = feentry.entry)
where (fentry.idLanguage = vl.idLanguage)
and (feentry.idLanguage = vl.idLanguage);


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_domain`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_domain`;
USE `mfn_db`;
create or replace view view_domain as
select d.idDomain, d.entry, d.idEntity, e.name, st.idEntity idEntityRel, en.type entityType,  e.idLanguage, st.entry entryRel, est.name nameRel
from Domain d
join entry e on (d.entry = e.entry)
join SemanticType st on (d.idDomain = st.idDomain)
join Entity en on (st.idEntity = en.idEntity)
join entry est on (st.entry = est.entry)
where (e.idlanguage = est.idlanguage)
UNION
select d.idDomain, d.entry, d.idEntity, e.name, er.idEntity1 idEntityRel, 'FR' entityType, e.idLanguage, f.entry entryRel, ef.name nameRel
from Domain d
join entry e on (d.entry = e.entry)
join EntityRelation  er on (d.idEntity = er.idEntity2)
join Frame f on (er.idEntity1 = f.idEntity)
join entry ef on (f.entry = ef.entry)
where (e.idlanguage = ef.idlanguage)
UNION
select d.idDomain, d.entry, d.idEntity, e.name, 0, 'DO' entityType, e.idLanguage, d.entry entryRel, e.name nameRel
from Domain d
join entry e on (d.entry = e.entry);


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_wflexemelemma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_wflexemelemma`;
USE `mfn_db`;
CREATE  OR REPLACE VIEW `view_wflexemelemma` AS
select wf.idWordForm,wf.form,lx.idLexeme,lx.name lexeme, pos1.idPOS idPOSLexeme, pos1.POS POSLexeme, lx.idLanguage,
le.idLexemeEntry, le.lexemeOrder, le.breakBefore, le.headWord,lm.idLemma,lm.name lemma, pos2.idPOS idPOSLemma, pos2.POS POSLemma, lang.language
from wordform wf
join lexeme lx on (wf.idlexeme = lx.idlexeme)
join pos pos1 on (lx.idpos = pos1.idpos)
join language lang on (lx.idlanguage = lang.idlanguage)
left join lexemeentry le on (lx.idlexeme = le.idlexeme)
left join lemma lm on (le.idlemma = lm.idlemma)
left join pos pos2 on (lm.idpos = pos2.idpos)
where ((lm.idlanguage = lx.idlanguage) or (lm.idlanguage is null));


USE `mfn_db`;

-- -----------------------------------------------------
-- View `mfn_db`.`view_sentence`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mfn_db`.`view_sentence`;
USE `mfn_db`;
create or replace view view_sentence as
select s.idSentence, s.text, s.paragraphOrder, s.idParagraph, s.idLanguage, p.documentOrder, p.idDocument,
d.entry as documentEntry, d.author, d.idGenre, d.idCorpus, c.entry as corpusEntry
from sentence s 
join paragraph p on (s.idparagraph = p.idparagraph)
join document d on (p.iddocument = d.iddocument)
join corpus c on (d.idcorpus = c.idcorpus);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;