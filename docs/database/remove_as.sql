--
-- remove AnnotationSet from database
--

start transaction;

delete from Label
where idLayer in
(
select idLayer from Layer
where idAnnotationSet in
(
select idAnnotationSet from AnnotationSet
where idAnnotationSet = 57158
)
);

delete from Layer
where idAnnotationSet in
(
select idAnnotationSet from AnnotationSet
where idAnnotationSet = 57158
);

delete from AnnotationSet
where idAnnotationSet = 57158
;

commit;
