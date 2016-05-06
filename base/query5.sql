.bail ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

-- Busqueda por keyword

select p.idPublicacion
from publicacion p
where p.tipoVigencia = 0
and titulo like "%Silla%"
and (
	exists (
		select * 
		from item i
		inner join producto pr on i.idItem = pr.idItem
		where pr.nombreCategoria = "Hogar"
		and i.idPublicacion = p.idPublicacion
	) or exists
	(
		select * 
		from item i
		inner join servicio s on i.idPublicacion = p.idPublicacion
		where i.idItem = s.idItem
		and s.nombreServicio = "Hogar"
	)
);
