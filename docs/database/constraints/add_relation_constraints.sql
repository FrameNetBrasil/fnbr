start transaction;

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_wordform_nameentity1','rel_constraint_wordform_nameentity1','rel_constraint_wordform_nameentity1','rel_constraint_wordform_nameentity1',1),
('rel_constraint_wordform_nameentity1','rel_constraint_wordform_nameentity1','rel_constraint_wordform_nameentity1','rel_constraint_wordform_nameentity1',2),
('rel_constraint_wordform_nameentity1','rel_constraint_wordform_nameentity1','rel_constraint_wordform_nameentity1','rel_constraint_wordform_nameentity1',3),
('rel_constraint_wordform_nameentity1','rel_constraint_wordform_nameentity1','rel_constraint_wordform_nameentity1','rel_constraint_wordform_nameentity1',4),
('rel_constraint_wordform_nameentity2','rel_constraint_wordform_nameentity2','rel_constraint_wordform_nameentity2','rel_constraint_wordform_nameentity2',1),
('rel_constraint_wordform_nameentity2','rel_constraint_wordform_nameentity2','rel_constraint_wordform_nameentity2','rel_constraint_wordform_nameentity2',2),
('rel_constraint_wordform_nameentity2','rel_constraint_wordform_nameentity2','rel_constraint_wordform_nameentity2','rel_constraint_wordform_nameentity2',3),
('rel_constraint_wordform_nameentity2','rel_constraint_wordform_nameentity2','rel_constraint_wordform_nameentity2','rel_constraint_wordform_nameentity2',4),
('rel_constraint_wordform_nameentity3','rel_constraint_wordform_nameentity3','rel_constraint_wordform_nameentity3','rel_constraint_wordform_nameentity3',1),
('rel_constraint_wordform_nameentity3','rel_constraint_wordform_nameentity3','rel_constraint_wordform_nameentity3','rel_constraint_wordform_nameentity3',2),
('rel_constraint_wordform_nameentity3','rel_constraint_wordform_nameentity3','rel_constraint_wordform_nameentity3','rel_constraint_wordform_nameentity3',3),
('rel_constraint_wordform_nameentity3','rel_constraint_wordform_nameentity3','rel_constraint_wordform_nameentity3','rel_constraint_wordform_nameentity3',4),
('rel_constraint_wordform', 'Constraint Wordform', 'Constraint Wordform', 'Constraint Wordform', 1),
('rel_constraint_wordform', 'Constraint Wordform', 'Constraint Wordform', 'Constraint Wordform', 2),
('rel_constraint_wordform', 'Constraint Wordform', 'Constraint Wordform', 'Constraint Wordform', 3),
('rel_constraint_wordform', 'Constraint Wordform', 'Constraint Wordform', 'Constraint Wordform', 4);


insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_wordform', 'rel_constraint_wordform_nameentity1', 'rel_constraint_wordform_nameentity2', 'rel_constraint_wordform_nameentity3', 6, 1);

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_lexeme_nameentity1','rel_constraint_lexeme_nameentity1','rel_constraint_lexeme_nameentity1','rel_constraint_lexeme_nameentity1',1),
('rel_constraint_lexeme_nameentity1','rel_constraint_lexeme_nameentity1','rel_constraint_lexeme_nameentity1','rel_constraint_lexeme_nameentity1',2),
('rel_constraint_lexeme_nameentity1','rel_constraint_lexeme_nameentity1','rel_constraint_lexeme_nameentity1','rel_constraint_lexeme_nameentity1',3),
('rel_constraint_lexeme_nameentity1','rel_constraint_lexeme_nameentity1','rel_constraint_lexeme_nameentity1','rel_constraint_lexeme_nameentity1',4),
('rel_constraint_lexeme_nameentity2','rel_constraint_lexeme_nameentity2','rel_constraint_lexeme_nameentity2','rel_constraint_lexeme_nameentity2',1),
('rel_constraint_lexeme_nameentity2','rel_constraint_lexeme_nameentity2','rel_constraint_lexeme_nameentity2','rel_constraint_lexeme_nameentity2',2),
('rel_constraint_lexeme_nameentity2','rel_constraint_lexeme_nameentity2','rel_constraint_lexeme_nameentity2','rel_constraint_lexeme_nameentity2',3),
('rel_constraint_lexeme_nameentity2','rel_constraint_lexeme_nameentity2','rel_constraint_lexeme_nameentity2','rel_constraint_lexeme_nameentity2',4),
('rel_constraint_lexeme_nameentity3','rel_constraint_lexeme_nameentity3','rel_constraint_lexeme_nameentity3','rel_constraint_lexeme_nameentity3',1),
('rel_constraint_lexeme_nameentity3','rel_constraint_lexeme_nameentity3','rel_constraint_lexeme_nameentity3','rel_constraint_lexeme_nameentity3',2),
('rel_constraint_lexeme_nameentity3','rel_constraint_lexeme_nameentity3','rel_constraint_lexeme_nameentity3','rel_constraint_lexeme_nameentity3',3),
('rel_constraint_lexeme_nameentity3','rel_constraint_lexeme_nameentity3','rel_constraint_lexeme_nameentity3','rel_constraint_lexeme_nameentity3',4),
('rel_constraint_lexeme', 'Constraint Lexeme', 'Constraint Lexeme', 'Constraint Lexeme', 1),
('rel_constraint_lexeme', 'Constraint Lexeme', 'Constraint Lexeme', 'Constraint Lexeme', 2),
('rel_constraint_lexeme', 'Constraint Lexeme', 'Constraint Lexeme', 'Constraint Lexeme', 3),
('rel_constraint_lexeme', 'Constraint Lexeme', 'Constraint Lexeme', 'Constraint Lexeme', 4);


insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_lexeme', 'rel_constraint_lexeme_nameentity1', 'rel_constraint_lexeme_nameentity2', 'rel_constraint_lexeme_nameentity3', 6, 1);

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_lemma_nameentity1','rel_constraint_lemma_nameentity1','rel_constraint_lemma_nameentity1','rel_constraint_lemma_nameentity1',1),
('rel_constraint_lemma_nameentity1','rel_constraint_lemma_nameentity1','rel_constraint_lemma_nameentity1','rel_constraint_lemma_nameentity1',2),
('rel_constraint_lemma_nameentity1','rel_constraint_lemma_nameentity1','rel_constraint_lemma_nameentity1','rel_constraint_lemma_nameentity1',3),
('rel_constraint_lemma_nameentity1','rel_constraint_lemma_nameentity1','rel_constraint_lemma_nameentity1','rel_constraint_lemma_nameentity1',4),
('rel_constraint_lemma_nameentity2','rel_constraint_lemma_nameentity2','rel_constraint_lemma_nameentity2','rel_constraint_lemma_nameentity2',1),
('rel_constraint_lemma_nameentity2','rel_constraint_lemma_nameentity2','rel_constraint_lemma_nameentity2','rel_constraint_lemma_nameentity2',2),
('rel_constraint_lemma_nameentity2','rel_constraint_lemma_nameentity2','rel_constraint_lemma_nameentity2','rel_constraint_lemma_nameentity2',3),
('rel_constraint_lemma_nameentity2','rel_constraint_lemma_nameentity2','rel_constraint_lemma_nameentity2','rel_constraint_lemma_nameentity2',4),
('rel_constraint_lemma_nameentity3','rel_constraint_lemma_nameentity3','rel_constraint_lemma_nameentity3','rel_constraint_lemma_nameentity3',1),
('rel_constraint_lemma_nameentity3','rel_constraint_lemma_nameentity3','rel_constraint_lemma_nameentity3','rel_constraint_lemma_nameentity3',2),
('rel_constraint_lemma_nameentity3','rel_constraint_lemma_nameentity3','rel_constraint_lemma_nameentity3','rel_constraint_lemma_nameentity3',3),
('rel_constraint_lemma_nameentity3','rel_constraint_lemma_nameentity3','rel_constraint_lemma_nameentity3','rel_constraint_lemma_nameentity3',4),
('rel_constraint_lemma', 'Constraint Lemma', 'Constraint Lemma', 'Constraint Lemma', 1),
('rel_constraint_lemma', 'Constraint Lemma', 'Constraint Lemma', 'Constraint Lemma', 2),
('rel_constraint_lemma', 'Constraint Lemma', 'Constraint Lemma', 'Constraint Lemma', 3),
('rel_constraint_lemma', 'Constraint Lemma', 'Constraint Lemma', 'Constraint Lemma', 4);


insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_lemma', 'rel_constraint_lemma_nameentity1', 'rel_constraint_lemma_nameentity2', 'rel_constraint_lemma_nameentity3', 6, 1);

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_lu_nameentity1','rel_constraint_lu_nameentity1','rel_constraint_lu_nameentity1','rel_constraint_lu_nameentity1',1),
('rel_constraint_lu_nameentity1','rel_constraint_lu_nameentity1','rel_constraint_lu_nameentity1','rel_constraint_lu_nameentity1',2),
('rel_constraint_lu_nameentity1','rel_constraint_lu_nameentity1','rel_constraint_lu_nameentity1','rel_constraint_lu_nameentity1',3),
('rel_constraint_lu_nameentity1','rel_constraint_lu_nameentity1','rel_constraint_lu_nameentity1','rel_constraint_lu_nameentity1',4),
('rel_constraint_lu_nameentity2','rel_constraint_lu_nameentity2','rel_constraint_lu_nameentity2','rel_constraint_lu_nameentity2',1),
('rel_constraint_lu_nameentity2','rel_constraint_lu_nameentity2','rel_constraint_lu_nameentity2','rel_constraint_lu_nameentity2',2),
('rel_constraint_lu_nameentity2','rel_constraint_lu_nameentity2','rel_constraint_lu_nameentity2','rel_constraint_lu_nameentity2',3),
('rel_constraint_lu_nameentity2','rel_constraint_lu_nameentity2','rel_constraint_lu_nameentity2','rel_constraint_lu_nameentity2',4),
('rel_constraint_lu_nameentity3','rel_constraint_lu_nameentity3','rel_constraint_lu_nameentity3','rel_constraint_lu_nameentity3',1),
('rel_constraint_lu_nameentity3','rel_constraint_lu_nameentity3','rel_constraint_lu_nameentity3','rel_constraint_lu_nameentity3',2),
('rel_constraint_lu_nameentity3','rel_constraint_lu_nameentity3','rel_constraint_lu_nameentity3','rel_constraint_lu_nameentity3',3),
('rel_constraint_lu_nameentity3','rel_constraint_lu_nameentity3','rel_constraint_lu_nameentity3','rel_constraint_lu_nameentity3',4),
('rel_constraint_lu', 'Constraint LU', 'Constraint LU', 'Constraint LU', 1),
('rel_constraint_lu', 'Constraint LU', 'Constraint LU', 'Constraint LU', 2),
('rel_constraint_lu', 'Constraint LU', 'Constraint LU', 'Constraint LU', 3),
('rel_constraint_lu', 'Constraint LU', 'Constraint LU', 'Constraint LU', 4);


insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_lu', 'rel_constraint_lu_nameentity1', 'rel_constraint_lu_nameentity2', 'rel_constraint_lu_nameentity3', 6, 1);

commit;


---
--- Adding rel_constraint_stlu - rel_constraint_udfeature - rel_constraint_udrelation
--- 26/07/2018
---

