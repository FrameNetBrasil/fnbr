===
=== Implementing FNBr-Qualia
===
---
--- 10/04/2018: changing relation entries
---

start transaction;

update entry set entry = 'rel_qualia_formal' where entry = 'rel_formal_qualia';
update entry set entry = 'rel_qualia_agentive' where entry = 'rel_agentive_qualia';
update entry set entry = 'rel_qualia_telic' where entry = 'rel_telic_qualia';
update entry set entry = 'rel_qualia_constitutive' where entry = 'rel_constitutive_qualia';

update relationtype set entry = 'rel_qualia_formal', nameEntity1 = 'lu1', nameEntity2='lu2', nameEntity3='qualia' where idrelationtype=33;
update relationtype set entry = 'rel_qualia_agentive', nameEntity1 = 'lu1', nameEntity2='lu2', nameEntity3='qualia' where idrelationtype=34;
update relationtype set entry = 'rel_qualia_telic', nameEntity1 = 'lu1', nameEntity2='lu2', nameEntity3='qualia' where idrelationtype=35;
update relationtype set entry = 'rel_qualia_constitutive', nameEntity1 = 'lu1', nameEntity2='lu2', nameEntity3='qualia' where idrelationtype=36;

commit;

---
--- 10/04/2018: creating typeinstance to table Qualia
---

start transaction;

insert into Entry (entry, name, description, nick, idLanguage) values
('typ_qualia','Qualia Type','Qualia Type','Qualia Type',1),
('typ_qualia','Qualia Type','Qualia Type','Qualia Type',2),
('typ_qualia','Qualia Type','Qualia Type','Qualia Type',3),
('typ_qualia','Qualia Type','Qualia Type','Qualia Type',4);

insert into `type` (entry) values ('type_qualia');

insert into entity (alias, type) values 
('qla_formal','QL'),
('qla_agentive','QL'),
('qla_telic','QL'),
('qla_constitutive','QL');

insert into Entry (entry, name, description, nick, idLanguage) values
('qla_formal','Qualia Formal','Qualia Formal','Qualia Formal',1),
('qla_agentive','Qualia Agentive','Qualia Agentive','Qualia Agentive',1),
('qla_telic','Qualia Telic','Qualia Telic','Qualia Telic',1),
('qla_constitutive','Qualia Constitutive','Qualia Constitutive','Qualia Constitutive',1),
('qla_formal','Qualia Formal','Qualia Formal','Qualia Formal',2),
('qla_agentive','Qualia Agentive','Qualia Agentive','Qualia Agentive',2),
('qla_telic','Qualia Telic','Qualia Telic','Qualia Telic',2),
('qla_constitutive','Qualia Constitutive','Qualia Constitutive','Qualia Constitutive',2),
('qla_formal','Qualia Formal','Qualia Formal','Qualia Formal',3),
('qla_agentive','Qualia Agentive','Qualia Agentive','Qualia Agentive',3),
('qla_telic','Qualia Telic','Qualia Telic','Qualia Telic',3),
('qla_constitutive','Qualia Constitutive','Qualia Constitutive','Qualia Constitutive',3),
('qla_formal','Qualia Formal','Qualia Formal','Qualia Formal',4),
('qla_agentive','Qualia Agentive','Qualia Agentive','Qualia Agentive',4),
('qla_telic','Qualia Telic','Qualia Telic','Qualia Telic',4),
('qla_constitutive','Qualia Constitutive','Qualia Constitutive','Qualia Constitutive',4);

insert into typeinstance (entry, info, flag, idType, idColor, idEntity) values
('qla_formal','Qualia Formal',1,(select idType from type where entry='type_qualia'), 1, (select idEntity from Entity where alias='qla_formal')),
('qla_agentive','Qualia Agentive',1,(select idType from type where entry='type_qualia'), 1, (select idEntity from Entity where alias='qla_agentive')),
('qla_telic','Qualia Telic',1,(select idType from type where entry='type_qualia'), 1, (select idEntity from Entity where alias='qla_telic')),
('qla_constitutive','Qualia Constitutive',1,(select idType from type where entry='type_qualia'), 1, (select idEntity from Entity where alias='qla_constitutive'));

commit;

---
--- 10/04/2018: creating new relations
---
--- rel_qualia_frame : qualia-frame relation
--- rel_qualia_lu1_fe : lu1-fe relation
--- rel_qualia_lu2_fe : lu2-fe relation

start transaction;

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_qualia_frame','rel_qualia_frame','rel_qualia_frame','rel_qualia_frame',1),
('rel_qualia_lu1_fe','rel_qualia_lu1_fe','rel_qualia_lu1_fe','rel_qualia_lu1_fe',1),
('rel_qualia_lu2_fe','rel_qualia_lu2_fe','rel_qualia_lu2_fe','rel_qualia_lu2_fe',1),
('rel_qualia_frame','rel_qualia_frame','rel_qualia_frame','rel_qualia_frame',2),
('rel_qualia_lu1_fe','rel_qualia_lu1_fe','rel_qualia_lu1_fe','rel_qualia_lu1_fe',2),
('rel_qualia_lu2_fe','rel_qualia_lu2_fe','rel_qualia_lu2_fe','rel_qualia_lu2_fe',2),
('rel_qualia_frame','rel_qualia_frame','rel_qualia_frame','rel_qualia_frame',3),
('rel_qualia_lu1_fe','rel_qualia_lu1_fe','rel_qualia_lu1_fe','rel_qualia_lu1_fe',3),
('rel_qualia_lu2_fe','rel_qualia_lu2_fe','rel_qualia_lu2_fe','rel_qualia_lu2_fe',3),
('rel_qualia_frame','rel_qualia_frame','rel_qualia_frame','rel_qualia_frame',4),
('rel_qualia_lu1_fe','rel_qualia_lu1_fe','rel_qualia_lu1_fe','rel_qualia_lu1_fe',4),
('rel_qualia_lu2_fe','rel_qualia_lu2_fe','rel_qualia_lu2_fe','rel_qualia_lu2_fe',4);

insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_qualia_frame', 'qualia', 'frame', '', (select idRelationGroup from relationgroup where entry='rgp_qualia'), 1),
('rel_qualia_lu1_fe', 'lu1', 'fe', '', (select idRelationGroup from relationgroup where entry='rgp_qualia'), 1),
('rel_qualia_lu2_fe', 'lu2', 'fe', '', (select idRelationGroup from relationgroup where entry='rgp_qualia'), 1);

commit;



