delete from entityrelation where identityrelation in (
16726,
16727,
16728,
16729,
16730,
16731,
16732,
16733,
16734,
42269,
16735,
16736,
16737,
16738,
16739,
16740,
16741,
17349,
17350,
17351,
17711,
17713,
17714,
17715,
17716,
17717,
17718,
17719,
17720,
17721,
17722,
17723,
17725,
17726,
17727,
17730,
17731,
17733,
17734,
20096,
20097,
20098,
20099,
20100,
20101,
20102,
20103,
20104,
20105,
20106,
20107
);

alter table entity add idFN INT;

insert into entity (alias, type, idFN)
select  concat(fe.entry,'_2'),'FE', er.idEntity1
from entityrelation er join frameelement fe on (er.idEntity1=fe.idEntity)
where er.identityrelation in (
16168,
16169,
16170,
16172,
16173,
16174,
16176,
16177,
16178,
16183,
16184,
16185,
16187,
16188,
16189,
16191,
16192,
16228,
16229,
16230,
16232,
16257,
16258,
16259,
16261,
16262,
16263,
16265,
16266,
16268,
16460,
16461,
16462,
16464,
16465,
16466,
16468,
16469,
16473,
16474,
16475,
16477,
16478,
16479,
16481,
16482,
16485,
16486,
16487,
16489,
16490,
16491,
16493,
16494,
22785,
22786,
22789,
22790,
22791,
22792,
22793,
22794,
24920,
25721
);

insert into frameelement (entry,active,identity,idcolor)
select e.alias entry,1,e.idEntity,fe.idColor
from entity e join frameelement fe on (e.idFN = fe.idEntity)
where e.idFN is not null;


select concat('update entityrelation set idEntity1 = ', e.idEntity,' where identityrelation = ', er.identityrelation, ';')
from entityrelation er join entity e on (er.identity1 = e.idFN)
where er.identityrelation in (
16168,
42653,
16169,
42654,
16170,
42655,
16172,
42656,
16173,
42657,
16174,
42658,
16176,
42659,
16177,
42660,
16178,
42661,
16183,
42675,
16184,
42676,
16185,
42677,
16187,
42678,
16188,
42679,
16189,
42680,
16191,
42681,
16192,
42682,
16228,
42701,
16229,
42702,
16230,
42703,
16232,
42704,
16257,
42709,
16258,
42710,
16259,
42711,
16261,
42712,
16262,
42713,
16263,
42714,
16265,
42715,
16266,
42716,
16268,
42717,
16460,
42726,
16461,
42727,
16462,
42728,
16464,
42729,
16465,
42730,
16466,
42731,
16468,
42732,
16469,
42733,
16473,
42739,
16474,
42740,
16475,
42741,
16477,
42742,
16478,
42743,
16479,
42744,
16481,
42745,
16482,
42746,
16485,
42754,
16486,
42755,
16487,
42756,
16489,
42757,
16490,
42758,
16491,
42759,
16493,
42760,
16494,
42761,
22785,
42767,
22786,
42768,
22789,
42769,
22790,
42770,
22791,
42771,
22792,
42772,
22793,
42773,
22794,
42774,
24920,
42892,
25721,
43213
)
and er.idapolo is null
order by er.identity1


