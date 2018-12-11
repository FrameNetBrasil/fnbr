==
== Adding prefixes to relationType (for show like Constraints)
==

start transaction;

update relationType set prefix='cst', nameEntity1='LU', nameEntity2='LU' where entry = 'rel_qualia_constitutive';
update relationType set prefix='agt', nameEntity1='LU', nameEntity2='LU' where entry = 'rel_qualia_agentive';
update relationType set prefix='tlc', nameEntity1='LU', nameEntity2='LU' where entry = 'rel_qualia_telic';
update relationType set prefix='fml', nameEntity1='LU', nameEntity2='LU' where entry = 'rel_qualia_formal';
update relationType set prefix='evk', nameEntity1='CX', nameEntity2='FR' where entry = 'rel_evokes';
update relationType set prefix='dom', nameEntity1='FR', nameEntity2='DO' where entry = 'rel_hasdomain';
update relationType set prefix='equ', nameEntity1='LU', nameEntity2='LU' where entry = 'rel_luequivalence';
update relationType set prefix='mfe', nameEntity1='LU', nameEntity2='FE' where entry = 'rel_festandsforfe';
update relationType set prefix='mlu', nameEntity1='FE', nameEntity2='LU' where entry = 'rel_festandsforlu';
update relationType set prefix='mlu', nameEntity1='LU', nameEntity2='LU' where entry = 'rel_lustandsforlu';
update relationType set prefix='sty', nameEntity1='**', nameEntity2='ST' where entry = 'rel_hassemtype';

commit;
