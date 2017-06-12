SELECT view_entrylanguage.name as frame, lu.name as lu, count(a.idAnnotationset) numAS
FROM ((((view_frame INNER JOIN EntityRelation er_ViewFrame_Domain ON (view_frame.idEntity = er_ViewFrame_Domain.idEntity1))
INNER JOIN RelationType rt_ViewFrame_Domain ON (er_ViewFrame_Domain.idRelationType = rt_ViewFrame_Domain.idRelationType))
INNER JOIN Domain ON (er_ViewFrame_Domain.idEntity2 = Domain.idEntity))
INNER JOIN view_entrylanguage ON (view_frame.entry=view_entrylanguage.entry))
join view_lu lu on (lu.idFrame=view_frame.idFrame)
join view_subcorpuslu s on (lu.idLU = s.idLu)
join annotationset a on (s.idSubCorpus = a.idSubcorpus)
WHERE ((view_entrylanguage.idLanguage = 3 )
AND (rt_ViewFrame_Domain.entry = 'rel_hasdomain' )
AND (Domain.idDomain = 5 ))
and (lu.idlanguage=3)
GROUP BY view_entrylanguage.name, lu.name