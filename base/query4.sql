.bail ON
.echo ON
.headers ON
.mode column

PRAGMA foreign_keys = ON;

-- Preguntas/respuestas por usuario

select p.pregunta, p.respuesta 
from pregunta p
where p.idUsuario = 1;
