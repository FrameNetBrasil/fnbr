--
-- Associação GF-POS para o Num e Conj
--

select @idRelationType:=idRelationType FROM relationtype where entry = 'rel_gfpos' LIMIT 1;

insert into entityrelation (idRelationType, idEntity1, idEntity2) values
(@idRelationType, (select idEntity from GenericLabel where name = 'Ext' and idLanguage=1), (select idEntity from POS where entry like 'pos_num')),
(@idRelationType, (select idEntity from GenericLabel where name = 'Dep' and idLanguage=1), (select idEntity from POS where entry like 'pos_num')),
(@idRelationType, (select idEntity from GenericLabel where name = 'Núcleo' and idLanguage=1), (select idEntity from POS where entry like 'pos_num')),
(@idRelationType, (select idEntity from GenericLabel where name = 'Dep' and idLanguage=1), (select idEntity from POS where entry like 'pos_c')),
(@idRelationType, (select idEntity from GenericLabel where name = 'Núcleo' and idLanguage=1), (select idEntity from POS where entry like 'pos_c'));
commit;