update entityrelation set idEntity1 = 21190 where identityrelation = 16168;
update entityrelation set idEntity1 = 21191 where identityrelation = 16169;
update entityrelation set idEntity1 = 21192 where identityrelation = 16170;
update entityrelation set idEntity1 = 21193 where identityrelation = 16172;
update entityrelation set idEntity1 = 21194 where identityrelation = 16173;
update entityrelation set idEntity1 = 21195 where identityrelation = 16174;
update entityrelation set idEntity1 = 21196 where identityrelation = 16176;
update entityrelation set idEntity1 = 21197 where identityrelation = 16177;
update entityrelation set idEntity1 = 21198 where identityrelation = 16178;
update entityrelation set idEntity1 = 21199 where identityrelation = 16183;
update entityrelation set idEntity1 = 21200 where identityrelation = 16184;
update entityrelation set idEntity1 = 21201 where identityrelation = 16185;
update entityrelation set idEntity1 = 21202 where identityrelation = 16187;
update entityrelation set idEntity1 = 21203 where identityrelation = 16188;
update entityrelation set idEntity1 = 21204 where identityrelation = 16189;
update entityrelation set idEntity1 = 21205 where identityrelation = 16191;
update entityrelation set idEntity1 = 21206 where identityrelation = 16192;
update entityrelation set idEntity1 = 21207 where identityrelation = 16228;
update entityrelation set idEntity1 = 21208 where identityrelation = 16229;
update entityrelation set idEntity1 = 21209 where identityrelation = 16230;
update entityrelation set idEntity1 = 21210 where identityrelation = 16232;
update entityrelation set idEntity1 = 21211 where identityrelation = 16257;
update entityrelation set idEntity1 = 21212 where identityrelation = 16258;
update entityrelation set idEntity1 = 21213 where identityrelation = 16259;
update entityrelation set idEntity1 = 21214 where identityrelation = 16261;
update entityrelation set idEntity1 = 21215 where identityrelation = 16262;
update entityrelation set idEntity1 = 21216 where identityrelation = 16263;
update entityrelation set idEntity1 = 21217 where identityrelation = 16265;
update entityrelation set idEntity1 = 21218 where identityrelation = 16266;
update entityrelation set idEntity1 = 21219 where identityrelation = 16268;
update entityrelation set idEntity1 = 21220 where identityrelation = 16460;
update entityrelation set idEntity1 = 21221 where identityrelation = 16461;
update entityrelation set idEntity1 = 21222 where identityrelation = 16462;
update entityrelation set idEntity1 = 21223 where identityrelation = 16464;
update entityrelation set idEntity1 = 21224 where identityrelation = 16465;
update entityrelation set idEntity1 = 21225 where identityrelation = 16466;
update entityrelation set idEntity1 = 21226 where identityrelation = 16468;
update entityrelation set idEntity1 = 21227 where identityrelation = 16469;
update entityrelation set idEntity1 = 21228 where identityrelation = 16473;
update entityrelation set idEntity1 = 21229 where identityrelation = 16474;
update entityrelation set idEntity1 = 21230 where identityrelation = 16475;
update entityrelation set idEntity1 = 21231 where identityrelation = 16477;
update entityrelation set idEntity1 = 21232 where identityrelation = 16478;
update entityrelation set idEntity1 = 21233 where identityrelation = 16479;
update entityrelation set idEntity1 = 21234 where identityrelation = 16481;
update entityrelation set idEntity1 = 21235 where identityrelation = 16482;
update entityrelation set idEntity1 = 21236 where identityrelation = 16485;
update entityrelation set idEntity1 = 21237 where identityrelation = 16486;
update entityrelation set idEntity1 = 21238 where identityrelation = 16487;
update entityrelation set idEntity1 = 21239 where identityrelation = 16489;
update entityrelation set idEntity1 = 21240 where identityrelation = 16490;
update entityrelation set idEntity1 = 21241 where identityrelation = 16491;
update entityrelation set idEntity1 = 21242 where identityrelation = 16493;
update entityrelation set idEntity1 = 21243 where identityrelation = 16494;
update entityrelation set idEntity1 = 21244 where identityrelation = 22785;
update entityrelation set idEntity1 = 21245 where identityrelation = 22786;
update entityrelation set idEntity1 = 21246 where identityrelation = 22789;
update entityrelation set idEntity1 = 21247 where identityrelation = 22790;
update entityrelation set idEntity1 = 21248 where identityrelation = 22791;
update entityrelation set idEntity1 = 21249 where identityrelation = 22792;
update entityrelation set idEntity1 = 21250 where identityrelation = 22793;
update entityrelation set idEntity1 = 21251 where identityrelation = 22794;
update entityrelation set idEntity1 = 21252 where identityrelation = 24920;
update entityrelation set idEntity1 = 21253 where identityrelation = 25721;

