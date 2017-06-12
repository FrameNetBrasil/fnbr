preciso que você por favor passe todas as ULs de marcar_gol para o frame de jogadas pontuadas, nas 3 línguas

select l.idEntity
from view_lu l
where l.frameentry = 'frm_score_goal'    idEntity = 17836

1359, 'frm_winning_moves', 1, 21437

select *
from view_entityrelation
where idEntity2 = 17836
and entityType='LU'

update entityrelation set idEntity2 = 21437
where identityrelation in (
44867,
44868,
44869,
44870,
44871,
44872,
44873,
44874,
44875,
44876,
44877,
44878,
44879,
44880,
44881,
44882,
44883,
44884,
44885,
44886
);

