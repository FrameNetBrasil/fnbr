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

Numero de as associados as LUs pt no dominio Framenet

select count(*)
from view_lu lu join frame fr on (lu.idFrame=fr.idFrame)
where lu.idlanguage=1
and fr.idEntity in (
select distinct idEntityRel
from view_domain
where entry in ('dom_framenet')
and entityType='FR'
and idlanguage = 2
)

select lu.idlanguage, count(*)
from view_lu lu join frame fr on (lu.idFrame=fr.idFrame)
where fr.idEntity in (
select distinct idEntityRel
from view_domain
where entry in ('dom_sports', 'dom_tourism')
and entityType='FR'
and idlanguage = 2
)
group by lu.idlanguage

-- counts

select l.language, count(distinct idLU)
from view_lu lu
join frame fr on (lu.idFrame=fr.idFrame)
join language l on (lu.idlanguage = l.idlanguage)
where lu.idlanguage in (1,2,3)
and fr.idEntity in (
select distinct idEntityRel
from view_domain
where entry in ('dom_mknob')
and entityType='FR'
and idlanguage = 2
)
group by l.language;

select POS.POS, count(distinct idLU)
from view_lu lu
join frame fr on (lu.idFrame=fr.idFrame)
join POS on (lu.idPOS = POS.idPOS)
where lu.idlanguage in (1,2,3)
and fr.idEntity in (
select distinct idEntityRel
from view_domain
where entry in ('dom_mknob')
and entityType='FR'
and idlanguage = 2
)
group by POS.POS;


