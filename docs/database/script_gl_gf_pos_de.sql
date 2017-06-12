--
-- Entry dos LayerType para Alemão (idlanguage = 9)
--

INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,9 from Entry where (entry like 'lty_%') and (idlanguage = 2);

--
-- entity dos GL
--

insert into entity (alias, type) values (concat('glb_',lower('Cop'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Ctrlr'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Gov'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Supp'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('X'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Ctrlr'),'_', (select idLayerType from layertype where entry = 'lty_adv'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Gov'),'_', (select idLayerType from layertype where entry = 'lty_adv'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('X'),'_', (select idLayerType from layertype where entry = 'lty_adv'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Cop'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Ctrlr'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Gov'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Supp'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('X'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Cop'),'_', (select idLayerType from layertype where entry = 'lty_prep'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Supp'),'_', (select idLayerType from layertype where entry = 'lty_prep'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Asp'),'_', (select idLayerType from layertype where entry = 'lty_verb'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Non-Asp'),'_', (select idLayerType from layertype where entry = 'lty_verb'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('ADC'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('AG'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('AMS'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('APP'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('AVC'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('DA'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('MNR'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('MO'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('OA'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('OC'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('OG'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('OP'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('PD'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('PG'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('PRED'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('SB'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Ant'),'_', (select idLayerType from layertype where entry = 'lty_other'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Exist'),'_', (select idLayerType from layertype where entry = 'lty_other'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Rel'),'_', (select idLayerType from layertype where entry = 'lty_other'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Special-Other'),'_', (select idLayerType from layertype where entry = 'lty_other'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('AA'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('AP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('AVP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CAC'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CAP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CAVP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CC'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CCP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CD'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CH'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CJ'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CM'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CNP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CO'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CPP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CS'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CVC'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CVP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('CVZ'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('DH'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('DL'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('DM'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('EP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('ISU'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('JU'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('MTA'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('MTN'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('NG'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('NP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('PAR'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('PM'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('PN'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('PP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('QL'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('RE'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('RS'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('S'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('VP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('VZ'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Blend'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Canonical'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('deleteS'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Idiom'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('keepS'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Metaphor'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('reexamine'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('sense1'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('sense2'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('sense3'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('sense4'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('sense5'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('sense6'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('sense7'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('sense8'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('sense9'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');
insert into entity (alias, type) values (concat('glb_',lower('Special-Sent'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'), 'GL');

--
-- gl
--

insert into genericlabel (name, idEntity, idColor, idLanguage) values
('Cop', (select idEntity from entity where alias = (concat('glb_',lower('Cop'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9'))), 1, 9),
('Ctrlr', (select idEntity from entity where alias = (concat('glb_',lower('Ctrlr'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9'))), 1, 9),
('Gov', (select idEntity from entity where alias = (concat('glb_',lower('Gov'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9'))), 1, 9),
('Supp', (select idEntity from entity where alias = (concat('glb_',lower('Supp'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9'))), 1, 9),
('X', (select idEntity from entity where alias = (concat('glb_',lower('X'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9'))), 1, 9),
('Ctrlr', (select idEntity from entity where alias = (concat('glb_',lower('Ctrlr'),'_', (select idLayerType from layertype where entry = 'lty_adv'),'_9'))), 1, 9),
('Gov', (select idEntity from entity where alias = (concat('glb_',lower('Gov'),'_', (select idLayerType from layertype where entry = 'lty_adv'),'_9'))), 1, 9),
('X', (select idEntity from entity where alias = (concat('glb_',lower('X'),'_', (select idLayerType from layertype where entry = 'lty_adv'),'_9'))), 1, 9),
('Cop', (select idEntity from entity where alias = (concat('glb_',lower('Cop'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9'))), 1, 9),
('Ctrlr', (select idEntity from entity where alias = (concat('glb_',lower('Ctrlr'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9'))), 1, 9),
('Gov', (select idEntity from entity where alias = (concat('glb_',lower('Gov'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9'))), 1, 9),
('Supp', (select idEntity from entity where alias = (concat('glb_',lower('Supp'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9'))), 1, 9),
('X', (select idEntity from entity where alias = (concat('glb_',lower('X'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9'))), 1, 9),
('Cop', (select idEntity from entity where alias = (concat('glb_',lower('Cop'),'_', (select idLayerType from layertype where entry = 'lty_prep'),'_9'))), 1, 9),
('Supp', (select idEntity from entity where alias = (concat('glb_',lower('Supp'),'_', (select idLayerType from layertype where entry = 'lty_prep'),'_9'))), 1, 9),
('Asp', (select idEntity from entity where alias = (concat('glb_',lower('Asp'),'_', (select idLayerType from layertype where entry = 'lty_verb'),'_9'))), 1, 9),
('Non-Asp', (select idEntity from entity where alias = (concat('glb_',lower('Non-Asp'),'_', (select idLayerType from layertype where entry = 'lty_verb'),'_9'))), 1, 9),
('ADC', (select idEntity from entity where alias = (concat('glb_',lower('ADC'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('AG', (select idEntity from entity where alias = (concat('glb_',lower('AG'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('AMS', (select idEntity from entity where alias = (concat('glb_',lower('AMS'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('APP', (select idEntity from entity where alias = (concat('glb_',lower('APP'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('AVC', (select idEntity from entity where alias = (concat('glb_',lower('AVC'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('DA', (select idEntity from entity where alias = (concat('glb_',lower('DA'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('MNR', (select idEntity from entity where alias = (concat('glb_',lower('MNR'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('MO', (select idEntity from entity where alias = (concat('glb_',lower('MO'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('OA', (select idEntity from entity where alias = (concat('glb_',lower('OA'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('OC', (select idEntity from entity where alias = (concat('glb_',lower('OC'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('OG', (select idEntity from entity where alias = (concat('glb_',lower('OG'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('OP', (select idEntity from entity where alias = (concat('glb_',lower('OP'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('PD', (select idEntity from entity where alias = (concat('glb_',lower('PD'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('PG', (select idEntity from entity where alias = (concat('glb_',lower('PG'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('PRED', (select idEntity from entity where alias = (concat('glb_',lower('PRED'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('SB', (select idEntity from entity where alias = (concat('glb_',lower('SB'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9'))), 1, 9),
('Ant', (select idEntity from entity where alias = (concat('glb_',lower('Ant'),'_', (select idLayerType from layertype where entry = 'lty_other'),'_9'))), 1, 9),
('Exist', (select idEntity from entity where alias = (concat('glb_',lower('Exist'),'_', (select idLayerType from layertype where entry = 'lty_other'),'_9'))), 1, 9),
('Rel', (select idEntity from entity where alias = (concat('glb_',lower('Rel'),'_', (select idLayerType from layertype where entry = 'lty_other'),'_9'))), 1, 9),
('Special-Other', (select idEntity from entity where alias = (concat('glb_',lower('Special-Other'),'_', (select idLayerType from layertype where entry = 'lty_other'),'_9'))), 1, 9),
('AA', (select idEntity from entity where alias = (concat('glb_',lower('AA'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('AP', (select idEntity from entity where alias = (concat('glb_',lower('AP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('AVP', (select idEntity from entity where alias = (concat('glb_',lower('AVP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CAC', (select idEntity from entity where alias = (concat('glb_',lower('CAC'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CAP', (select idEntity from entity where alias = (concat('glb_',lower('CAP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CAVP', (select idEntity from entity where alias = (concat('glb_',lower('CAVP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CC', (select idEntity from entity where alias = (concat('glb_',lower('CC'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CCP', (select idEntity from entity where alias = (concat('glb_',lower('CCP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CD', (select idEntity from entity where alias = (concat('glb_',lower('CD'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CH', (select idEntity from entity where alias = (concat('glb_',lower('CH'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CJ', (select idEntity from entity where alias = (concat('glb_',lower('CJ'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CM', (select idEntity from entity where alias = (concat('glb_',lower('CM'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CNP', (select idEntity from entity where alias = (concat('glb_',lower('CNP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CO', (select idEntity from entity where alias = (concat('glb_',lower('CO'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CP', (select idEntity from entity where alias = (concat('glb_',lower('CP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CPP', (select idEntity from entity where alias = (concat('glb_',lower('CPP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CS', (select idEntity from entity where alias = (concat('glb_',lower('CS'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CVC', (select idEntity from entity where alias = (concat('glb_',lower('CVC'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CVP', (select idEntity from entity where alias = (concat('glb_',lower('CVP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('CVZ', (select idEntity from entity where alias = (concat('glb_',lower('CVZ'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('DH', (select idEntity from entity where alias = (concat('glb_',lower('DH'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('DL', (select idEntity from entity where alias = (concat('glb_',lower('DL'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('DM', (select idEntity from entity where alias = (concat('glb_',lower('DM'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('EP', (select idEntity from entity where alias = (concat('glb_',lower('EP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('ISU', (select idEntity from entity where alias = (concat('glb_',lower('ISU'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('JU', (select idEntity from entity where alias = (concat('glb_',lower('JU'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('MTA', (select idEntity from entity where alias = (concat('glb_',lower('MTA'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('MTN', (select idEntity from entity where alias = (concat('glb_',lower('MTN'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('NG', (select idEntity from entity where alias = (concat('glb_',lower('NG'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('NP', (select idEntity from entity where alias = (concat('glb_',lower('NP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('PAR', (select idEntity from entity where alias = (concat('glb_',lower('PAR'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('PM', (select idEntity from entity where alias = (concat('glb_',lower('PM'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('PN', (select idEntity from entity where alias = (concat('glb_',lower('PN'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('PP', (select idEntity from entity where alias = (concat('glb_',lower('PP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('QL', (select idEntity from entity where alias = (concat('glb_',lower('QL'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('RE', (select idEntity from entity where alias = (concat('glb_',lower('RE'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('RS', (select idEntity from entity where alias = (concat('glb_',lower('RS'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('S', (select idEntity from entity where alias = (concat('glb_',lower('S'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('VP', (select idEntity from entity where alias = (concat('glb_',lower('VP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('VZ', (select idEntity from entity where alias = (concat('glb_',lower('VZ'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9'))), 1, 9),
('Blend', (select idEntity from entity where alias = (concat('glb_',lower('Blend'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('Canonical', (select idEntity from entity where alias = (concat('glb_',lower('Canonical'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('deleteS', (select idEntity from entity where alias = (concat('glb_',lower('deleteS'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('Idiom', (select idEntity from entity where alias = (concat('glb_',lower('Idiom'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('keepS', (select idEntity from entity where alias = (concat('glb_',lower('keepS'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('Metaphor', (select idEntity from entity where alias = (concat('glb_',lower('Metaphor'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('reexamine', (select idEntity from entity where alias = (concat('glb_',lower('reexamine'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('sense1', (select idEntity from entity where alias = (concat('glb_',lower('sense1'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('sense2', (select idEntity from entity where alias = (concat('glb_',lower('sense2'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('sense3', (select idEntity from entity where alias = (concat('glb_',lower('sense3'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('sense4', (select idEntity from entity where alias = (concat('glb_',lower('sense4'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('sense5', (select idEntity from entity where alias = (concat('glb_',lower('sense5'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('sense6', (select idEntity from entity where alias = (concat('glb_',lower('sense6'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('sense7', (select idEntity from entity where alias = (concat('glb_',lower('sense7'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('sense8', (select idEntity from entity where alias = (concat('glb_',lower('sense8'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('sense9', (select idEntity from entity where alias = (concat('glb_',lower('sense9'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9),
('Special-Sent', (select idEntity from entity where alias = (concat('glb_',lower('Special-Sent'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))), 1, 9);

--
-- relation type layertype-GL
--

insert into entityrelation (idRelationType, idEntity1, idEntity2) values 
(17, (select idEntity from Layertype where entry =  'lty_adj'), (select idEntity from entity where alias = (concat('glb_',lower('Cop'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_adj'), (select idEntity from entity where alias = (concat('glb_',lower('Ctrlr'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_adj'), (select idEntity from entity where alias = (concat('glb_',lower('Gov'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_adj'), (select idEntity from entity where alias = (concat('glb_',lower('Supp'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_adj'), (select idEntity from entity where alias = (concat('glb_',lower('X'),'_', (select idLayerType from layertype where entry = 'lty_adj'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_adv'), (select idEntity from entity where alias = (concat('glb_',lower('Ctrlr'),'_', (select idLayerType from layertype where entry = 'lty_adv'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_adv'), (select idEntity from entity where alias = (concat('glb_',lower('Gov'),'_', (select idLayerType from layertype where entry = 'lty_adv'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_adv'), (select idEntity from entity where alias = (concat('glb_',lower('X'),'_', (select idLayerType from layertype where entry = 'lty_adv'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_noun'), (select idEntity from entity where alias = (concat('glb_',lower('Cop'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_noun'), (select idEntity from entity where alias = (concat('glb_',lower('Ctrlr'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_noun'), (select idEntity from entity where alias = (concat('glb_',lower('Gov'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_noun'), (select idEntity from entity where alias = (concat('glb_',lower('Supp'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_noun'), (select idEntity from entity where alias = (concat('glb_',lower('X'),'_', (select idLayerType from layertype where entry = 'lty_noun'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_prep'), (select idEntity from entity where alias = (concat('glb_',lower('Cop'),'_', (select idLayerType from layertype where entry = 'lty_prep'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_prep'), (select idEntity from entity where alias = (concat('glb_',lower('Supp'),'_', (select idLayerType from layertype where entry = 'lty_prep'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_verb'), (select idEntity from entity where alias = (concat('glb_',lower('Asp'),'_', (select idLayerType from layertype where entry = 'lty_verb'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_verb'), (select idEntity from entity where alias = (concat('glb_',lower('Non-Asp'),'_', (select idLayerType from layertype where entry = 'lty_verb'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('ADC'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('AG'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('AMS'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('APP'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('AVC'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('DA'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('MNR'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('MO'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('OA'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('OC'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('OG'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('OP'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('PD'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('PG'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('PRED'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_gf'), (select idEntity from entity where alias = (concat('glb_',lower('SB'),'_', (select idLayerType from layertype where entry = 'lty_gf'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_other'), (select idEntity from entity where alias = (concat('glb_',lower('Ant'),'_', (select idLayerType from layertype where entry = 'lty_other'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_other'), (select idEntity from entity where alias = (concat('glb_',lower('Rel'),'_', (select idLayerType from layertype where entry = 'lty_other'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_other'), (select idEntity from entity where alias = (concat('glb_',lower('Special-Other'),'_', (select idLayerType from layertype where entry = 'lty_other'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('AA'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('AP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('AVP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CAC'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CAP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CAVP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CC'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CCP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CD'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CH'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CJ'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CM'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CNP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CO'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CPP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CS'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CVC'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CVP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('CVZ'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('DH'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('DL'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('DM'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('EP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('ISU'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('JU'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('MTA'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('MTN'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('NG'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('NP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('PAR'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('PM'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('PN'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('PP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('QL'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('RE'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('RS'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('S'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('VP'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_pt'), (select idEntity from entity where alias = (concat('glb_',lower('VZ'),'_', (select idLayerType from layertype where entry = 'lty_pt'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('Blend'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('Canonical'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('deleteS'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('Idiom'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('keepS'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('Metaphor'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('reexamine'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('sense1'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('sense2'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('sense3'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('sense4'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('sense5'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('sense6'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('sense7'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('sense8'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('sense9'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9')))),
(17, (select idEntity from Layertype where entry =  'lty_sent'), (select idEntity from entity where alias = (concat('glb_',lower('Special-Sent'),'_', (select idLayerType from layertype where entry = 'lty_sent'),'_9'))));

--
-- alterando as cores
--
update genericlabel set idcolor = 79 where idgenericlabel =  520;
update genericlabel set idcolor = 67 where idgenericlabel =  521;
update genericlabel set idcolor = 30 where idgenericlabel =  522;
update genericlabel set idcolor = 76 where idgenericlabel =  523;
update genericlabel set idcolor = 37 where idgenericlabel =  524;
update genericlabel set idcolor = 67 where idgenericlabel =  525;
update genericlabel set idcolor = 30 where idgenericlabel =  526;
update genericlabel set idcolor = 37 where idgenericlabel =  527;
update genericlabel set idcolor = 79 where idgenericlabel =  528;
update genericlabel set idcolor = 67 where idgenericlabel =  529;
update genericlabel set idcolor = 30 where idgenericlabel =  530;
update genericlabel set idcolor = 76 where idgenericlabel =  531;
update genericlabel set idcolor = 37 where idgenericlabel =  532;
update genericlabel set idcolor = 79 where idgenericlabel =  533;
update genericlabel set idcolor = 76 where idgenericlabel =  534;
update genericlabel set idcolor = 85 where idgenericlabel =  535;
update genericlabel set idcolor = 80 where idgenericlabel =  536;
update genericlabel set idcolor = 57 where idgenericlabel =  553;
update genericlabel set idcolor = 85 where idgenericlabel =  554;
update genericlabel set idcolor = 79 where idgenericlabel =  555;
update genericlabel set idcolor = 85 where idgenericlabel =  556;
update genericlabel set idcolor = 67 where idgenericlabel =  559;
update genericlabel set idcolor = 85 where idgenericlabel =  563;
update genericlabel set idcolor = 85 where idgenericlabel =  565;
update genericlabel set idcolor = 85 where idgenericlabel =  586;
update genericlabel set idcolor = 79 where idgenericlabel =  586;
update genericlabel set idcolor = 85 where idgenericlabel =  590;
update genericlabel set idcolor = 57 where idgenericlabel =  590;
update genericlabel set idcolor = 85 where idgenericlabel =  597;
update genericlabel set idcolor = 85 where idgenericlabel =  598;
update genericlabel set idcolor = 85 where idgenericlabel =  599;
update genericlabel set idcolor = 85 where idgenericlabel =  600;
update genericlabel set idcolor = 85 where idgenericlabel =  601;
update genericlabel set idcolor = 85 where idgenericlabel =  602;
update genericlabel set idcolor = 85 where idgenericlabel =  603;
update genericlabel set idcolor = 85 where idgenericlabel =  604;
update genericlabel set idcolor = 85 where idgenericlabel =  605;
update genericlabel set idcolor = 85 where idgenericlabel =  606;
update genericlabel set idcolor = 85 where idgenericlabel =  607;
update genericlabel set idcolor = 85 where idgenericlabel =  608;
update genericlabel set idcolor = 85 where idgenericlabel =  609;
update genericlabel set idcolor = 85 where idgenericlabel =  610;
update genericlabel set idcolor = 85 where idgenericlabel =  611;
update genericlabel set idcolor = 85 where idgenericlabel =  612;
update genericlabel set idcolor = 85 where idgenericlabel =  613;


--
-- Associação GF-POS para o Alemão (de)
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

