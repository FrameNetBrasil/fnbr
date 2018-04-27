start transaction;

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_inhibits_nameentity1','rel_inhibits_nameentity1','rel_inhibits_nameentity1','rel_inhibits_nameentity1',1),
('rel_inhibits_nameentity1','rel_inhibits_nameentity1','rel_inhibits_nameentity1','rel_inhibits_nameentity1',2),
('rel_inhibits_nameentity1','rel_inhibits_nameentity1','rel_inhibits_nameentity1','rel_inhibits_nameentity1',3),
('rel_inhibits_nameentity1','rel_inhibits_nameentity1','rel_inhibits_nameentity1','rel_inhibits_nameentity1',4),
('rel_inhibits_nameentity2','rel_inhibits_nameentity2','rel_inhibits_nameentity2','rel_inhibits_nameentity2',1),
('rel_inhibits_nameentity2','rel_inhibits_nameentity2','rel_inhibits_nameentity2','rel_inhibits_nameentity2',2),
('rel_inhibits_nameentity2','rel_inhibits_nameentity2','rel_inhibits_nameentity2','rel_inhibits_nameentity2',3),
('rel_inhibits_nameentity2','rel_inhibits_nameentity2','rel_inhibits_nameentity2','rel_inhibits_nameentity2',4),
('rel_inhibits_nameentity3','rel_inhibits_nameentity3','rel_inhibits_nameentity3','rel_inhibits_nameentity3',1),
('rel_inhibits_nameentity3','rel_inhibits_nameentity3','rel_inhibits_nameentity3','rel_inhibits_nameentity3',2),
('rel_inhibits_nameentity3','rel_inhibits_nameentity3','rel_inhibits_nameentity3','rel_inhibits_nameentity3',3),
('rel_inhibits_nameentity3','rel_inhibits_nameentity3','rel_inhibits_nameentity3','rel_inhibits_nameentity3',4),
('rel_inhibits', 'inhibits', 'inhibits', 'inhibits', 1),
('rel_inhibits', 'inhibits', 'inhibits', 'inhibits', 2),
('rel_inhibits', 'inhibits', 'inhibits', 'inhibits', 3),
('rel_inhibits', 'inhibits', 'inhibits', 'inhibits', 4);


insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_inhibits', 'rel_inhibits_nameentity1', 'rel_inhibits_nameentity2', 'rel_inhibits_nameentity3', 5, 12);

commit;



