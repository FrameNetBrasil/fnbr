--
-- Implantação da relação Equivalence
-- 

--
-- Relation Group
--

delete from entry where entry like 'rgp_equivalence';

insert into entry(entry, name, description, nick, idLanguage)
SELECT 'rgp_equivalence', 'Relações de Equivalencia', 'Relações de Equivalencia', '', 1;

insert into entry(entry, name, description, nick, idLanguage)
SELECT 'rgp_equivalence', 'Equivalence Relations', 'Equivalence Relations', '', 2;

insert into entry(entry, name, description, nick, idLanguage)
SELECT 'rgp_equivalence', 'Equivalence Relations', 'Equivalence Relations', '', 2;

insert into entry(entry, name, description, nick, idLanguage)
SELECT 'rgp_equivalence', 'Equivalence Relations', 'Equivalence Relations', '', 2;

insert into RelationGroup (entry) values ('rgp_equivalence');

--
--  Relation Type
--

-- relation type "rel_luequivalence"

INSERT INTO Entry ( entry,name,description,nick,idLanguage ) VALUES ('rel_luequivalence','LU Equivalence','LU Equivalence Relation','LU Equivalence',1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,2 from Entry where (entry = 'rel_luequivalence') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,3 from Entry where (entry = 'rel_luequivalence') and (idLanguage = 1);
INSERT INTO Entry ( entry,name,description,nick,idLanguage ) select entry,name,description,nick,4 from Entry where (entry = 'rel_luequivalence') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_luequivalence_entity1','rel_luequivalence_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_luequivalence_entity1') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_luequivalence_entity1') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_luequivalence_entity1') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_luequivalence_entity2','rel_luequivalence_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_luequivalence_entity2') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_luequivalence_entity2') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_luequivalence_entity2') and (idLanguage = 1);

INSERT INTO Translation ( resource,text,idLanguage ) VALUES ('rel_luequivalence_entity3','rel_luequivalence_entity',1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,2 from Translation where (resource = 'rel_luequivalence_entity3') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,3 from Translation where (resource = 'rel_luequivalence_entity3') and (idLanguage = 1);
INSERT INTO Translation ( resource,text,idLanguage ) select resource,text,4 from Translation where (resource = 'rel_luequivalence_entity3') and (idLanguage = 1);

INSERT INTO RelationType ( entry,nameEntity1,nameEntity2,nameEntity3,idRelationGroup,idDomain ) 
    VALUES ('rel_luequivalence','rel_luequivalence_entity1','rel_luequivalence_entity2','rel_luequivalence_entity3',
    (select idRelationGroup from RelationGroup where entry='rgp_equivalence'),1);
