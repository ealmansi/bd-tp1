-- Consulta por keyword: obtener, para un cierto keyword (por ejemplo “mesa”), la
-- lista de publicaciones vigentes que tengan en el tı́tulo, dicha keyword. El usuario
-- debe poder restringir su búsqueda sólo a cierta categorı́a de artı́culos o servicios.

SELECT p.idPublicacion
FROM publicacion p
WHERE p.tipoVigencia = 0
AND titulo LIKE :patron
AND (
    EXISTS (
        SELECT * 
        FROM item i
        INNER JOIN producto pr ON i.idItem = pr.idItem
        WHERE i.idPublicacion = p.idPublicacion
        AND pr.nombreCategoriaProducto = :categoria
    ) OR EXISTS
    (
        SELECT * 
        FROM item i
        INNER JOIN servicio s ON i.idItem = s.idItem
        WHERE i.idPublicacion = p.idPublicacion
        AND s.nombreTipoServicio = :categoria
    )
);
