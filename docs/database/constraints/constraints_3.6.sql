====
==== Atualização da estrutura de constraints
====  - Criação da tabela ConstraintType para armazenar os tipos de constraints
====  - Criação da tabela ConstraintInstance para armazenar as constraints
====  - Passa a ter apenas um relationType: 'rel_constraint' que relaciona uma ConstraintInstance com outra quando necessário
==== @ematos - 09122018
====

=== add relationType rel_constraint 

start transaction;

insert into Entry (entry, name, description, nick, idLanguage) 
select 'rel_constraint','Constraint','Constraint','Constraint', idlanguage
from Language;

insert into relationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain)
values ('rel_constraint','*','*','*',6,1);

commit;

=== add typeInstance para os tipos de constraints (value, relation)

start transaction;

insert into Entry (entry, name, description, nick, idLanguage)
select 'typ_constraint','Constraint Type','Constraint Type','Constraint Type', idlanguage
from Language;

insert into `type` (entry) values ('typ_constraint');

insert into Entry (entry, name, description, nick, idLanguage)
select 'typ_con_value','Constraint Value','Constraint Value','Constraint Value', idlanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage) 
select 'typ_con_relation','Constraint Relation','Constraint Relation','Constraint Relation', idlanguage from Language;

insert into entity (alias, type) values ('typ_con_value','NT');
insert into entity (alias, type) values ('typ_con_relation','NT');

insert into typeinstance (entry, info, flag, idType, idColor, idEntity) values
('typ_con_value','Value',1,(select idType from type where entry='typ_constraint'), 1, (select idEntity from Entity where alias='typ_con_value')),
('typ_con_relation','Relation',1,(select idType from type where entry='typ_constraint'), 1, (select idEntity from Entity where alias='typ_con_relation'));

commit;

=== add constraintTypes a partir das relações atualmente existentes em relationType

start transaction;

insert into Entry (entry, name, description, nick, idLanguage)
select 'con_and', 'Constraint and', 'Constraint and', 'and', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_before', 'rel_constraint_before', 'Constraint CE order', 'bef', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_constraint', 'rel_constraint_constraint', 'Constraint a entity to other constraint', 'cnn', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_cxn', 'rel_constraint_cxn', 'Constraint to a specific Cxn', 'cxn', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_different', 'Constraint different', 'Constraint different', 'dif', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_dominance', 'Constraint dominance', 'Constraint dominance', 'dom', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_element', 'rel_constraint_element', 'Constraint CE order', 'ele', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_evokes', 'Constraint evokes', 'Constraint evokes', 'evk', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_follows', 'Constraint Follows', 'Constraint Follows', 'flw', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_frame', 'Constraint Frame', 'Constraint to a specific Frame', 'frm', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_framefamily', 'rel_constraint_framefamily', 'Constraint to a Frame family', 'fam', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_hasword', 'Constraint hasword', 'Constraint hasword', 'wrd', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_lemma', 'Constraint Lemma', 'Constraint Lemma', 'lem', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_lexeme', 'Constraint Lexeme', 'Constraint Lexeme', 'lex', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_lu', 'Constraint LU', 'Constraint LU', 'lu', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_meets', 'rel_constraint_meets', 'Constraint CE order', 'mee', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_same', 'Constraint same', 'Constraint same', 'sam', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_semtype', 'rel_constraint_semtype', 'Constraint to a Semantic Type', 'sty', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_stlu', 'Constraint ST-LU', 'Constraint ST-LU', 'slu', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_udfeature', 'Constraint UD-Feature', 'Constraint UD-Feature', 'udf', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_udrelation', 'Constraint UD-Relation', 'Constraint UD-Relation', 'udr', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_wordform', 'Constraint Wordform', 'Constraint Wordform', 'wrf', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_xor', 'Constraint xor', 'Constraint xor', 'xor', idLanguage from Language;
--
-- qualia
--
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_qualia_formal', 'Constraint Formal Qualia', 'Constraint Formal Qualia', 'fml', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_qualia_constitutive', 'Constraint Constitutive Qualia', 'Constraint Constitutive Qualia', 'cst', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_qualia_agentive', 'Constraint Agentive Qualia', 'Constraint Agentive Qualia', 'agt', idLanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'con_qualia_telic', 'Constraint Telic Qualia', 'Constraint Telic Qualia', 'tlc', idLanguage from Language;


