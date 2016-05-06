-- Consulta por usuario: obtener, para un usuario especı́fico, información sobre los
-- artı́culos que ha comprado y vendido, los artı́culos que ha visitado con su fecha de
-- visita, los artı́culos que tiene en su lista de favoritos, y las primeras 3 categorı́as
-- de artı́culos que visitó con mayor frecuencia en el último año.

SELECT publicacion.*
FROM publicacion
INNER JOIN publicacionFinalizada ON publicacionFinalizada.idPublicacion = publicacion.idPublicacion
INNER JOIN compra ON compra.idPublicacionFinalizada = publicacionFinalizada.idPublicacion
WHERE compra.idUsuario = :idUsuario
UNION 
SELECT publicacion.*
FROM publicacion
INNER JOIN publicacionFinalizada ON publicacionFinalizada.idPublicacion = publicacion.idPublicacion
WHERE publicacion.idUsuario = :idUsuario;
