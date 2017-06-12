-- sem entry: frames

select f.entry, count(e.entry)
from frame f join entry e on (f.entry = e.entry)
group by f.entry
having count(e.entry) < 3;

insert into entry  (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 1
from entry
where entry in (
select f.entry
from frame f join entry e on (f.entry = e.entry)
group by f.entry
having count(e.entry) = 1
)
and idlanguage=2;

insert into entry  (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 3
from entry
where entry in (
select f.entry
from frame f join entry e on (f.entry = e.entry)
group by f.entry
having count(e.entry) = 2
)
and idlanguage=1;


-- sem entry: frameelements

select f.entry, count(e.entry)
from frameelement f join entry e on (f.entry = e.entry)
group by f.entry
having count(e.entry) < 3;

insert into entry  (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 1
from entry
where entry in (
select f.entry
from frameelement f join entry e on (f.entry = e.entry)
group by f.entry
having count(e.entry) = 1
)
and idlanguage=2;

insert into entry  (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 3
from entry
where entry in (
select f.entry
from frameelement f join entry e on (f.entry = e.entry)
group by f.entry
having count(e.entry) = 2
)
and idlanguage=1;




-- FE duplicados

select r.idEntity1
from view_relation r
where r.relationType = 'rel_elementof'
and r.entity1Type = 'FE'
group by r.idEntity1

select u.id
from (
select max(r.idEntityRelation) id
from view_relation r
where r.relationType = 'rel_hastype'
and r.entity1Type = 'FE'
group by r.idEntity1
having count(*) > 1
) u


delete from entityrelation where identityrelation in (
40604,
40605,
40606,
40607,
40608,
40609,
40610,
40611,
40612,
40613,
40614,
40615,
40616,
40617,
40618,
40619,
40620,
40621,
40971,
40972,
40973,
40974,
40975,
40976,
40977,
40978,
40979,
40980,
40981,
40982,
40983,
40984,
40985,
40986,
40987,
40988,
40989,
40990,
40991,
40992,
40993,
40994,
40995,
40996,
41516,
41517,
41518,
41519,
41520,
41521
);


-- deleção de ULS

-- Frame Turismo
. conhecer.v
. turista.n
. visitar.v

-- Turismo por turista
. visitante.n
. tourist.n
. visitor.n
. visitante.n


-- Serviço turista vender
. operadora.n
. operator.n
. agencia.n
. operador.n

-- Alimentação
. almoço.n
café da manhã.
comida.n
jantar.n
refeição.n
almoço.n
cena.n
comida.n
desajuno.n
breakfest.n
dinner.n
lunch.n
meal.n

select idLu, name, idFrame, frameentry
from view_lu
where name in (
'conhecer.v',
'turista.n',
'visitar.v',
'visitante.n',
'tourist.n',
'visitor.n',
'visitante.n',
'operadora.n',
'operator.n',
'agencia.n',
'operador.n',
'almoço.n',
'café da manhã.n',
'comida.n',
'jantar.n',
'refeição.n',
'almoço.n',
'cena.n',
'comida.n',
'desajuno.n',
'breakfest.n',
'dinner.n',
'lunch.n',
'meal.n'
) and
frameentry in ('frm_touring', 'frm_touristic_service_sell','frm_dining','frm_touring_by_tourist');


select *
from view_subcorpuslu r
where r.idLU in
(
select idLU
from view_lu
where name in (
'conhecer.v',
'turista.n',
'visitar.v',
'visitante.n',
'tourist.n',
'visitor.n',
'visitante.n',
'operadora.n',
'operator.n',
'agencia.n',
'operador.n',
'almoço.n',
'café da manhã.n',
'comida.n',
'jantar.n',
'refeição.n',
'almoço.n',
'cena.n',
'comida.n',
'desajuno.n',
'breakfest.n',
'dinner.n',
'lunch.n',
'meal.n'
) and
frameentry in ('frm_touring', 'frm_touristic_service_sell','frm_dining','frm_touring_by_tourist')
)

select *
from annotationset where idSubCorpus in (
select idSubCorpus
from view_subcorpuslu r
where r.idLU in
(
select idLU
from view_lu
where name in (
'conhecer.v',
'turista.n',
'visitar.v',
'visitante.n',
'tourist.n',
'visitor.n',
'visitante.n',
'operadora.n',
'operator.n',
'agencia.n',
'operador.n',
'almoço.n',
'café da manhã.n',
'comida.n',
'jantar.n',
'refeição.n',
'almoço.n',
'cena.n',
'comida.n',
'desajuno.n',
'breakfest.n',
'dinner.n',
'lunch.n',
'meal.n'
) and
frameentry in ('frm_touring', 'frm_touristic_service_sell','frm_dining','frm_touring_by_tourist')
)
)


