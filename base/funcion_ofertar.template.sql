-- Función “Ofertar”: debe permitir al usuario ofertar una suma en una subasta.
-- Dicha suma debe ser superior en al menos 1 peso, a la oferta actual, e inferior al
-- doble de la oferta actual.

INSERT INTO hizoOferta VALUES (:idUsuario, :idPublicacion, datetime('now'), :monto)
