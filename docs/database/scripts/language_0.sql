insert into language (idLanguage, language, description)
values (0, '--', 'Entry');

insert into entry (entry, name, description, nick, idlanguage) 
select  entry, entry name, description, nick, 0 idlanguage
from entry where idlanguage = 1;

