
-- para deletar
select max(idwordform)
from wordform
group by form  collate utf8_bin, idlexeme
having count(*) > 1

insert into wordform (form, idlexeme)
select name, idlexeme
from lexeme
where idlexeme not in
(select distinct idlexeme from wordform)


select *
from lexeme
where (name,idpos) in (
select name, idpos
from lexeme
group by name, idpos
having count(*) > 1
)
order by name


select name, idpos
from lexeme
group by name, idpos
having count(*) > 1

select wordform.form  collate utf8_bin, lexeme.idpos
from wordform join lexeme on (wordform.idlexeme = lexeme.idlexeme)
group by wordform.form  collate utf8_bin, lexeme.idpos
having count(*) > 1

select idlexeme
from lexeme
where idlexeme not in
(select distinct idlexeme from wordform)
and idlexeme not in
(select distinct idlexeme from lexemeentry)

insert into wordform (form,idlexeme) values ('pra', 171);

-- para deletar
select max(wordform.idwordform)
from wordform join lexeme on (wordform.idlexeme = lexeme.idlexeme)
group by wordform.form  collate utf8_bin, lexeme.idpos
having count(*) > 1

-- para deletar
delete from lexeme
where idlexeme not in
(select distinct idlexeme from wordform)
and idlexeme not in
(select distinct idlexeme from lexemeentry)


select wordform.form  collate utf8_bin, lexeme.name, lexeme.idpos
from wordform join lexeme on (wordform.idlexeme = lexeme.idlexeme)

--
-- Lexemes sem wordform: criar a wordform
--

insert into wordform (form, idLexeme)
select l.name, l.idLexeme
from lexeme l left join wordform w on (l.idLexeme = w.idLexeme)
where w.idWordform is null;


insert into wordform (form, idlexeme) values ('restaurante', 64529);
insert into wordform (form, idlexeme) values ('restaurantes', 64529);


---
--- 27/09/2016
---

Tratando os nomes que estão com erro

select wf.form collate utf8_bin, lx.idlanguage, lx.idPOS, count(distinct lx.idlexeme)
from wordform wf join lexeme lx on (wf.idlexeme = lx.idlexeme)
where lx.idlanguage=1 and idpos=83
group by wf.form collate utf8_bin, lx.idlanguage, lx.idPOS
having count(distinct lx.idlexeme)> 1


select w.idwordform, w.form  collate utf8_bin, w.idlexeme, x.name collate utf8_bin, l.idlemma, l.name collate utf8_bin
from wordform w join lexeme x on (w.idlexeme = x.idlexeme)
left join lexemeentry le on (x.idlexeme = le.idlexeme)
left join lemma l on (le.idlemma = l.idlemma)
where w.form  collate utf8_bin in (
select wf.form collate utf8_bin
from wordform wf join lexeme lx on (wf.idlexeme = lx.idlexeme)
where lx.idlanguage=1 and idpos=83
group by wf.form collate utf8_bin, lx.idlanguage, lx.idPOS
having count(distinct lx.idlexeme)> 1
) and x.idpos=83
order by w.form  collate utf8_bin

update lexemeentry set idlexeme = 4886 where idlexeme = 113244;
delete from wordform where idlexeme = 113244;
delete from lexeme where idlexeme = 113244;
delete from wordform where idlexeme = 113180;
delete from lexeme where idlexeme = 113180;
delete from wordform where idlexeme = 113244;
delete from lexeme where idlexeme = 113244;

update lexemeentry set idlexeme = 49496 where idlexeme = 113113;
delete from wordform where idlexeme = 113113;
delete from lexeme where idlexeme = 113113;
delete from wordform where idlexeme = 113115;
delete from lexeme where idlexeme = 113115;

update lexemeentry set idlexeme = 7371 where idlexeme = 113176;
delete from wordform where idlexeme = 113176;
delete from lexeme where idlexeme = 113176;

update lexemeentry set idlexeme = 7765 where idlexeme = 113224;
delete from wordform where idlexeme = 113224;
delete from lexeme where idlexeme = 113224;

update lexemeentry set idlexeme = 10145 where idlexeme = 113178;
delete from wordform where idlexeme = 113178;
delete from lexeme where idlexeme = 113178;

update lexemeentry set idlexeme = 12240 where idlexeme = 64743;
delete from wordform where idlexeme = 64743;
delete from lexeme where idlexeme = 64743;

delete from wordform where idlexeme = 113870;
delete from lexeme where idlexeme = 113870;

update lexemeentry set idlexeme = 64749 where idlexeme = 113267;
delete from wordform where idlexeme = 113267;
delete from lexeme where idlexeme = 113267;

update lexemeentry set idlexeme = 64749 where idlexeme = 113263;
delete from wordform where idlexeme = 113263;
delete from lexeme where idlexeme = 113263;

delete from lexemeentry where idlemma = 1676;
delete from lemma where idlemma = 1676;
delete from wordform where idlexeme = 109431;
delete from lexeme where idlexeme = 109431;

update lexemeentry set idlexeme = 113874 where idlexeme = 113199;
delete from wordform where idlexeme = 113199;
delete from lexeme where idlexeme = 113199;

update lexemeentry set idlexeme = 113874 where idlexeme = 113201;
delete from wordform where idlexeme = 113201;
delete from lexeme where idlexeme = 113201;

update lexemeentry set idlexeme = 113874 where idlexeme = 113202;
delete from wordform where idlexeme = 113202;
delete from lexeme where idlexeme = 113202;

delete from lexemeentry where idlexeme in ( 113217,113199,113201,113246,113202,113247,113249,113251);
delete from wordform where idlexeme in ( 113217,113199,113201,113246,113202,113247,113249,113251);
delete from lexeme where idlexeme in ( 113217,113199,113201,113246,113202,113247,113249,113251);

update lexemeentry set idlexeme = 64745 where idlexeme = 113424;
delete from wordform where idlexeme = 113424;
delete from lexeme where idlexeme = 113424;

delete from wordform where idlexeme = 113675;
delete from lexeme where idlexeme = 113675;

update lexemeentry set idlexeme = 41267 where idlexeme = 113254;
delete from wordform where idlexeme = 113254;
delete from lexeme where idlexeme = 113254;

update lexemeentry set idlexeme = 51968 where idlexeme = 113304;
delete from wordform where idlexeme = 113304;
delete from lexeme where idlexeme = 113304;

update lexemeentry set idlexeme = 64961 where idlexeme = 64694;
delete from wordform where idlexeme = 64694;
delete from lexeme where idlexeme = 64694;

update lexemeentry set idlexeme = 56040 where idlexeme = 113636;
delete from wordform where idlexeme = 113636;
delete from lexeme where idlexeme = 113636;

update lexemeentry set idlexeme = 56040 where idlexeme = 113204;
delete from wordform where idlexeme = 113204;
delete from lexeme where idlexeme = 113204;

delete from wordform where idlexeme = 109322;
delete from lexeme where idlexeme = 109322;

update lexemeentry set idlexeme = 60593 where idlexeme = 113281;
delete from wordform where idlexeme = 113281;
delete from lexeme where idlexeme = 113281;

update lexemeentry set idlexeme = 3867 where idlexeme = 109951;
delete from wordform where idlexeme = 109951;
delete from lexeme where idlexeme = 109951;

update lexemeentry set idlexeme = 3867 where idlexeme = 112875;
delete from wordform where idlexeme = 112875;
delete from lexeme where idlexeme = 112875;
