start transaction;

insert into entity (alias, type) values 
('udp_adj','UP'),
('udp_adp','UP'),
('udp_adv','UP'),
('udp_aux','UP'),
('udp_cconj','UP'),
('udp_det','UP'),
('udp_intj','UP'),
('udp_noun','UP'),
('udp_num','UP'),
('udp_part','UP'),
('udp_pron','UP'),
('udp_propn','UP'),
('udp_punct','UP'),
('udp_sconj','UP'),
('udp_sym','UP'),
('udp_verb','UP'),
('udp_x','UP');

insert into Entry (entry, name, description, nick, idLanguage) values
('udp_adj','ADJ','adjective','ADJ',1),
('udp_adp','ADP','adposition','ADP',1),
('udp_adv','ADV','adverb','ADV',1),
('udp_aux','AUX','auxiliary','AUX',1),
('udp_cconj', 'CCONJ','coordinating conjunction','CCONJ',1),
('udp_det','DET','determiner','DET',1),
('udp_intj','INTJ','interjection','INTJ',1),
('udp_noun','NOUN','noun','NOUN',1),
('udp_num','NUM','numeral','NUM',1),
('udp_part','PART','particle','PART',1),
('udp_pron','PRON','pronoun','PRON',1),
('udp_propn','PROPN','proper noun','PROPN',1),
('udp_punct','PUNCT','punctuation','PUNCT',1),
('udp_sconj','SCONJ','subordinating conjunction','SCONJ',1),
('udp_sym','SCONJ','symbol','SYM',1),
('udp_verb','VERB','verb','VERB',1),
('udp_x','X','other','X',1);

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 2
from entry
where (entry like 'udp_%') and (idLanguage = 1);

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 3
from entry
where (entry like 'udp_%') and (idLanguage = 1);

insert into Entry (entry, name, description, nick, idLanguage)
select entry, name, description, nick, 4
from entry
where (entry like 'udp_%') and (idLanguage = 1);


insert into UDPOS (POS, entry, idEntity) values
('ADJ',    'udp_adj', (select idEntity from entity where alias = 'udp_adj')),    
('ADP',    'udp_adp',(select idEntity from entity where alias = 'udp_adp'    )), 
('ADV',    'udp_adv',(select idEntity from entity where alias = 'udp_adv'     )),
('AUX',    'udp_aux',(select idEntity from entity where alias = 'udp_aux'     )),
('CCONJ',  'udp_cconj',(select idEntity from entity where alias ='udp_cconj'   )),
('DET',    'udp_det',(select idEntity from entity where alias =  'udp_det'     )),
('INTJ',   'udp_intj',(select idEntity from entity where alias = 'udp_intj'    )),
('NOUN',   'udp_noun',(select idEntity from entity where alias = 'udp_noun'    )),
('NUM',    'udp_num',(select idEntity from entity where alias = 'udp_num'     )),
('PART',   'udp_part',(select idEntity from entity where alias = 'udp_part'    )),
('PRON',   'udp_pron',(select idEntity from entity where alias = 'udp_pron'    )),
('PROPN',  'udp_propn',(select idEntity from entity where alias = 'udp_propn'   )),
('PUNCT',  'udp_punct',(select idEntity from entity where alias = 'udp_punct'   )),
('SCONJ',  'udp_sconj',(select idEntity from entity where alias = 'udp_sconj'   )),
('SYM',    'udp_sym',(select idEntity from entity where alias = 'udp_sym'     )),
('VERB',   'udp_verb',(select idEntity from entity where alias ='udp_verb'    )),
('X',      'udp_x',(select idEntity from entity where alias = 'udp_x'       ));

commit;

