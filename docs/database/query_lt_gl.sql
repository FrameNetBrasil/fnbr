select lt.entry, gl.name, gl.definition, POS.POS
from layertype lt join entityrelation er on (lt.identity=er.identity1)
join genericlabel gl on (er.identity2 = gl.identity)
left join entityrelation e2 on (gl.identity = e2.identity1)
left join POS on (e2.identity2 = POS.identity)
where er.idrelationtype = 17
and ((e2.idrelationtype is null) or (e2.idrelationtype = 20))
and gl.idlanguage=1
order by lt.entry, gl.name, pos.pos