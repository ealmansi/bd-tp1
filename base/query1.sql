.bail ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

-- Para cierto usuario, ver informacion sobre articulos que compro y vendio.
CREATE PROCEDURE consultaPorUsuario @idUsuario int
AS

SELECT publicacion.*
FROM publicacion
INNER JOIN publicacionFinalizada ON publicacionFinalizada.idPublicacion = publicacion.idPublicacion
INNER JOIN compra ON compra.idPublicacionFinalizada = publicacionFinalizada.idPublicacion
WHERE compra.idUsuario = @idUsuario
UNION 
SELECT publicacion.*
FROM publicacion
INNER JOIN publicacionFinalizada ON publicacionFinalizada.idPublicacion = publicacion.idPublicacion
WHERE publicacion.idUsuarioPublicador = @idUsuario;

GO
