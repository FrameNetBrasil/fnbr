--
-- Implantação do StatusType
-- 

--
-- Type
--
-- já criado o type typ_statustype (idType = 6)
--

--
-- TypeInstance
--

INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('rel_constraint_frame','rel_constraint_frame','Constraint to a specific Frame','rel_constraint_frame',1);

INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('stt_removed','Status_Removed','Status_Removed','Status_Removed',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('stt_active','Status_Active','Status_Active','Status_Active',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('stt_released','Status_Released','Status_Released','Status_Released',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('stt_published','Status_Published','Status_Published','Status_Published',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('stt_inactive','Status_Inactive','Status_Inactive','Status_Inactive',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('stt_waiting','Status_Waiting','Status_Waiting','Status_Waiting',1);

INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,2 from Entry where entry like 'stt_%';
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,3 from Entry where entry like 'stt_%';
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,4 from Entry where entry like 'stt_%';

insert into Entity(alias, type) values ('stt_removed','SS');
insert into Entity(alias, type) values ('stt_active','SS');
insert into Entity(alias, type) values ('stt_released','SS');
insert into Entity(alias, type) values ('stt_published','SS');
insert into Entity(alias, type) values ('stt_inactive','SS');
insert into Entity(alias, type) values ('stt_waiting','SS');


insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) values ('stt_removed',0,1,6,1, (select idEntity from Entity where alias = 'stt_removed'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) values ('stt_active',0,1,6,1, (select idEntity from Entity where alias = 'stt_active'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) values ('stt_released',0,1,6,1, (select idEntity from Entity where alias = 'stt_released'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) values ('stt_published',0,1,6,1, (select idEntity from Entity where alias = 'stt_published'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) values ('stt_inactive',0,1,6,1, (select idEntity from Entity where alias = 'stt_inactive'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) values ('stt_waiting',0,1,6,1, (select idEntity from Entity where alias = 'stt_waiting'));

--
--  Relation Type
--

INSERT INTO Entry ( entry,name,description,nick,idLanguage ) 
    VALUES ('rel_hasstatus','rel_hasstatus','Entity Status','rel_hasstatus',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) 
    VALUES ('rel_hasstatus','rel_hasstatus','Entity Status','rel_hasstatus',2);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) 
    VALUES ('rel_hasstatus','rel_hasstatus','Entity Status','rel_hasstatus',3);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) 
    VALUES ('rel_hasstatus','rel_hasstatus','Entity Status','rel_hasstatus',4);

INSERT INTO Translation ( resource,text,idLanguage ) 
    VALUES ('rel_hasstatus_entity1','entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) 
    VALUES ('rel_hasstatus_entity1','entity',2);
INSERT INTO Translation ( resource,text,idLanguage ) 
    VALUES ('rel_hasstatus_entity1','entity',3);
INSERT INTO Translation ( resource,text,idLanguage ) 
    VALUES ('rel_hasstatus_entity1','entity',4);

INSERT INTO Translation ( resource,text,idLanguage ) 
    VALUES ('rel_hasstatus_entity2','entity_status',1);
INSERT INTO Translation ( resource,text,idLanguage ) 
    VALUES ('rel_hasstatus_entity2','entity_status',2);
INSERT INTO Translation ( resource,text,idLanguage ) 
    VALUES ('rel_hasstatus_entity2','entity_status',3);
INSERT INTO Translation ( resource,text,idLanguage ) 
    VALUES ('rel_hasstatus_entity2','entity_status',4);

INSERT INTO Translation ( resource,text,idLanguage ) 
    VALUES ('rel_hasstatus_entity3','entity_status',1);
INSERT INTO Translation ( resource,text,idLanguage ) 
    VALUES ('rel_hasstatus_entity3','entity_status',2);
INSERT INTO Translation ( resource,text,idLanguage ) 
    VALUES ('rel_hasstatus_entity3','entity_status',3);
INSERT INTO Translation ( resource,text,idLanguage ) 
    VALUES ('rel_hasstatus_entity3','entity_status',4);


INSERT INTO RelationType ( entry,nameEntity1,nameEntity2,nameEntity3,idRelationGroup,idDomain ) 
    VALUES ('rel_hasstatus','rel_hasstatus_entity1','rel_hasstatus_entity2','rel_hasstatus_entity3', 1, 1);