insert into entry (entry, name, description, nick, idLanguage)
select concat(entry.entry, '_2'), entry.name, entry.description, entry.nick, entry.idLanguage
from entity e join frameelement fe on (e.idFN = fe.idEntity)
join entry on (fe.entry = entry.entry)
where e.idFN is not null;

select concat('update entityrelation set idEntity1 = ', e.idEntity,' where identityrelation = ', er.identityrelation, ';')
from entityrelation er join entity e on (er.identity1 = e.idFN)
where er.identityrelation in (
4832,
4833,
4834,
4836,
4837,
4838,
4840,
4841,
4842,
4847,
4848,
4849,
4851,
4852,
4853,
4855,
4856,
4892,
4893,
4894,
4896,
4921,
4922,
4923,
4925,
4926,
4927,
4929,
4930,
4932,
5124,
5125,
5126,
5128,
5129,
5130,
5132,
5133,
5137,
5138,
5139,
5141,
5142,
5143,
5145,
5146,
5149,
5150,
5151,
5153,
5154,
5155,
5157,
5158,
11449,
11450,
11453,
11454,
11455,
11456,
11457,
11458,
13584,
14385
)
order by er.identity1

update entityrelation set idEntity1 = 21190 where identityrelation = 4832;
update entityrelation set idEntity1 = 21191 where identityrelation = 4833;
update entityrelation set idEntity1 = 21192 where identityrelation = 4834;
update entityrelation set idEntity1 = 21193 where identityrelation = 4836;
update entityrelation set idEntity1 = 21194 where identityrelation = 4837;
update entityrelation set idEntity1 = 21195 where identityrelation = 4838;
update entityrelation set idEntity1 = 21196 where identityrelation = 4840;
update entityrelation set idEntity1 = 21197 where identityrelation = 4841;
update entityrelation set idEntity1 = 21198 where identityrelation = 4842;
update entityrelation set idEntity1 = 21199 where identityrelation = 4847;
update entityrelation set idEntity1 = 21200 where identityrelation = 4848;
update entityrelation set idEntity1 = 21201 where identityrelation = 4849;
update entityrelation set idEntity1 = 21202 where identityrelation = 4851;
update entityrelation set idEntity1 = 21203 where identityrelation = 4852;
update entityrelation set idEntity1 = 21204 where identityrelation = 4853;
update entityrelation set idEntity1 = 21205 where identityrelation = 4855;
update entityrelation set idEntity1 = 21206 where identityrelation = 4856;
update entityrelation set idEntity1 = 21207 where identityrelation = 4892;
update entityrelation set idEntity1 = 21208 where identityrelation = 4893;
update entityrelation set idEntity1 = 21209 where identityrelation = 4894;
update entityrelation set idEntity1 = 21210 where identityrelation = 4896;
update entityrelation set idEntity1 = 21211 where identityrelation = 4921;
update entityrelation set idEntity1 = 21212 where identityrelation = 4922;
update entityrelation set idEntity1 = 21213 where identityrelation = 4923;
update entityrelation set idEntity1 = 21214 where identityrelation = 4925;
update entityrelation set idEntity1 = 21215 where identityrelation = 4926;
update entityrelation set idEntity1 = 21216 where identityrelation = 4927;
update entityrelation set idEntity1 = 21217 where identityrelation = 4929;
update entityrelation set idEntity1 = 21218 where identityrelation = 4930;
update entityrelation set idEntity1 = 21219 where identityrelation = 4932;
update entityrelation set idEntity1 = 21220 where identityrelation = 5124;
update entityrelation set idEntity1 = 21221 where identityrelation = 5125;
update entityrelation set idEntity1 = 21222 where identityrelation = 5126;
update entityrelation set idEntity1 = 21223 where identityrelation = 5128;
update entityrelation set idEntity1 = 21224 where identityrelation = 5129;
update entityrelation set idEntity1 = 21225 where identityrelation = 5130;
update entityrelation set idEntity1 = 21226 where identityrelation = 5132;
update entityrelation set idEntity1 = 21227 where identityrelation = 5133;
update entityrelation set idEntity1 = 21228 where identityrelation = 5137;
update entityrelation set idEntity1 = 21229 where identityrelation = 5138;
update entityrelation set idEntity1 = 21230 where identityrelation = 5139;
update entityrelation set idEntity1 = 21231 where identityrelation = 5141;
update entityrelation set idEntity1 = 21232 where identityrelation = 5142;
update entityrelation set idEntity1 = 21233 where identityrelation = 5143;
update entityrelation set idEntity1 = 21234 where identityrelation = 5145;
update entityrelation set idEntity1 = 21235 where identityrelation = 5146;
update entityrelation set idEntity1 = 21236 where identityrelation = 5149;
update entityrelation set idEntity1 = 21237 where identityrelation = 5150;
update entityrelation set idEntity1 = 21238 where identityrelation = 5151;
update entityrelation set idEntity1 = 21239 where identityrelation = 5153;
update entityrelation set idEntity1 = 21240 where identityrelation = 5154;
update entityrelation set idEntity1 = 21241 where identityrelation = 5155;
update entityrelation set idEntity1 = 21242 where identityrelation = 5157;
update entityrelation set idEntity1 = 21243 where identityrelation = 5158;
update entityrelation set idEntity1 = 21244 where identityrelation = 11449;
update entityrelation set idEntity1 = 21245 where identityrelation = 11450;
update entityrelation set idEntity1 = 21246 where identityrelation = 11453;
update entityrelation set idEntity1 = 21247 where identityrelation = 11454;
update entityrelation set idEntity1 = 21248 where identityrelation = 11455;
update entityrelation set idEntity1 = 21249 where identityrelation = 11456;
update entityrelation set idEntity1 = 21250 where identityrelation = 11457;
update entityrelation set idEntity1 = 21251 where identityrelation = 11458;
update entityrelation set idEntity1 = 21252 where identityrelation = 13584;
update entityrelation set idEntity1 = 21253 where identityrelation = 14385;



