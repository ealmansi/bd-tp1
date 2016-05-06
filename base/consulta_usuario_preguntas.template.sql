-- Consulta por usuario y preguntas: obtener para un usuario especı́fico, la lista de
-- preguntas que ha realizado, con las respectivas respuestas que haya recibido (sólo
-- la pregunta, si aún no recibió respuesta).

SELECT p.pregunta, p.respuesta 
FROM pregunta p
WHERE p.idUsuario = :idUsuario;
