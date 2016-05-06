.bail ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

-- Trigger para validar ingreso de oferta
CREATE TRIGGER ofertaValida ON hizoOferta BEFORE INSERT AS
 IF NEW.monto < (SELECT monto FROM hizoOferta ORDER BY fecha DESC LIMIT 1) 
  OR NEW.monto > (SELECT monto FROM hizoOferta ORDER BY fecha DESC LIMIT 1) * 2
 BEGIN
 RAISE (ABORT, 'El monto de la oferta debe superar el monto actual y ser inferior al doble del mismo');
 RETURN 
END;
