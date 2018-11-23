start transaction;

update qualia set entry=concat('qla_',info);

insert into entry (entry, name, description, nick, idLanguage)
select distinct entry, entry, entry, entry, 1 from qualia;

insert into entry (entry, name, description, nick, idLanguage)
select distinct entry, entry, entry, entry, 2 from qualia;

insert into entry (entry, name, description, nick, idLanguage)
select distinct entry, entry, entry, entry, 3 from qualia;

insert into entry (entry, name, description, nick, idLanguage)
select distinct entry, entry, entry, entry, 4 from qualia;

commit;
