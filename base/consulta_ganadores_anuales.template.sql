-- Consulta por ganador/es anual de viaje a Khan El-Khalili: obtener, para un año
-- especı́fico, el ganador/es

SELECT usuario.*, SUM(publicacion.precio) * AVG(calificacion.valoracionComprador) AS puntaje
FROM usuario
INNER JOIN publicacion ON usuario.idUsuario = publicacion.idUsuario
INNER JOIN publicacionFinalizada ON publicacion.idPublicacion = publicacionFinalizada.idPublicacion
INNER JOIN compra ON publicacionFinalizada.idPublicacion = compra.idPublicacionFinalizada
INNER JOIN calificacion ON compra.idCalificacion = calificacion.idCalificacion
WHERE strftime('%Y', publicacion.fecha) = :año AND calificacion.valoracionComprador IS NOT NULL
GROUP BY usuario.idUsuario
ORDER BY puntaje DESC
LIMIT 1;