select concat('update label set idLabelType = ', x.idEntity,' where idlabel = ', y.idLabel, ';')
-- select distinct y.idLabel, y.idEntity, y.idFrame, x.identity, x.idFN
from (
  select er.idEntity1, f.idFrame, e.idEntity, e.idFN
  from entityrelation er join frame f on (er.idEntity2 = f.idEntity)
  join entity e on (er.idEntity1 = e.idEntity)
  where er.idrelationtype = 15
) x,
(
select t.idlabel, fe.idEntity, t.idFrame from frameelement fe join (
select lb.idlabel, lb.idLabelType id, lu.name, lu.frameentry, lu.idFrame
from label lb join layer l on (lb.idLayer = l.idLayer)
join annotationset a on (l.idannotationset = a.idannotationset)
join view_subcorpuslu s on (a.idsubcorpus = s.idSubcorpus)
join view_lu as lu on (s.idLU = lu.idLU)
) t
on (fe.identity = t.id)
where t.frameentry in (
'frm_commerce_buy',
'frm_commerce_collect',
'frm_commerce_goods-transfer',
'frm_commerce_money-transfer',
'frm_commerce_pay',
'frm_commerce_sell',
'frm_commercial_transaction',
'frm_competition',
'frm_distributed_abundance',
'frm_exchange_currency',
'frm_finals_event',
'frm_hire_provide_touristic_services',
'frm_pay_collect_touristic_services',
'frm_playoffs_play',
'frm_taking_captive',
'frm_touring',
'frm_touring_by_tourist',
'frm_touristic_service_buy',
'frm_touristic_service_collect',
'frm_touristic_service_pay',
'frm_touristic_service_sell',
'frm_touristic_service_transaction',
'frm_travel',
'frm_weather'
)
) y
where (x.idFrame=y.idFrame) and (x.idFN = y.idEntity)

update label set idLabelType = 21195 where idlabel = 22032;
update label set idLabelType = 21244 where idlabel = 19705;
update label set idLabelType = 21245 where idlabel = 19706;