start transaction;

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_stlu_nameentity1','rel_constraint_stlu_nameentity1','rel_constraint_stlu_nameentity1','rel_constraint_stlu_nameentity1',1),
('rel_constraint_stlu_nameentity1','rel_constraint_stlu_nameentity1','rel_constraint_stlu_nameentity1','rel_constraint_stlu_nameentity1',2),
('rel_constraint_stlu_nameentity1','rel_constraint_stlu_nameentity1','rel_constraint_stlu_nameentity1','rel_constraint_stlu_nameentity1',3),
('rel_constraint_stlu_nameentity1','rel_constraint_stlu_nameentity1','rel_constraint_stlu_nameentity1','rel_constraint_stlu_nameentity1',4),
('rel_constraint_stlu_nameentity2','rel_constraint_stlu_nameentity2','rel_constraint_stlu_nameentity2','rel_constraint_stlu_nameentity2',1),
('rel_constraint_stlu_nameentity2','rel_constraint_stlu_nameentity2','rel_constraint_stlu_nameentity2','rel_constraint_stlu_nameentity2',2),
('rel_constraint_stlu_nameentity2','rel_constraint_stlu_nameentity2','rel_constraint_stlu_nameentity2','rel_constraint_stlu_nameentity2',3),
('rel_constraint_stlu_nameentity2','rel_constraint_stlu_nameentity2','rel_constraint_stlu_nameentity2','rel_constraint_stlu_nameentity2',4),
('rel_constraint_stlu_nameentity3','rel_constraint_stlu_nameentity3','rel_constraint_stlu_nameentity3','rel_constraint_stlu_nameentity3',1),
('rel_constraint_stlu_nameentity3','rel_constraint_stlu_nameentity3','rel_constraint_stlu_nameentity3','rel_constraint_stlu_nameentity3',2),
('rel_constraint_stlu_nameentity3','rel_constraint_stlu_nameentity3','rel_constraint_stlu_nameentity3','rel_constraint_stlu_nameentity3',3),
('rel_constraint_stlu_nameentity3','rel_constraint_stlu_nameentity3','rel_constraint_stlu_nameentity3','rel_constraint_stlu_nameentity3',4),
('rel_constraint_stlu', 'Constraint ST-LU', 'Constraint ST-LU', 'Constraint ST-LU', 1),
('rel_constraint_stlu', 'Constraint ST-LU', 'Constraint ST-LU', 'Constraint ST-LU', 2),
('rel_constraint_stlu', 'Constraint ST-LU', 'Constraint ST-LU', 'Constraint ST-LU', 3),
('rel_constraint_stlu', 'Constraint ST-LU', 'Constraint ST-LU', 'Constraint ST-LU', 4);


insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_stlu', 'rel_constraint_stlu_nameentity1', 'rel_constraint_stlu_nameentity2', 'rel_constraint_stlu_nameentity3', 6, 1);

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_udfeature_nameentity1','rel_constraint_udfeature_nameentity1','rel_constraint_udfeature_nameentity1','rel_constraint_udfeature_nameentity1',1),
('rel_constraint_udfeature_nameentity1','rel_constraint_udfeature_nameentity1','rel_constraint_udfeature_nameentity1','rel_constraint_udfeature_nameentity1',2),
('rel_constraint_udfeature_nameentity1','rel_constraint_udfeature_nameentity1','rel_constraint_udfeature_nameentity1','rel_constraint_udfeature_nameentity1',3),
('rel_constraint_udfeature_nameentity1','rel_constraint_udfeature_nameentity1','rel_constraint_udfeature_nameentity1','rel_constraint_udfeature_nameentity1',4),
('rel_constraint_udfeature_nameentity2','rel_constraint_udfeature_nameentity2','rel_constraint_udfeature_nameentity2','rel_constraint_udfeature_nameentity2',1),
('rel_constraint_udfeature_nameentity2','rel_constraint_udfeature_nameentity2','rel_constraint_udfeature_nameentity2','rel_constraint_udfeature_nameentity2',2),
('rel_constraint_udfeature_nameentity2','rel_constraint_udfeature_nameentity2','rel_constraint_udfeature_nameentity2','rel_constraint_udfeature_nameentity2',3),
('rel_constraint_udfeature_nameentity2','rel_constraint_udfeature_nameentity2','rel_constraint_udfeature_nameentity2','rel_constraint_udfeature_nameentity2',4),
('rel_constraint_udfeature_nameentity3','rel_constraint_udfeature_nameentity3','rel_constraint_udfeature_nameentity3','rel_constraint_udfeature_nameentity3',1),
('rel_constraint_udfeature_nameentity3','rel_constraint_udfeature_nameentity3','rel_constraint_udfeature_nameentity3','rel_constraint_udfeature_nameentity3',2),
('rel_constraint_udfeature_nameentity3','rel_constraint_udfeature_nameentity3','rel_constraint_udfeature_nameentity3','rel_constraint_udfeature_nameentity3',3),
('rel_constraint_udfeature_nameentity3','rel_constraint_udfeature_nameentity3','rel_constraint_udfeature_nameentity3','rel_constraint_udfeature_nameentity3',4),
('rel_constraint_udfeature', 'Constraint UD-Feature', 'Constraint UD-Feature', 'Constraint UD-Feature', 1),
('rel_constraint_udfeature', 'Constraint UD-Feature', 'Constraint UD-Feature', 'Constraint UD-Feature', 2),
('rel_constraint_udfeature', 'Constraint UD-Feature', 'Constraint UD-Feature', 'Constraint UD-Feature', 3),
('rel_constraint_udfeature', 'Constraint UD-Feature', 'Constraint UD-Feature', 'Constraint UD-Feature', 4);


insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_udfeature', 'rel_constraint_udfeature_nameentity1', 'rel_constraint_udfeature_nameentity2', 'rel_constraint_udfeature_nameentity3', 6, 1);

commit;

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_udrelation_nameentity1','rel_constraint_udrelation_nameentity1','rel_constraint_udrelation_nameentity1','rel_constraint_udrelation_nameentity1',1),
('rel_constraint_udrelation_nameentity1','rel_constraint_udrelation_nameentity1','rel_constraint_udrelation_nameentity1','rel_constraint_udrelation_nameentity1',2),
('rel_constraint_udrelation_nameentity1','rel_constraint_udrelation_nameentity1','rel_constraint_udrelation_nameentity1','rel_constraint_udrelation_nameentity1',3),
('rel_constraint_udrelation_nameentity1','rel_constraint_udrelation_nameentity1','rel_constraint_udrelation_nameentity1','rel_constraint_udrelation_nameentity1',4),
('rel_constraint_udrelation_nameentity2','rel_constraint_udrelation_nameentity2','rel_constraint_udrelation_nameentity2','rel_constraint_udrelation_nameentity2',1),
('rel_constraint_udrelation_nameentity2','rel_constraint_udrelation_nameentity2','rel_constraint_udrelation_nameentity2','rel_constraint_udrelation_nameentity2',2),
('rel_constraint_udrelation_nameentity2','rel_constraint_udrelation_nameentity2','rel_constraint_udrelation_nameentity2','rel_constraint_udrelation_nameentity2',3),
('rel_constraint_udrelation_nameentity2','rel_constraint_udrelation_nameentity2','rel_constraint_udrelation_nameentity2','rel_constraint_udrelation_nameentity2',4),
('rel_constraint_udrelation_nameentity3','rel_constraint_udrelation_nameentity3','rel_constraint_udrelation_nameentity3','rel_constraint_udrelation_nameentity3',1),
('rel_constraint_udrelation_nameentity3','rel_constraint_udrelation_nameentity3','rel_constraint_udrelation_nameentity3','rel_constraint_udrelation_nameentity3',2),
('rel_constraint_udrelation_nameentity3','rel_constraint_udrelation_nameentity3','rel_constraint_udrelation_nameentity3','rel_constraint_udrelation_nameentity3',3),
('rel_constraint_udrelation_nameentity3','rel_constraint_udrelation_nameentity3','rel_constraint_udrelation_nameentity3','rel_constraint_udrelation_nameentity3',4),
('rel_constraint_udrelation', 'Constraint UD-Relation', 'Constraint UD-Relation', 'Constraint UD-Relation', 1),
('rel_constraint_udrelation', 'Constraint UD-Relation', 'Constraint UD-Relation', 'Constraint UD-Relation', 2),
('rel_constraint_udrelation', 'Constraint UD-Relation', 'Constraint UD-Relation', 'Constraint UD-Relation', 3),
('rel_constraint_udrelation', 'Constraint UD-Relation', 'Constraint UD-Relation', 'Constraint UD-Relation', 4);


insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_udrelation', 'rel_constraint_udrelation_nameentity1', 'rel_constraint_udrelation_nameentity2', 'rel_constraint_udrelation_nameentity3', 6, 1);

-- rel_constraint_follows	

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_follows_nameentity1','rel_constraint_follows_nameentity1','rel_constraint_follows_nameentity1','rel_constraint_follows_nameentity1',1),
('rel_constraint_follows_nameentity2','rel_constraint_follows_nameentity2','rel_constraint_follows_nameentity2','rel_constraint_follows_nameentity2',1),
('rel_constraint_follows_nameentity3','rel_constraint_follows_nameentity3','rel_constraint_follows_nameentity3','rel_constraint_follows_nameentity3',1),
('rel_constraint_follows', 'Constraint Follows', 'Constraint Follows', 'Constraint Follows', 1);

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 2 from entry where entry like 'rel_constraint_follows%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 3 from entry where entry like 'rel_constraint_follows%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 4 from entry where entry like 'rel_constraint_follows%' and idlanguage = 1;

insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_follows', 'rel_constraint_follows_nameentity1', 'rel_constraint_follows_nameentity2', 'rel_constraint_follows_nameentity3', 6, 1);

-- rel_constraint_same	

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_same_nameentity1','rel_constraint_same_nameentity1','rel_constraint_same_nameentity1','rel_constraint_same_nameentity1',1),
('rel_constraint_same_nameentity2','rel_constraint_same_nameentity2','rel_constraint_same_nameentity2','rel_constraint_same_nameentity2',1),
('rel_constraint_same_nameentity3','rel_constraint_same_nameentity3','rel_constraint_same_nameentity3','rel_constraint_same_nameentity3',1),
('rel_constraint_same', 'Constraint same', 'Constraint same', 'Constraint same', 1);

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 2 from entry where entry like 'rel_constraint_same%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 3 from entry where entry like 'rel_constraint_same%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 4 from entry where entry like 'rel_constraint_same%' and idlanguage = 1;

insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_same', 'rel_constraint_same_nameentity1', 'rel_constraint_same_nameentity2', 'rel_constraint_same_nameentity3', 6, 1);


-- rel_constraint_different

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_different_nameentity1','rel_constraint_different_nameentity1','rel_constraint_different_nameentity1','rel_constraint_different_nameentity1',1),
('rel_constraint_different_nameentity2','rel_constraint_different_nameentity2','rel_constraint_different_nameentity2','rel_constraint_different_nameentity2',1),
('rel_constraint_different_nameentity3','rel_constraint_different_nameentity3','rel_constraint_different_nameentity3','rel_constraint_different_nameentity3',1),
('rel_constraint_different', 'Constraint different', 'Constraint different', 'Constraint different', 1);

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 2 from entry where entry like 'rel_constraint_different%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 3 from entry where entry like 'rel_constraint_different%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 4 from entry where entry like 'rel_constraint_different%' and idlanguage = 1;

insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_different', 'rel_constraint_different_nameentity1', 'rel_constraint_different_nameentity2', 'rel_constraint_different_nameentity3', 6, 1);


-- rel_constraint_dominance

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_dominance_nameentity1','rel_constraint_dominance_nameentity1','rel_constraint_dominance_nameentity1','rel_constraint_dominance_nameentity1',1),
('rel_constraint_dominance_nameentity2','rel_constraint_dominance_nameentity2','rel_constraint_dominance_nameentity2','rel_constraint_dominance_nameentity2',1),
('rel_constraint_dominance_nameentity3','rel_constraint_dominance_nameentity3','rel_constraint_dominance_nameentity3','rel_constraint_dominance_nameentity3',1),
('rel_constraint_dominance', 'Constraint dominance', 'Constraint dominance', 'Constraint dominance', 1);

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 2 from entry where entry like 'rel_constraint_dominance%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 3 from entry where entry like 'rel_constraint_dominance%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 4 from entry where entry like 'rel_constraint_dominance%' and idlanguage = 1;

insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_dominance', 'rel_constraint_dominance_nameentity1', 'rel_constraint_dominance_nameentity2', 'rel_constraint_dominance_nameentity3', 6, 1);


-- rel_constraint_hasword	

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_hasword_nameentity1','rel_constraint_hasword_nameentity1','rel_constraint_hasword_nameentity1','rel_constraint_hasword_nameentity1',1),
('rel_constraint_hasword_nameentity2','rel_constraint_hasword_nameentity2','rel_constraint_hasword_nameentity2','rel_constraint_hasword_nameentity2',1),
('rel_constraint_hasword_nameentity3','rel_constraint_hasword_nameentity3','rel_constraint_hasword_nameentity3','rel_constraint_hasword_nameentity3',1),
('rel_constraint_hasword', 'Constraint hasword', 'Constraint hasword', 'Constraint hasword', 1);

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 2 from entry where entry like 'rel_constraint_hasword%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 3 from entry where entry like 'rel_constraint_hasword%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 4 from entry where entry like 'rel_constraint_hasword%' and idlanguage = 1;

insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_hasword', 'rel_constraint_hasword_nameentity1', 'rel_constraint_hasword_nameentity2', 'rel_constraint_hasword_nameentity3', 6, 1);


