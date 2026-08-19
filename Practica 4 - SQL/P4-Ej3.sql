-- ================================== Schema ====================================

/*
Banda = (codigoB, nombreBanda, genero_musical, anio_creacion)
Integrante = (DNI, nombre, apellido, dirección, email, fecha_nacimiento, codigoB(fk))
Escenario = (nroEscenario, nombre_escenario, ubicación, cubierto, m2, descripción)
Recital = (fecha, hora, nroEscenario (fk), codigoB (fk))
*/

CREATE TABLE Banda (
    codigoB INT PRIMARY KEY,
    nombreBanda VARCHAR(100),
    genero_musical VARCHAR(50),
    anio_creacion INT
);

CREATE TABLE Integrante (
    DNI VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    dirección VARCHAR(200),
    email VARCHAR(100),
    fecha_nacimiento DATE,
    codigoB INT,
    FOREIGN KEY (codigoB) REFERENCES Banda(codigoB)
);

CREATE TABLE Escenario (
    nroEscenario INT PRIMARY KEY,
    nombre_escenario VARCHAR(100),
    ubicación VARCHAR(200),
    cubierto BOOLEAN,
    m2 INT,
    descripción VARCHAR(300)
);

CREATE TABLE Recital (
    fecha DATE,
    hora TIME,
    nroEscenario INT,
    codigoB INT NOT NULL,
    PRIMARY KEY (fecha, hora, nroEscenario),
    FOREIGN KEY (nroEscenario) REFERENCES Escenario(nroEscenario),
    FOREIGN KEY (codigoB) REFERENCES Banda(codigoB)
);


-- =================================== Datos =====================================

-- Bandas (6) - distintos generos y años
INSERT INTO Banda VALUES (1, 'Los Redondos', 'Rock', 2000);
INSERT INTO Banda VALUES (2, 'Pop Stars', 'Pop', 2010);
INSERT INTO Banda VALUES (3, 'Cumbia Total', 'Cumbia', 2015);
INSERT INTO Banda VALUES (4, 'Blues Brothers', 'Rock', 2005);
INSERT INTO Banda VALUES (5, 'Jazz Night', 'Jazz', 1995);
INSERT INTO Banda VALUES (6, 'Solitarios', 'Folk', 2020);  -- Banda sin recitales

-- Integrantes (14) - distribuidos en las bandas
INSERT INTO Integrante VALUES ('30111222', 'Carlos', 'Ruiz', 'Calle 7 nro 500', 'carlos@mail.com', '1985-03-15', 1);
INSERT INTO Integrante VALUES ('32333444', 'Ana', 'Garcia', 'Av. 13 nro 1200', 'ana@mail.com', '1990-07-22', 1);
INSERT INTO Integrante VALUES ('35555666', 'Juan', 'Perez', 'Calle 48 nro 800', 'juan@mail.com', '1978-11-03', 1);
INSERT INTO Integrante VALUES ('38777888', 'María', 'Lopez', 'Av. Montevideo nro 300', 'maria@mail.com', '1995-01-30', 2);
INSERT INTO Integrante VALUES ('40999000', 'Jorge', 'Martinez', 'Calle 10 nro 150', 'jorge@mail.com', '1988-06-18', 2);
INSERT INTO Integrante VALUES ('42111333', 'Lucía', 'Fernandez', 'Av. Colon nro 2500', 'lucia@mail.com', '2000-09-10', 2);
INSERT INTO Integrante VALUES ('36666777', 'Pedro', 'Sanchez', 'Calle Belgrano nro 400', 'pedro@mail.com', '1992-04-12', 3);
INSERT INTO Integrante VALUES ('39888999', 'Laura', 'Torres', 'Av. España nro 900', 'laura@mail.com', '1987-12-05', 3);
INSERT INTO Integrante VALUES ('41222333', 'Diego', 'Ramirez', 'Calle 5 nro 100', 'diego@mail.com', '1998-08-25', 4);
INSERT INTO Integrante VALUES ('43444555', 'Sofía', 'Castro', 'Calle 6 nro 200', 'sofia@mail.com', '2001-02-14', 4);
INSERT INTO Integrante VALUES ('44555666', 'Mateo', 'Silva', 'Calle 9 nro 700', 'mateo@mail.com', '1999-05-20', 4);
INSERT INTO Integrante VALUES ('45666777', 'Valentina', 'Ríos', 'Calle 11 nro 850', 'valentina@mail.com', '1970-10-08', 5);
INSERT INTO Integrante VALUES ('46777888', 'Santiago', 'Vega', 'Calle 13 nro 920', 'santiago@mail.com', '1968-03-30', 5);
INSERT INTO Integrante VALUES ('47888999', 'Camila', 'Ortiz', 'Calle 15 nro 1000', 'camila@mail.com', '2003-11-11', 6); -- Banda sin recitales

