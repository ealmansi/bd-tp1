.bail ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

-- Dada una categoria de producto, los vendedores del mismo 
-- con la cantidad de ventas que efectuo (todos los productos)

SELECT u.idUsuario, count(*)
FROM usuario u
INNER JOIN publicacion pu1 ON u.idUsuario = pu1.idUsuario
INNER JOIN compra co1 ON co1.idPublicacionFinalizada = pu1.idPublicacion
WHERE u.idUsuario IN (
	SELECT DISTINCT pu2.idUsuario
	FROM producto pr
	INNER JOIN item i ON pr.idItem == i.idItem
	INNER JOIN publicacion pu2 ON i.idPublicacion = pu2.idPublicacion
	INNER JOIN compra co2 ON co2.idPublicacionFinalizada = pu2.idPublicacion
	WHERE nombreCategoriaProducto = "Computacion"
)
GROUP BY u.idUsuario;