-- rel_constraint_and	

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_and_nameentity1','rel_constraint_and_nameentity1','rel_constraint_and_nameentity1','rel_constraint_and_nameentity1',1),
('rel_constraint_and_nameentity2','rel_constraint_and_nameentity2','rel_constraint_and_nameentity2','rel_constraint_and_nameentity2',1),
('rel_constraint_and_nameentity3','rel_constraint_and_nameentity3','rel_constraint_and_nameentity3','rel_constraint_and_nameentity3',1),
('rel_constraint_and', 'Constraint and', 'Constraint and', 'Constraint and', 1);

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 2 from entry where entry like 'rel_constraint_and%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 3 from entry where entry like 'rel_constraint_and%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 4 from entry where entry like 'rel_constraint_and%' and idlanguage = 1;

insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_and', 'rel_constraint_and_nameentity1', 'rel_constraint_and_nameentity2', 'rel_constraint_and_nameentity3', 6, 1);



-- rel_constraint_xor	

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_xor_nameentity1','rel_constraint_xor_nameentity1','rel_constraint_xor_nameentity1','rel_constraint_xor_nameentity1',1),
('rel_constraint_xor_nameentity2','rel_constraint_xor_nameentity2','rel_constraint_xor_nameentity2','rel_constraint_xor_nameentity2',1),
('rel_constraint_xor_nameentity3','rel_constraint_xor_nameentity3','rel_constraint_xor_nameentity3','rel_constraint_xor_nameentity3',1),
('rel_constraint_xor', 'Constraint xor', 'Constraint xor', 'Constraint xor', 1);

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 2 from entry where entry like 'rel_constraint_xor%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 3 from entry where entry like 'rel_constraint_xor%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 4 from entry where entry like 'rel_constraint_xor%' and idlanguage = 1;

insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_xor', 'rel_constraint_xor_nameentity1', 'rel_constraint_xor_nameentity2', 'rel_constraint_xor_nameentity3', 6, 1);

-- rel_constraint_evokes

insert into Entry (entry, name, description, nick, idLanguage) values
('rel_constraint_evokes_nameentity1','rel_constraint_evokes_nameentity1','rel_constraint_evokes_nameentity1','rel_constraint_evokes_nameentity1',1),
('rel_constraint_evokes_nameentity2','rel_constraint_evokes_nameentity2','rel_constraint_evokes_nameentity2','rel_constraint_evokes_nameentity2',1),
('rel_constraint_evokes_nameentity3','rel_constraint_evokes_nameentity3','rel_constraint_evokes_nameentity3','rel_constraint_evokes_nameentity3',1),
('rel_constraint_evokes', 'Constraint evokes', 'Constraint evokes', 'Constraint evokes', 1);

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 2 from entry where entry like 'rel_constraint_evokes%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 3 from entry where entry like 'rel_constraint_evokes%' and idlanguage = 1;

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 4 from entry where entry like 'rel_constraint_evokes%' and idlanguage = 1;

insert into RelationType (entry, nameEntity1, nameEntity2, nameEntity3, idRelationGroup, idDomain) VALUES
('rel_constraint_evokes', 'rel_constraint_evokes_nameentity1', 'rel_constraint_evokes_nameentity2', 'rel_constraint_evokes_nameentity3', 6, 1);



---
--- Atualizando as tabelas RelationType e Entry das constraints para registrar os Types e Prefix
---

