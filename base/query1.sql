.bail ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

-- Para cierto usuario, ver informacion sobre articulos que compro y vendio.
SELECT publicacion.titulo
FROM publicacion
INNER JOIN publicacionFinalizada ON publicacionFinalizada.idPublicacion = publicacion.idPublicacion
INNER JOIN compra ON compra.idPublicacionFinalizada = publicacionFinalizada.idPublicacion
INNER JOIN particular ON particular.idUsuario = compra.idUsuario
WHERE particular.nombre = 'Miguel' AND particular.apellido = 'Maurizio'
UNION SELECT publicacion.titulo
FROM publicacion
INNER JOIN publicacionFinalizada ON publicacionFinalizada.idPublicacion = publicacion.idPublicacion
INNER JOIN particular ON particular.idUsuario = publicacion.idUsuario
WHERE particular.nombre = 'Miguel' AND particular.apellido = 'Maurizio';


