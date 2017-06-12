--
-- Implantação das relações qualia
-- 

--
-- Relation Group
--

delete from entry where entry like 'rgp_qualia';

insert into entry(entry, name, description, nick, idLanguage)
SELECT 'rgp_qualia', 'Relações Qualia', 'Relações Qualia', '', 1;

insert into entry(entry, name, description, nick, idLanguage)
SELECT 'rgp_qualia', 'Qualia Relations', 'Qualia Relations', '', 2;

insert into entry(entry, name, description, nick, idLanguage)
SELECT 'rgp_qualia', 'Qualia Relations', 'Qualia Relations', '', 3;

insert into entry(entry, name, description, nick, idLanguage)
SELECT 'rgp_qualia', 'Qualia Relations', 'Qualia Relations', '', 4;

insert into RelationGroup (entry) values ('rgp_qualia');

--
--  Relation Type
--

-- relation type "rel_formal_qualia"

INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('rel_formal_qualia','rel_formal_qualia','Formal Qualia Relation','rel_formal_qualia',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,2 from Entry where (entry = 'rel_formal_qualia') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,3 from Entry where (entry = 'rel_formal_qualia') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,4 from Entry where (entry = 'rel_formal_qualia') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_formal_qualia_entity1','formal_qualia_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_formal_qualia_entity1') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_formal_qualia_entity1') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_formal_qualia_entity1') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_formal_qualia_entity2','formal_qualia_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_formal_qualia_entity2') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_formal_qualia_entity2') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_formal_qualia_entity2') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_formal_qualia_entity3','formal_qualia_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_formal_qualia_entity3') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_formal_qualia_entity3') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_formal_qualia_entity3') and (idLanguage = 1);

INSERT INTO RelationType ( entry,nameEntity1,nameEntity2,nameEntity3,idRelationGroup,idDomain ) 
    VALUES ('rel_formal_qualia','rel_formal_qualia_entity1','rel_formal_qualia_entity2','rel_formal_qualia_entity3',
    (select idRelationGroup from RelationGroup where entry='rgp_qualia'),1);

-- relation type "rel_agentive_qualia"

INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('rel_agentive_qualia','rel_agentive_qualia','Agentive Qualia Relation','rel_agentive_qualia',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,2 from Entry where (entry = 'rel_agentive_qualia') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,3 from Entry where (entry = 'rel_agentive_qualia') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,4 from Entry where (entry = 'rel_agentive_qualia') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_agentive_qualia_entity1','agentive_qualia_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_agentive_qualia_entity1') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_agentive_qualia_entity1') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_agentive_qualia_entity1') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_agentive_qualia_entity2','agentive_qualia_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_agentive_qualia_entity2') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_agentive_qualia_entity2') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_agentive_qualia_entity2') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_agentive_qualia_entity3','agentive_qualia_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_agentive_qualia_entity3') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_agentive_qualia_entity3') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_agentive_qualia_entity3') and (idLanguage = 1);

INSERT INTO RelationType ( entry,nameEntity1,nameEntity2,nameEntity3,idRelationGroup,idDomain )
    VALUES ('rel_agentive_qualia','rel_agentive_qualia_entity1','rel_agentive_qualia_entity2','rel_agentive_qualia_entity3',
    (select idRelationGroup from RelationGroup where entry='rgp_qualia'),1);

-- relation type "rel_telic_qualia"

INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('rel_telic_qualia','rel_telic_qualia','Agentive Qualia Relation','rel_telic_qualia',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,2 from Entry where (entry = 'rel_telic_qualia') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,3 from Entry where (entry = 'rel_telic_qualia') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,4 from Entry where (entry = 'rel_telic_qualia') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_telic_qualia_entity1','telic_qualia_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_telic_qualia_entity1') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_telic_qualia_entity1') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_telic_qualia_entity1') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_telic_qualia_entity2','telic_qualia_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_telic_qualia_entity2') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_telic_qualia_entity2') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_telic_qualia_entity2') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_telic_qualia_entity3','telic_qualia_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_telic_qualia_entity3') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_telic_qualia_entity3') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_telic_qualia_entity3') and (idLanguage = 1);

INSERT INTO RelationType ( entry,nameEntity1,nameEntity2,nameEntity3,idRelationGroup,idDomain ) 
    VALUES ('rel_telic_qualia','rel_telic_qualia_entity1','rel_telic_qualia_entity2','rel_telic_qualia_entity3',
    (select idRelationGroup from RelationGroup where entry='rgp_qualia'),1);

-- relation type "rel_constitutive_qualia"
  
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('rel_constitutive_qualia','rel_constitutive_qualia','Agentive Qualia Relation','rel_constitutive_qualia',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,2 from Entry where (entry = 'rel_constitutive_qualia') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,3 from Entry where (entry = 'rel_constitutive_qualia') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,4 from Entry where (entry = 'rel_constitutive_qualia') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_constitutive_qualia_entity1','constitutive_qualia_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_constitutive_qualia_entity1') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_constitutive_qualia_entity1') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_constitutive_qualia_entity1') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_constitutive_qualia_entity2','constitutive_qualia_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_constitutive_qualia_entity2') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_constitutive_qualia_entity2') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_constitutive_qualia_entity2') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_constitutive_qualia_entity3','constitutive_qualia_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_constitutive_qualia_entity3') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_constitutive_qualia_entity3') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_constitutive_qualia_entity3') and (idLanguage = 1);

INSERT INTO RelationType ( entry,nameEntity1,nameEntity2,nameEntity3,idRelationGroup,idDomain ) 
    VALUES ('rel_constitutive_qualia','rel_constitutive_qualia_entity1','rel_constitutive_qualia_entity2','rel_constitutive_qualia_entity3',
    (select idRelationGroup from RelationGroup where entry='rgp_qualia'),1);