-- Escenarios (5) - cubiertos y descubiertos, distintos tamaños
INSERT INTO Escenario VALUES (1, 'Luna Park', 'Buenos Aires', TRUE, 5000, 'Estadio cubierto clasico');
INSERT INTO Escenario VALUES (2, 'Movistar Arena', 'Buenos Aires', TRUE, 8000, 'Arena moderna techada');
INSERT INTO Escenario VALUES (3, 'Estadio Unico', 'La Plata', FALSE, 20000, 'Estadio al aire libre');
INSERT INTO Escenario VALUES (4, 'Teatro Colon', 'Buenos Aires', TRUE, 3000, 'Teatro historico');
INSERT INTO Escenario VALUES (5, 'Plaza Mayor', 'Cordoba', FALSE, 10000, 'Escenario al aire libre sin recitales');

-- Recitales (10) - distintas fechas, bandas y escenarios
INSERT INTO Recital VALUES ('2023-03-10', '20:00:00', 1, 1);  -- Los Redondos en Luna Park 2023
INSERT INTO Recital VALUES ('2023-06-15', '21:30:00', 2, 1);  -- Los Redondos en Movistar 2023
INSERT INTO Recital VALUES ('2023-09-20', '19:00:00', 3, 2);  -- Pop Stars en Estadio Unico 2023
INSERT INTO Recital VALUES ('2024-01-05', '20:00:00', 1, 2);  -- Pop Stars en Luna Park 2024
INSERT INTO Recital VALUES ('2024-02-14', '22:00:00', 3, 3);  -- Cumbia Total en Estadio Unico 2024
INSERT INTO Recital VALUES ('2024-04-22', '20:30:00', 4, 4);  -- Blues Brothers en Teatro Colon 2024
INSERT INTO Recital VALUES ('2024-07-30', '21:00:00', 2, 5);  -- Jazz Night en Movistar 2024
INSERT INTO Recital VALUES ('2024-10-11', '20:00:00', 1, 1);  -- Los Redondos en Luna Park 2024
INSERT INTO Recital VALUES ('2025-01-20', '19:30:00', 3, 4);  -- Blues Brothers en Estadio Unico 2025
INSERT INTO Recital VALUES ('2025-03-05', '21:00:00', 2, 3);  -- Cumbia Total en Movistar 2025


-- ================================== Querys =====================================

-- 1. Listar DNI, nombre, apellido,direccion y email de integrantes nacidos entre 1980 y 1990 y que
    -- hayan realizado algun recital durante 2023.

SELECT i.DNI, i.nombre, i.apellido, i.dirección, i.email
FROM Integrante i
WHERE i.fecha_nacimiento >= '1980-01-01' AND i.fecha_nacimiento < '1991-01-01'
AND i.codigoB IN (
  SELECT b.codigoB
  FROM Banda b
  INNER JOIN Recital r ON b.codigoB = r.codigoB
  WHERE r.fecha >= '2023-01-01' AND r.fecha < '2024-01-01');


-- 2. Reportar nombre, genero musical y año de creacion de bandas que hayan realizado recitales
   -- durante 2023, pero no hayan tocado durante 2022 .

SELECT b.nombreBanda, b.genero_musical, anio_creacion
FROM Banda b
WHERE b.codigoB IN (
  SELECT r.codigoB
  FROM Recital r
  WHERE r.fecha >= '2023-01-01' AND r.fecha < '2024-01-01')
