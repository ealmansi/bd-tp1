.bail ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

-- Trigger para validar ingreso de oferta
CREATE TRIGGER ofertaValida ON ofertaUsuarioSubasta BEFORE INSERT AS
 IF NEW.precio < (SELECT precio FROM ofertaUsuarioSubasta ORDER BY fechaOferta DESC LIMIT 1) 
  OR NEW.precio > (SELECT precio FROM ofertaUsuarioSubasta ORDER BY fechaOferta DESC LIMIT 1) * 2
 BEGIN
 RAISE (ABORT, 'El precio de la oferta debe superar el precio actual y ser inferior al doble del mismo');
 RETURN 
END;
