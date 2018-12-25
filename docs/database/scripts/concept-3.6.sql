=== add typeInstance para os tipos de concepts (necessary, sufficient, contributory)

start transaction;

insert into Entry (entry, name, description, nick, idLanguage)
select 'typ_concept','Concept Type','Concept Type','Concept Type', idlanguage
from Language;

insert into `type` (entry) values ('typ_concept');

insert into Entry (entry, name, description, nick, idLanguage)
select 'typ_cpt_necessary','Necessary','Necessary Concept','Necessary', idlanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'typ_cpt_sufficient','Sufficient','Sufficient Concept','Sufficient', idlanguage from Language;
insert into Entry (entry, name, description, nick, idLanguage)
select 'typ_cpt_contributory','Contributory','Contributory Concept','Contributory', idlanguage from Language;

insert into entity (alias, type) values ('typ_cpt_necessary','PT');
insert into entity (alias, type) values ('typ_cpt_sufficient','PT');
insert into entity (alias, type) values ('typ_cpt_contributory','PT');

insert into typeinstance (entry, info, flag, idType, idColor, idEntity) values
('typ_cpt_necessary','Necessary',1,(select idType from type where entry='typ_concept'), 1, (select idEntity from Entity where alias='typ_cpt_necessary')),
('typ_cpt_sufficient','Sufficient',1,(select idType from type where entry='typ_concept'), 1, (select idEntity from Entity where alias='typ_cpt_sufficient')),
('typ_cpt_contributory','Relation',1,(select idType from type where entry='typ_concept'), 1, (select idEntity from Entity where alias='typ_cpt_contributory'));

commit;