insert into ConstraintType (entry, typeEntity1, typeEntity2, prefix, idTypeInstance) values
('con_constraint', '**', 'CN', 'cnn', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_before', 'CE', 'CE', 'bef', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_meets', 'CE', 'CE', 'mee', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_follows', 'CE', 'CE', 'flw', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_same', 'CE', 'CE', 'sam', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_different', 'CE', 'CE', 'dif', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_dominance', 'CE', 'CE', 'dom', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_hasword', 'CE', 'CE', 'wrd', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_and', 'CE', 'CE', 'and', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_xor', 'CE', 'CE', 'xor', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_evokes', 'CN', '**', 'evk', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_cxn', 'CE', 'CX', 'cxn', (select idTypeInstance from TypeInstance where entry = 'typ_con_value')),
('con_element', 'CN', 'CE', 'ele', (select idTypeInstance from TypeInstance where entry = 'typ_con_value')),
('con_frame', 'FE', 'FR', 'frm', (select idTypeInstance from TypeInstance where entry = 'typ_con_value')),
('con_framefamily', 'CE', 'FR', 'fam', (select idTypeInstance from TypeInstance where entry = 'typ_con_value')),
('con_lemma', 'CE', 'LM', 'lem', (select idTypeInstance from TypeInstance where entry = 'typ_con_value')),
('con_lexeme', 'CE', 'LX', 'lex', (select idTypeInstance from TypeInstance where entry = 'typ_con_value')),
('con_lu', 'CE', 'LU', 'lu', (select idTypeInstance from TypeInstance where entry = 'typ_con_value')),
('con_semtype', '**', 'ST', 'sty', (select idTypeInstance from TypeInstance where entry = 'typ_con_value')),
('con_stlu', 'CE', 'ST', 'slu', (select idTypeInstance from TypeInstance where entry = 'typ_con_value')),
('con_udfeature', 'CE', 'UF', 'udf', (select idTypeInstance from TypeInstance where entry = 'typ_con_value')),
('con_udrelation', 'CE', 'UR', 'udr', (select idTypeInstance from TypeInstance where entry = 'typ_con_value')),
('con_wordform', 'CE', 'WF', 'wrf', (select idTypeInstance from TypeInstance where entry = 'typ_con_value'));
--
-- qualia
--
insert into ConstraintType (entry, typeEntity1, typeEntity2, prefix, idTypeInstance) values
('con_qualia_formal', 'CE', 'CE', 'fml', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_qualia_constitutive', 'CE', 'CE', 'cst', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_qualia_agentive', 'CE', 'CE', 'agt', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation')),
('con_qualia_telic', 'CE', 'CE', 'tlc', (select idTypeInstance from TypeInstance where entry = 'typ_con_relation'));

commit;

=== copy constraintInstances from Relations

insert into constraintInstance (idConstraint, idConstrained, idConstrainedBy, idConstraintType)
select r.idEntity1, r.idEntity2, r.idEntity3, ct.idConstraintType
from view_relation r join constrainttype ct on (replace(r.relationType, 'rel_constraint', 'con') = ct.entry)
where r.relationType like 'rel_constraint%'
and r.identity3 is not null;
--
-- qualia
--
insert into constraintInstance (idConstraint, idConstrained, idConstrainedBy, idConstraintType)
select r.idEntity1, r.idEntity2, r.idEntity3, ct.idConstraintType
from view_relation r join constrainttype ct on (replace(r.relationType, 'rel', 'con') = ct.entry)
where r.relationType like 'rel_qualia%'
and r.entity1Type = 'CN'
and r.identity3 is not null;
--
-- evokes
--
insert into constraintInstance (idConstraint, idConstrained, idConstrainedBy, idConstraintType)
select r.idEntity1, r.idEntity2, r.idEntity3, ct.idConstraintType
from view_relation r join constrainttype ct on (replace(r.relationType, 'rel', 'con') = ct.entry)
where r.relationType = 'rel_evokes'
and r.entity1Type = 'CN'
and r.identity3 is not null;

