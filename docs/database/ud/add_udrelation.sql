---
--- Implementing UDRelation table
--- 26/07/2018
---

--
-- Type udr_relation; TypeInstance
--

start transaction;

insert into Entry (entry, name, description, nick, idLanguage) values
('udr_relation','UD Relation','UD Relation','UD Relation',1),
('udr_relation','UD Relation','UD Relation','UD Relation',2),
('udr_relation','UD Relation','UD Relation','UD Relation',3),
('udr_relation','UD Relation','UD Relation','UD Relation',4);

insert into `type` (entry) values ('udr_relation');

insert into entity (alias, type) values 
('udr_nominals', 'UR'),
('udr_clauses', 'UR'),
('udr_modifier_words', 'UR'),
('udr_function_words', 'UR'),
('udr_coordination','UR'),
('udr_mwe','UR'),
('udr_loose', 'UR'),
('udr_special', 'UR'),
('udr_other', 'UR');

insert into Entry (entry, name, description, nick, idLanguage) values
('udr_nominals', 'Nominals', 'Nominals', 'Nominals', 1),
('udr_clauses', 'Clauses', 'Clauses', 'Clauses',1),
('udr_modifier_words', 'Modifier Words', 'Modifier Words', 'Modifier Words',1),
('udr_function_words', 'Function Words', 'Function Words', 'Function Words', 1),
('udr_coordination','Coordination','Coordination','Coordination',1),
('udr_mwe','MWE','MWE','MWE',1),
('udr_loose', 'Loose', 'Loose', 'Loose', 1),
('udr_special', 'Special', 'Special', 'Special', 1),
('udr_other', 'Other', 'Other', 'Other', 1);

insert into typeinstance (entry, info, flag, idType, idColor, idEntity) values
('udr_nominals', 'Nominals', 1, (select idType from type where entry='udr_relation'), 1, (select idEntity from Entity where alias='udr_nominals')),
('udr_clauses', 'Clauses', 1, (select idType from type where entry='udr_relation'), 1, (select idEntity from Entity where alias='udr_clauses')),
('udr_modifier_words', 'Modifier Words', 1, (select idType from type where entry='udr_relation'), 1, (select idEntity from Entity where alias='udr_modifier_words')),
('udr_function_words', 'Function Words', 1, (select idType from type where entry='udr_relation'), 1, (select idEntity from Entity where alias='udr_function_words')),
('udr_coordination','Coordination', 1, (select idType from type where entry='udr_relation'), 1, (select idEntity from Entity where alias='udr_coordination')),
('udr_mwe','MWE', 1, (select idType from type where entry='udr_relation'), 1, (select idEntity from Entity where alias='udr_mwe')),
('udr_loose', 'Loose', 1, (select idType from type where entry='udr_relation'), 1, (select idEntity from Entity where alias='udr_loose')),
('udr_special', 'Special', 1, (select idType from type where entry='udr_relation'), 1, (select idEntity from Entity where alias='udr_special')),
('udr_other', 'Other', 1, (select idType from type where entry='udr_relation'), 1, (select idEntity from Entity where alias='udr_other'));

commit;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 2
from entry where entry like 'udr_%';

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 3
from entry where entry like 'udr_%';

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 4
from entry where entry like 'udr_%';

insert into Entry (entry, name, description, nick, idLanguage)
select entry, entry, entry, entry, 0
from entry where entry like 'udr_%';


--
-- Tabela UDRelation, com os values de cada Relation
-- 

start transaction;

insert into entity (alias, type) values
('udr_acl', 'UR'),
('udr_advcl', 'UR'),
('udr_advmod', 'UR'),
('udr_amod', 'UR'),
('udr_appos', 'UR'),
('udr_aux', 'UR'),
('udr_case', 'UR'),
('udr_cc', 'UR'),
('udr_ccomp', 'UR'),
('udr_clf', 'UR'),
('udr_compound', 'UR'),
('udr_conj', 'UR'),
('udr_cop', 'UR'),
('udr_csubj', 'UR'),
('udr_dep', 'UR'),
('udr_det', 'UR'),
('udr_discourse', 'UR'),
('udr_dislocated', 'UR'),
('udr_expl', 'UR'),
('udr_fixed', 'UR'),
('udr_flat', 'UR'),
('udr_goeswith', 'UR'),
('udr_iobj', 'UR'),
('udr_list', 'UR'),
('udr_mark', 'UR'),
('udr_nmod', 'UR'),
('udr_nsubj', 'UR'),
('udr_nummod', 'UR'),
('udr_obj', 'UR'),
('udr_obl', 'UR'),
('udr_orphan', 'UR'),
('udr_parataxis', 'UR'),
('udr_punct', 'UR'),
('udr_reparandum', 'UR'),
('udr_root', 'UR'),
('udr_vocative', 'UR'),
('udr_xcomp', 'UR');

