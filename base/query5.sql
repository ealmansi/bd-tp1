.bail ON
.echo ON
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
		from item i, producto pr
		where i.idItem = pr.idItem
		and pr.nombreCategoria = "Hogar"
		and i.idPublicacion = p.idPublicacion
	) or exists
	(
		select * 
		from item i, servicio s
		where i.idItem = s.idItem
		and s.nombreServicio = "Hogar"
		and i.idPublicacion = p.idPublicacion
	)
);