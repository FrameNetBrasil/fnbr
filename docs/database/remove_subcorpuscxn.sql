--
-- remove Subcorpus from database
--

start transaction;

delete from Label
where idLayer in
(
select idLayer from Layer
where idAnnotationSet in
(
select idAnnotationSet from AnnotationSet
where idSubcorpus >= 1450
)
);

delete from Layer
where idAnnotationSet in
(
select idAnnotationSet from AnnotationSet
where idSubcorpus >= 1450
);

delete from AnnotationSet
where idSubcorpus >= 1450
;

delete from SubCorpus
where idSubcorpus >= 1450
;

DROP TABLE IF EXISTS entityfordelete;

create temporary table entityfordelete
select idEntity from Entity
where idEntity in
(select e.idEntity from Entity e left join SubCorpus sc on (e.idEntity = sc.idEntity)
where (e.type = 'SC') and (sc.idEntity is null));

delete from EntityRelation
where idEntity2 in
(
select idEntity from entityfordelete
);

delete from Entity 
where idEntity in (
select idEntity from entityfordelete
)
;

drop table entityfordelete;



commit;
