.bail ON
.echo ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

-- Dada una categoria de producto, los vendedores del mismo 
-- con la cantidad de ventas que efectuo (todos los productos)

select u.idUsuario, count(*)
from usuario u, publicacion pu1, compra co1
where u.idUsuario = pu1.idUsuario 
and co1.idPublicacionFinalizada = pu1.idPublicacion
and u.idUsuario in (
	select distinct pu2.idUsuario
	from producto pr, item i, publicacion pu2, compra co2
	where nombreCategoria = "Computacion"
	and pr.idItem = i.idItem
	and i.idPublicacion = pu2.idPublicacion
	and co2.idPublicacionFinalizada = pu2.idPublicacion
)
group by u.idUsuario;
--*/
