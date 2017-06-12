--
-- Associação GF-POS para o Espanhol
--

select @idRelationType:=idRelationType FROM relationtype where entry = 'rel_gfpos' LIMIT 1;

insert into entityrelation (idRelationType, idEntity1, idEntity2) values
(@idRelationType, (select idEntity from GenericLabel where name = 'Adjct' and idLanguage=3), (select idEntity from POS where entry like 'pos_n')),
(@idRelationType, (select idEntity from GenericLabel where name = 'Adjct' and idLanguage=3), (select idEntity from POS where entry like 'pos_a')),
(@idRelationType, (select idEntity from GenericLabel where name = 'Adjct' and idLanguage=3), (select idEntity from POS where entry like 'pos_adv')),
(@idRelationType, (select idEntity from GenericLabel where name = 'AdvObj' and idLanguage=3), (select idEntity from POS where entry like 'pos_v')),
(@idRelationType, (select idEntity from GenericLabel where name = 'APos' and idLanguage=3), (select idEntity from POS where entry like 'pos_n')),
(@idRelationType, (select idEntity from GenericLabel where name = 'Appositive' and idLanguage=3), (select idEntity from POS where entry like 'pos_n')),
(@idRelationType, (select idEntity from GenericLabel where name = 'Comp' and idLanguage=3), (select idEntity from POS where entry like 'pos_v')),
(@idRelationType, (select idEntity from GenericLabel where name = 'Comp' and idLanguage=3), (select idEntity from POS where entry like 'pos_prep')),
(@idRelationType, (select idEntity from GenericLabel where name = 'DObj' and idLanguage=3), (select idEntity from POS where entry like 'pos_v')),
(@idRelationType, (select idEntity from GenericLabel where name = 'Ext' and idLanguage=3), (select idEntity from POS where entry like 'pos_v')),
(@idRelationType, (select idEntity from GenericLabel where name = 'Head' and idLanguage=3), (select idEntity from POS where entry like 'pos_a')),
(@idRelationType, (select idEntity from GenericLabel where name = 'IObj' and idLanguage=3), (select idEntity from POS where entry like 'pos_v')),
(@idRelationType, (select idEntity from GenericLabel where name = 'Mod' and idLanguage=3), (select idEntity from POS where entry like 'pos_n')),
(@idRelationType, (select idEntity from GenericLabel where name = 'PObj' and idLanguage=3), (select idEntity from POS where entry like 'pos_v')),
(@idRelationType, (select idEntity from GenericLabel where name = 'Quant' and idLanguage=3), (select idEntity from POS where entry like 'pos_n'));
commit;

