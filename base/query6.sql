.bail ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

--

SELECT IFNULL(razonSocial, nombre || apellido) ganador,
        AVG(valoracionVendedor) * SUM(precio) puntaje,
        AVG(valoracionVendedor) calificacion_promedio,
        SUM(precio) suma_montos_abonados
FROM calificacion
INNER JOIN compra ON compra.idCalificacion = calificacion.idCalificacion
INNER JOIN publicacion ON publicacion.idPublicacion = compra.idPublicacionFinalizada
INNER JOIN usuario ON usuario.idUsuario = publicacion.idUsuario
LEFT JOIN particular ON particular.idUsuario = usuario.idUsuario
LEFT JOIN empresa ON empresa.idUsuario = usuario.idUsuario
GROUP BY usuario.idUsuario
ORDER BY AVG(valoracionVendedor) * SUM(precio) DESC
LIMIT 1;
