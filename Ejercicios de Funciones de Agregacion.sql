-- ================================== Schema ====================================

CREATE TABLE estadisticas_mundial (
puesto_ranking INT,
equipo VARCHAR(50),
confederacion VARCHAR(20),
puntos_fifa INT,
goles_anotados INT,
partidos_jugados INT,
porterias_a_cero INT,
goles_recibidos INT,
paradas_portero INT
);

INSERT INTO estadisticas_mundial(puesto_ranking, equipo, confederacion, puntos_fifa, goles_anotados, partidos_jugados,
porterias_a_cero, goles_recibidos, paradas_portero)
VALUES
(1, 'España', 'UEFA', 1554, 4, 7, 2, 0, 3),
(2, 'Portugal', 'UEFA', 1443, 6, 5, 1, 1, 3),
(4, 'Suiza', 'UEFA', 1322, 5, 5, 1, 2, 5),
(6, 'Alemania', 'UEFA', 1275, 9, 6, 0, 2, 2),
(7, 'Francia', 'UEFA', 1188, 6, 6, 1, 1, 2),
(8, 'Marruecos', 'CAF', 1179, 2, 4, 1, 1, 5),
(9, 'Ecuador', 'CONMEBOL', 1176, 0, 3, 1, 1, 9),
(10, 'Argentina', 'CONMEBOL', 1142, 5, 5, 2, 0, 1),
(11, 'Uruguay', 'CONMEBOL', 1140, 3, 4, 0, 3, 4),
(12, 'República de Corea', 'AFC', 1135, 2, 4, 0, 2, 8),
(13, 'Inglaterra', 'UEFA', 1134, 4, 5, 1, 2, 3),
(14, 'EE. UU.', 'CONCACAF', 1133, 6, 4, 1, 1, 3),
(16, 'Colombia', 'CONMEBOL', 1082, 4, 5, 1, 1, 3),
(17, 'Brasil', 'CONMEBOL', 1065, 4, 5, 1, 1, 6),
(19, 'Canadá', 'CONCACAF', 1044, 7, 6, 2, 1, 2),
(20, 'Senegal', 'CAF', 1025, 3, 4, 0, 6, 8),
(21, 'México', 'CONCACAF', 979, 3, 4, 2, 0, 4),
(23, 'Países Bajos', 'UEFA', 976, 7, 5, 0, 3, 9),
(26, 'Japón', 'AFC', 949, 6, 4, 1, 2, 7);


CREATE TABLE jugadores_destacados (
id_jugador INT,
nombre VARCHAR(100),equipo VARCHAR(50),
fecha_nacimiento DATE,
altura_metros DECIMAL(3,2),
es_capitan BOOLEAN,
valor_mercado_millones DECIMAL(5,1)
);

INSERT INTO jugadores_destacados (id_jugador, nombre, equipo, fecha_nacimiento, altura_metros,
es_capitan, valor_mercado_millones) VALUES
(1, 'Lionel Messi', 'Argentina', '1987-06-24', 1.70, TRUE, 35.5),
(2, 'Kylian Mbappé', 'Francia', '1998-12-20', 1.78, FALSE, 180.0),
(3, 'Manuel Neuer', 'Alemania', '1986-03-27', 1.93, TRUE, 12.0),
(4, 'Virgil van Dijk', 'Países Bajos', '1991-07-08', 1.95, TRUE, 30.0),
(5, 'Alphonso Davies', 'Canadá', '2000-11-02', 1.85, FALSE, 70.0),
(6, 'Yassine Bounou', 'Marruecos', '1991-04-05', 1.95, FALSE, 18.0),
(7, 'Christian Pulisic', 'EE. UU.', '1998-09-18', 1.77, TRUE, 32.0),
(8, 'Enner Valencia', 'Ecuador', '1989-11-04', 1.77, TRUE, 3.0),
(9, 'Pedri', 'España', '2002-11-25', 1.74, FALSE, 90.0);

CREATE INDEX idx_equipo_estadisticas
ON estadisticas_mundial (equipo);

CREATE INDEX idx_jugador_mercado
ON jugadores_destacados (valor_mercado_millones);


-- ================================== Querys =====================================

SELECT equipo, MAX(altura_metros) AS Altura
FROM jugadores_destacados
GROUP BY equipo;


SELECT equipo, AVG(goles_anotados)
FROM estadisticas_mundial
GROUP BY equipo
HAVING AVG(goles_anotados) > 4
ORDER BY AVG(goles_anotados) DESC;


-- 1 - Realizar una consulta que cuente la cantidad total de equipos registrados en la tabla
    -- 'estadisticas_mundial' y devuelva el resultado bajo el alias 'cantidad_equipos'.

SELECT
COUNT(*) AS cantidad_equipos
FROM estadisticas_mundial;


-- 2 - Realizar una consulta que determine la altura maxima y la altura minima entre todos los
     -- jugadores destacados, utilizando los alias 'altura_maxima' y 'altura_minima'.

SELECT
MAX(altura_metros) AS altura_maxima,
MIN(altura_metros) AS altura_minima
FROM jugadores_destacados;


-- 3 - Realizar una consulta que calcule la suma total del valor de mercado de todos los
     -- jugadores destacados y renombre la columna resultante como 'valor_total_mercado'.

SELECT
SUM(valor_mercado_millones) AS valor_total_mercado
FROM
jugadores_destacados;


-- 4 - Realizar una consulta que muestre el nombre de la confederacion y la suma de todos los
     -- goles anotados por sus equipos correspondientes, filtrando para que el reporte devuelva
     -- exclusivamente a las confederaciones que acumulen mas de 5 goles en total.

SELECT confederacion, SUM(goles_anotados) AS total_goles
FROM
estadisticas_mundial
GROUP BY
confederacion
HAVING
SUM(goles_anotados) > 5;


-- 5 - Realizar una consulta que agrupe los datos por 'confederacion' y calcule el promedio de
     -- sus puntos FIFA, mostrando en el resultado final solo aquellas confederaciones cuyo promedio
     -- supere los 1100 puntos.

SELECT confederacion, AVG(puntos_fifa) AS promedio_puntos
FROM estadisticas_mundial
GROUP BY
confederacion
HAVING
AVG(puntos_fifa) > 1100;


-- 6 - Realizar una consulta que agrupe a los jugadores destacados dependiendo de si son capitanes
     -- o no, calcule la suma total del valor de mercado para cada grupo y muestre unicamente  el grupo
     -- cuya suma total de mercado sea mayor a 100 millones

SELECT es_capitan, SUM(valor_mercado_millones) AS suma_valor_mercado
FROM
jugadores_destacados
GROUP BY
es_capitan
HAVING
SUM(valor_mercado_millones) > 100;