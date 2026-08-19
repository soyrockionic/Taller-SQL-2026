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

INSERT INTO jugadores_destacados (id_jugador, nombre, equipo, fecha_nacimiento, altura_metros,
es_capitan, valor_mercado_millones) VALUES
(10, 'Rocky Ionic', 'España', '1980-03-15', 1.82, FALSE, 8.0),
(11, 'Bruno Fernandes', 'Portugal', '1994-09-08', 1.79, TRUE, 75.0),
(12, 'Granit Xhaka', 'Suiza', '1992-09-27', 1.85, TRUE, 25.0),
(13, 'Joshua Kimmich', 'Alemania', '1995-02-08', 1.77, TRUE, 65.0),
(14, 'Hugo Lloris', 'Francia', '1986-12-26', 1.88, TRUE, 5.0),
(15, 'Achraf Hakimi', 'Marruecos', '1998-11-04', 1.81, FALSE, 65.0),
(16, 'Luis Díaz', 'Colombia', '1997-01-13', 1.78, FALSE, 55.0),
(17, 'Vinícius Júnior', 'Brasil', '2000-07-12', 1.76, FALSE, 150.0),
(18, 'Alphonso Davies', 'Canadá', '2000-11-02', 1.85, FALSE, 70.0),
(19, 'Sadio Mané', 'Senegal', '1992-04-10', 1.75, TRUE, 30.0),
(20, 'Hirving Lozano', 'México', '1995-07-30', 1.77, FALSE, 35.0),
(21, 'Memphis Depay', 'Países Bajos', '1994-02-13', 1.76, FALSE, 25.0),
(22, 'Takumi Minamino', 'Japón', '1995-01-16', 1.74, FALSE, 15.0),
(23, 'Son Heung-min', 'República de Corea', '1992-07-08', 1.83, TRUE, 70.0),
(24, 'Gavi', 'España', '2004-08-05', 1.74, FALSE, 80.0),
(25, 'Julián Álvarez', 'Argentina', '2000-01-31', 1.74, FALSE, 75.0);


UPDATE jugadores_destacados
SET es_capitan = FALSE, valor_mercado_millones = 5.0
where id_jugador = 10;

-- ================================== Querys =====================================

SELECT
equipo,
puntos_fifa
FROM
estadisticas_mundial
WHERE
confederacion = 'CONMEBOL'
ORDER BY
puntos_fifa DESC
LIMIT 3;

SELECT
nombre,
equipo,
valor_mercado_millones,
fecha_nacimiento
FROM
jugadores_destacados
WHERE es_capitan = TRUE
AND altura_metros >= 1.70
ORDER BY fecha_nacimiento ASC;


-- ============================= Uso de Inner Join =================================

-- "Muestra el nombre del jugador, su altura y los puntos FIFA de su seleccion"

SELECT j.nombre, j.altura_metros,
       e.puntos_fifa AS Puntos_fifa_de_su_seleccion
FROM jugadores_destacados j
INNER JOIN estadisticas_mundial e ON j.equipo = e.equipo;


-- "Muestra el nombre del jugador, su valor de mercado, y los goles anotados por su seleccion, pero
 solo para jugadores que sean capitanes."

SELECT j.nombre, j.valor_mercado_millones,
       e.goles_anotados AS Goles_de_su_seleccion
FROM jugadores_destacados j
INNER JOIN estadisticas_mundial e ON j.equipo = e.equipo
WHERE j.es_capitan = TRUE;


-- "Muestra la confederacion y el promedio de valor de mercado de los jugadores destacados de sus
  selecciones, pero solo para confederaciones cuyo promedio supere los 30 millones."

SELECT e.confederacion, AVG(j.valor_mercado_millones)
FROM estadisticas_mundial e
INNER JOIN jugadores_destacados j on j.equipo = e.equipo
GROUP BY e.confederacion
HAVING AVG(j.valor_mercado_millones) > 30;


-- "Muestra nombre del jugador, equipo, y goles anotados del equipo, para jugadores de valor mayor
  a 30 millones"

SELECT j.nombre, j.equipo, e.goles_anotados AS goles_anotados_equipo
FROM jugadores_destacados AS j
INNER JOIN estadisticas_mundial AS e ON j.equipo = e.equipo
WHERE j.valor_mercado_millones > 30;