AND b.codigoB NOT IN (
  SELECT r.codigoB
  FROM Recital r
  WHERE r.fecha >= '2022-01-01' AND r.fecha < '2023-01-01');


-- 3. Listar el cronograma de recitales del dia 04/12/2023. Se debera listar nombre de la banda que
    -- ejecutara el recital, fecha, hora,

SELECT b.nombreBanda, r.fecha, r.hora, e.nombre_escenario, e.ubicación
FROM Banda b
INNER JOIN Recital r ON b.codigoB = r.codigoB
INNER JOIN Escenario e ON r.nroEscenario = e.nroEscenario
WHERE r.fecha = '2023-12-04'
ORDER BY r.hora; -- Lo agregue yo, no lo pide lo consulta


-- 4. Listar DNI, nombre, apellido,email de integrantes que hayan tocado en el escenario con nombre
    -- 'Gustavo Cerati' y en el escenario con nombre 'Carlos Gardel'.

SELECT i.DNI, i.nombre, i.apellido, i.email
FROM Integrante i
WHERE i.codigoB IN (
  SELECT r.codigoB
  FROM Recital r
  INNER JOIN Escenario e ON r.nroEscenario = e.nroEscenario
  WHERE e.nombre_escenario = 'Gustavo Cerati')
AND i.codigoB IN (
  SELECT r.codigoB
  FROM Recital r
  INNER JOIN Escenario e ON r.nroEscenario = e.nroEscenario
  WHERE e.nombre_escenario = 'Carlos Gardel')


-- 5. Reportar nombre, genero musical y año de creacion de bandas que tengan mas de 5 integrantes.

SELECT b.nombreBanda, genero_musical, anio_creacion
FROM Banda b
INNER JOIN Integrante i ON b.codigoB = i.codigoB
GROUP BY b.nombreBanda, genero_musical, anio_creacion
HAVING COUNT(i.codigoB) > 5;


-- 6. Listar nombre de escenario, ubicacion y descripcion de escenarios que solo tuvieron recitales
    -- con el genero musical rock and roll. Ordenar por nombre de escenario

SELECT e.nombre_escenario, e.ubicación, e.descripción
FROM Escenario e
WHERE e.nroEscenario IN (
  SELECT r.nroEscenario
  FROM Recital r
  INNER JOIN Banda b ON r.codigoB = b.codigoB
  WHERE b.genero_musical = 'rock and roll')
AND e.nroEscenario NOT IN (
  SELECT r.nroEscenario
  FROM Recital r
  INNER JOIN Banda b ON r.codigoB = b.codigoB
  WHERE b.genero_musical != 'rock and roll')
ORDER BY e.nombre_escenario;


-- 7. Listar nombre, genero musical y año de creacion de bandas que hayan realizado recitales en
    -- escenarios cubiertos durante 2023. // cubierto es true, false segun corresponda

SELECT b.nombreBanda, b.genero_musical, b.anio_creacion
FROM Banda b
WHERE b.codigoB IN (
  SELECT r.codigoB
  FROM Recital r
  INNER JOIN Escenario e ON r.nroEscenario = e.nroEscenario
  WHERE r.fecha >= '2023-01-01' AND r.fecha < '2024-01-01'
  AND e.cubierto);


-- 8. Reportar para cada escenario, nombre del escenario y cantidad de recitales durante 2024.

SELECT e.nombre_escenario, COUNT(r.nroEscenario) AS Cantidad_Recitales
FROM Escenario e
LEFT JOIN Recital r ON e.nroEscenario = r.nroEscenario
AND r.fecha >= '2024-01-01' AND r.fecha < '2025-01-01'
GROUP BY e.nombre_escenario;


-- 9. Modificar el nombre de la banda ‘Mempis la Blusera’ a: ‘Memphis la Blusera’.

UPDATE Banda
SET nombreBanda = 'Memphis la Blusera'
WHERE nombreBanda = 'Mempis la Blusera';