--
-- Implantação do BFFType
-- 

Different Perspective: the LU imposes a perspective that is different from the one in the original frame. 
Different Causative Alternation: the LU requires a causative interpretation that is not present in the original frame, which may be either inchoative or stative
Different Inchoative Alternation: the LU requires an inchoative interpretation that is not present in the original frame, which may be either causative or stative 
Different Stative Alternation: the LU requires a stative interpretation that is not present in the original frame, which may be either causative or inchoative 
Too Specific: the LU is more generic than the background frame 
Too Generic: the LU requires a frame more specific than the one available in the original database 
Different Entailment: the LU has different entailments than the ones afforded by the original frame 
Different Coreness Status: some non-core FE should be core in the target language 
Missing FE: there should be a FE in the original frame that is missing. The missing FE must be listed in the Other/Missing FE field. 
Other: all other non-listed cases. The difference must be specified in the Other/Missing FE field.

--
-- Type
--
INSERT INTO Type ( entry ) VALUES ('typ_bff');

INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,2 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,3 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,4 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,5 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,6 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,7 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,8 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,9 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,10 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,11 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,12 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,13 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,14 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,15 from Entry where (entry like 'type_bff') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,16 from Entry where (entry like 'type_bff') and (idLanguage = 1);



--
-- TypeInstance
--

INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('bff_diffperspective','DiffPerspective','Different Perspective','DiffPerspective',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('bff_diffcausative','DiffCausative','Different Causative Alternation','DiffCausative',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('bff_diffinchoative','DiffInchoative','Different Inchoative Alternation','DiffInchoative',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('bff_diffstative','DiffStative','Different Stative Alternation','DiffStative',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('bff_toospecific','TooSpecific','Too Specific','TooSpecific',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('bff_toogeneric','TooGeneric','Too Generic','TooGeneric',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('bff_diffentailment','DiffEntailment','Diffrent Entailment','DiffEntailment',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('bff_other','Other','Other','Other',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('bff_diffcs','DiffCS','Different Coreness Status','DiffCS',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('bff_missingfe','MissingFE','Missing FE','MissingFE',1);

INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,2 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,3 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,4 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,5 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,6 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,7 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,8 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,9 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,10 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,11 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,12 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,13 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,14 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,15 from Entry where (entry like 'bff_%') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,16 from Entry where (entry like 'bff_%') and (idLanguage = 1);

insert into Entity(alias, type) VALUES ('bff_diffperspective','BF');
insert into Entity(alias, type) VALUES ('bff_diffcausative','BF');
insert into Entity(alias, type) VALUES ('bff_diffinchoative','BF');
insert into Entity(alias, type) VALUES ('bff_diffstative','BF');
insert into Entity(alias, type) VALUES ('bff_toospecific','BF');
insert into Entity(alias, type) VALUES ('bff_toogeneric','BF');
insert into Entity(alias, type) VALUES ('bff_diffentailment','BF');
insert into Entity(alias, type) VALUES ('bff_other','BF');
insert into Entity(alias, type) VALUES ('bff_diffcs','BF');
insert into Entity(alias, type) VALUES ('bff_missingfe','BF');

insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) VALUES ('bff_diffperspective',0,1,6,1, (select idEntity from Entity where alias = 'bff_diffperspective'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) VALUES ('bff_diffcausative',0,1,6,1, (select idEntity from Entity where alias = 'bff_diffcausative'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) VALUES ('bff_diffinchoative',0,1,6,1, (select idEntity from Entity where alias = 'bff_diffinchoative'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) VALUES ('bff_diffstative',0,1,6,1, (select idEntity from Entity where alias = 'bff_diffstative'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) VALUES ('bff_toospecific',0,1,6,1, (select idEntity from Entity where alias = 'bff_toospecific'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) VALUES ('bff_toogeneric',0,1,6,1, (select idEntity from Entity where alias = 'bff_toogeneric'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) VALUES ('bff_diffentailment',0,1,6,1, (select idEntity from Entity where alias = 'bff_diffentailment'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) VALUES ('bff_other',0,1,6,1, (select idEntity from Entity where alias = 'bff_other'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) VALUES ('bff_diffcs',0,1,6,1, (select idEntity from Entity where alias = 'bff_diffcs'));
insert into TypeInstance(entry, info, flag, idType, idColor, idEntity) VALUES ('bff_missingfe',0,1,6,1, (select idEntity from Entity where alias = 'bff_missingfe'));
