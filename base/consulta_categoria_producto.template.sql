-- Consulta por categorı́a de producto: obtener, dada una categorı́a de producto
-- (“Computación”, “Hogar, muebles y jardı́n”, etc), un listado de los vendedores
-- que han publicado artı́culos de dicha categorı́a y la cantidad de ventas que efectuó
-- cada uno de dichos vendedores.

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
    WHERE nombreCategoriaProducto = :categoria
)
GROUP BY u.idUsuario;
