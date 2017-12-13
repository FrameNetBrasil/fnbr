N�mero de frames com ULs

select count(distinct idFrame)
from view_lu lu
where lu.idlanguage = 1;

592

N�mero de ULs

select count(distinct idLU)
from view_lu lu
where lu.idlanguage = 1;

3975

N�mero de senten�as anotadas

select distinct sentence.idsentence, sentence.text
from label
join layer on (label.idlayer = layer.idlayer)
join annotationset on (layer.idannotationset = annotationset.idannotationset)
join sentence on (annotationset.idsentence = sentence.idsentence)
where sentence.idlanguage = 1

14067