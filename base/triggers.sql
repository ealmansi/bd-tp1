.bail ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

-- Trigger para validar ingreso de oferta
CREATE TRIGGER ofertaValida BEFORE INSERT ON hizoOferta 
 WHEN (NEW.monto < (SELECT monto FROM hizoOferta ORDER BY fecha DESC LIMIT 1) 
  OR NEW.monto > (SELECT monto FROM hizoOferta ORDER BY fecha DESC LIMIT 1) * 2)
BEGIN
 SELECT RAISE(ABORT, 'El monto de la oferta debe superar el monto actual y ser inferior al doble del mismo');
END;
