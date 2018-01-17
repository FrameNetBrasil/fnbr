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