update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'CE' where entry = 'rel_constraint_and';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'CE' where entry = 'rel_constraint_before';
update relationtype set nameentity1='CN', nameentity2 = 'CN', nameentity3 = 'CN' where entry = 'rel_constraint_constraint';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'CX' where entry = 'rel_constraint_cxn';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'CE' where entry = 'rel_constraint_different';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'CE' where entry = 'rel_constraint_dominance';
update relationtype set nameentity1='CN', nameentity2 = 'CN', nameentity3 = 'CE' where entry = 'rel_constraint_element';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'FR' where entry = 'rel_constraint_evokes';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'CE' where entry = 'rel_constraint_follows';
update relationtype set nameentity1='CN', nameentity2 = 'FE', nameentity3 = 'FR' where entry = 'rel_constraint_frame';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'FE' where entry = 'rel_constraint_framefamily';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'CE' where entry = 'rel_constraint_hasword';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'LM' where entry = 'rel_constraint_lemma';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'LX' where entry = 'rel_constraint_lexeme';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'LU' where entry = 'rel_constraint_lu';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'CE' where entry = 'rel_constraint_meets';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'CE' where entry = 'rel_constraint_same';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'ST' where entry = 'rel_constraint_semtype';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'ST' where entry = 'rel_constraint_stlu';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'UF' where entry = 'rel_constraint_udfeature';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'UR' where entry = 'rel_constraint_udrelation';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'WF' where entry = 'rel_constraint_wordform';
update relationtype set nameentity1='CN', nameentity2 = 'CE', nameentity3 = 'CE' where entry = 'rel_constraint_xor';
update relationtype set nameentity1='LU', nameentity2 = 'LU', nameentity3 = 'LU' where entry = 'rel_qualia_constitutive';
update relationtype set nameentity1='LU', nameentity2 = 'LU', nameentity3 = 'LU' where entry = 'rel_qualia_agentive';
update relationtype set nameentity1='LU', nameentity2 = 'LU', nameentity3 = 'LU' where entry = 'rel_qualia_telic';
update relationtype set nameentity1='LU', nameentity2 = 'LU', nameentity3 = 'LU' where entry = 'rel_qualia_formal';
update relationtype set nameentity1='-', nameentity2 = 'DO', nameentity3 = 'DO' where entry = 'rel_hasdomain';
update relationtype set nameentity1='LU', nameentity2 = 'LU', nameentity3 = 'CE' where entry = 'rel_luequivalence';
update relationtype set nameentity1='FE', nameentity2 = 'FE', nameentity3 = 'CE' where entry = 'rel_festandsforfe';
update relationtype set nameentity1='FE', nameentity2 = 'LU', nameentity3 = 'CE' where entry = 'rel_festandsforlu';
update relationtype set nameentity1='LU', nameentity2 = 'LU', nameentity3 = 'CE' where entry = 'rel_lustandsforlu';



update entry set nick ='and' where entry = 'rel_constraint_and';
update entry set nick ='bef' where entry = 'rel_constraint_before';
update entry set nick ='cnn' where entry = 'rel_constraint_constraint';
update entry set nick ='cxn' where entry = 'rel_constraint_cxn';
update entry set nick ='dif' where entry = 'rel_constraint_different';
update entry set nick ='dom' where entry = 'rel_constraint_dominance';
update entry set nick ='ele' where entry = 'rel_constraint_element';
update entry set nick ='evk' where entry = 'rel_constraint_evokes';
update entry set nick ='flw' where entry = 'rel_constraint_follows';
update entry set nick ='frm' where entry = 'rel_constraint_frame';
update entry set nick ='fam' where entry = 'rel_constraint_framefamily';
update entry set nick ='wrd' where entry = 'rel_constraint_hasword';
update entry set nick ='lem' where entry = 'rel_constraint_lemma';
update entry set nick ='lex' where entry = 'rel_constraint_lexeme';
update entry set nick ='lu' where entry = 'rel_constraint_lu';
update entry set nick ='mee' where entry = 'rel_constraint_meets';
update entry set nick ='sam' where entry = 'rel_constraint_same';
update entry set nick ='sty' where entry = 'rel_constraint_semtype';
update entry set nick ='slu' where entry = 'rel_constraint_stlu';
update entry set nick ='udf' where entry = 'rel_constraint_udfeature';
update entry set nick ='udr' where entry = 'rel_constraint_udrelation';
update entry set nick ='wrf' where entry = 'rel_constraint_wordform';
update entry set nick ='xor' where entry = 'rel_constraint_xor';
update entry set nick ='cst' where entry =  'rel_qualia_constitutive';
update entry set nick ='age' where entry =  'rel_qualia_agentive';
update entry set nick ='tlc' where entry =  'rel_qualia_telic';
update entry set nick ='fml' where entry =  'rel_qualia_formal';
update entry set nick ='equ' where entry =  'rel_luequivalence';
update entry set nick ='ffe' where entry =  'rel_festandsforfe';
update entry set nick ='flu' where entry =  'rel_festandsforlu';
update entry set nick ='llu' where entry =  'rel_lustandsforlu';
