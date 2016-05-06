.bail ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

-- Dada una categoria de producto, los vendedores del mismo 
-- con la cantidad de ventas que efectuo (todos los productos)

select u.idUsuario, count(*)
from usuario u
inner join publicacion pu1 on u.idUsuario = pu1.idUsuario
inner join compra co1 on co1.idPublicacionFinalizada = pu1.idPublicacion
where u.idUsuario in (
	select distinct pu2.idUsuario
	from producto pr
	inner join item i on pr.idItem == i.idItem
	inner join publicacion pu2 on i.idPublicacion = pu2.idPublicacion
	inner join compra co2 on co2.idPublicacionFinalizada = pu2.idPublicacion
	where nombreCategoria = "Computacion"
)
group by u.idUsuario;
