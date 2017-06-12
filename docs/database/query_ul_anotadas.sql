--
-- Relação de Frames, ULs e sentenças anotadas no MFN
--
select distinct lu.name,lu.frameEntry, an.idsentence
from view_lu lu
join view_subcorpuslu sc on (lu.idLU = sc.idLU)
join view_annotationset an on (sc.idSubCorpus = an.idSubcorpus)
join view_sentence s on (an.idSentence = s.idSentence)
join view_labelfecetarget lb on (an.idannotationset = lb.idannotationset)
where (lb.layerTypeEntry <> 'lty_target')
and (s.documentEntry = 'doc_ted_pt')
order by lu.name,lu.frameEntry, an.idsentence