insert into UDRelation (info, idEntity, idTypeInstance) values
('acl',(select idEntity from entity where alias = 'udr_acl'),(select idTypeInstance from TypeInstance where entry = 'udr_clauses')),
('advcl',(select idEntity from entity where alias = 'udr_advcl'),(select idTypeInstance from TypeInstance where entry = 'udr_clauses')),
('advmod',(select idEntity from entity where alias = 'udr_advmod'),(select idTypeInstance from TypeInstance where entry = 'udr_modifier_words')),
('amod',(select idEntity from entity where alias = 'udr_amod'),(select idTypeInstance from TypeInstance where entry = 'udr_modifier_words')),
('appos',(select idEntity from entity where alias = 'udr_appos'),(select idTypeInstance from TypeInstance where entry = 'udr_nominals')),
('aux',(select idEntity from entity where alias = 'udr_aux'),(select idTypeInstance from TypeInstance where entry = 'udr_function_words')),
('case',(select idEntity from entity where alias = 'udr_case'),(select idTypeInstance from TypeInstance where entry = 'udr_function_words')),
('cc',(select idEntity from entity where alias = 'udr_cc'),(select idTypeInstance from TypeInstance where entry = 'udr_coordination')),
('ccomp',(select idEntity from entity where alias = 'udr_ccomp'),(select idTypeInstance from TypeInstance where entry = 'udr_clauses')),
('clf',(select idEntity from entity where alias = 'udr_clf'),(select idTypeInstance from TypeInstance where entry = 'udr_function_words')),
('compound',(select idEntity from entity where alias = 'udr_compound'),(select idTypeInstance from TypeInstance where entry = 'udr_mwe')),
('conj',(select idEntity from entity where alias = 'udr_conj'),(select idTypeInstance from TypeInstance where entry = 'udr_coordination')),
('cop',(select idEntity from entity where alias = 'udr_cop'),(select idTypeInstance from TypeInstance where entry = 'udr_function_words')),
('csubj',(select idEntity from entity where alias = 'udr_csubj'),(select idTypeInstance from TypeInstance where entry = 'udr_clauses')),
('dep',(select idEntity from entity where alias = 'udr_dep'),(select idTypeInstance from TypeInstance where entry = 'udr_other')),
('det',(select idEntity from entity where alias = 'udr_det'),(select idTypeInstance from TypeInstance where entry = 'udr_function_words')),
('discourse',(select idEntity from entity where alias = 'udr_discourse'),(select idTypeInstance from TypeInstance where entry = 'udr_modifier_words')),
('dislocated',(select idEntity from entity where alias = 'udr_dislocated'),(select idTypeInstance from TypeInstance where entry = 'udr_nominals')),
('expl',(select idEntity from entity where alias = 'udr_expl'),(select idTypeInstance from TypeInstance where entry = 'udr_nominals')),
('fixed',(select idEntity from entity where alias = 'udr_fixed'),(select idTypeInstance from TypeInstance where entry = 'udr_mwe')),
('flat',(select idEntity from entity where alias = 'udr_flat'),(select idTypeInstance from TypeInstance where entry = 'udr_mwe')),
('goeswith',(select idEntity from entity where alias = 'udr_goeswith'),(select idTypeInstance from TypeInstance where entry = 'udr_special')),
('iobj',(select idEntity from entity where alias = 'udr_iobj'),(select idTypeInstance from TypeInstance where entry = 'udr_nominals')),
('list',(select idEntity from entity where alias = 'udr_list'),(select idTypeInstance from TypeInstance where entry = 'udr_loose')),
('mark',(select idEntity from entity where alias = 'udr_mark'),(select idTypeInstance from TypeInstance where entry = 'udr_function_words')),
('nmod',(select idEntity from entity where alias = 'udr_nmod'),(select idTypeInstance from TypeInstance where entry = 'udr_nominals')),
('nsubj',(select idEntity from entity where alias = 'udr_nsubj'),(select idTypeInstance from TypeInstance where entry = 'udr_nominals')),
('nummod',(select idEntity from entity where alias = 'udr_nummod'),(select idTypeInstance from TypeInstance where entry = 'udr_nominals')),
('obj',(select idEntity from entity where alias = 'udr_obj'),(select idTypeInstance from TypeInstance where entry = 'udr_nominals')),
('obl',(select idEntity from entity where alias = 'udr_obl'),(select idTypeInstance from TypeInstance where entry = 'udr_nominals')),
('orphan',(select idEntity from entity where alias = 'udr_orphan'),(select idTypeInstance from TypeInstance where entry = 'udr_special')),
('parataxis',(select idEntity from entity where alias = 'udr_parataxis'),(select idTypeInstance from TypeInstance where entry = 'udr_loose')),
('punct',(select idEntity from entity where alias = 'udr_punct'),(select idTypeInstance from TypeInstance where entry = 'udr_other')),
('reparandum',(select idEntity from entity where alias = 'udr_reparandum'),(select idTypeInstance from TypeInstance where entry = 'udr_special')),
('root',(select idEntity from entity where alias = 'udr_root'),(select idTypeInstance from TypeInstance where entry = 'udr_other')),
('vocative',(select idEntity from entity where alias = 'udr_vocative'),(select idTypeInstance from TypeInstance where entry = 'udr_nominals')),
('xcomp',(select idEntity from entity where alias = 'udr_xcomp'),(select idTypeInstance from TypeInstance where entry = 'udr_clauses'));

