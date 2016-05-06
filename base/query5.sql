.bail ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

-- Busqueda por keyword

SELECT p.idPublicacion
FROM publicacion p
WHERE p.tipoVigencia = 0
AND titulo LIKE "%Silla%"
AND (
	exists (
		SELECT * 
		FROM item i
		INNER JOIN producto pr ON i.idItem = pr.idItem
		WHERE i.idPublicacion = p.idPublicacion
		AND pr.nombreCategoriaProducto = "Hogar"
	) OR exists
	(
		SELECT * 
		FROM item i
		INNER JOIN servicio s ON i.idItem = s.idItem
		WHERE i.idPublicacion = p.idPublicacion
		AND s.nombreTipoServicio = "Hogar"
	)
);