commit;

--
-- Acrescentando algumas extensões do ud-portuguese - 20180831
--

start transaction;

insert into entity (alias, type) values
('udr_aux_pass', 'UR'),
('udr_nsubj_pass', 'UR'),
('udr_obj_pass', 'UR'),
('udr_acl_relcl', 'UR'),
('udr_acl_inf', 'UR'),
('udr_acl_part', 'UR'),
('udr_csubj_pass', 'UR'),
('udr_det_poss', 'UR'),
('udr_expl_pv', 'UR'),
('udr_xcomp_adj', 'UR');

insert into UDRelation (info, idEntity, idTypeInstance) values
('aux_pass',(select idEntity from entity where alias = 'udr_aux_pass'),(select idTypeInstance from TypeInstance where entry = 'udr_function_words')),
('nsubj_pass',(select idEntity from entity where alias = 'udr_nsubj_pass'),(select idTypeInstance from TypeInstance where entry = 'udr_nominals')),
('obj_pass',(select idEntity from entity where alias = 'udr_obj_pass'),(select idTypeInstance from TypeInstance where entry = 'udr_nominals')),
('acl_relcl',(select idEntity from entity where alias = 'udr_acl_relcl'),(select idTypeInstance from TypeInstance where entry = 'udr_clauses')),
('acl_inf',(select idEntity from entity where alias = 'udr_acl_inf'),(select idTypeInstance from TypeInstance where entry = 'udr_clauses')),
('acl_part',(select idEntity from entity where alias = 'udr_acl_part'),(select idTypeInstance from TypeInstance where entry = 'udr_clauses')),
('csubj_pass',(select idEntity from entity where alias = 'udr_csubj_pass'),(select idTypeInstance from TypeInstance where entry = 'udr_clauses')),
('det_poss',(select idEntity from entity where alias = 'udr_det_poss'),(select idTypeInstance from TypeInstance where entry = 'udr_function_words')),
('expl_pv',(select idEntity from entity where alias = 'udr_expl_pv'),(select idTypeInstance from TypeInstance where entry = 'udr_nominals')),
('xcomp_adj',(select idEntity from entity where alias = 'udr_xcomp_adj'),(select idTypeInstance from TypeInstance where entry = 'udr_clauses'));

commit;

