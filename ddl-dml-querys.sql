-- ================================== Schema ====================================

-- DDL: Creacion de tablas de la Tienda
CREATE TABLE productos_tienda (
id_producto INTEGER PRIMARY KEY,
nombre TEXT NOT NULL,
categoria VARCHAR(50) NOT NULL CHECK (categoria IN ('Plantas','Macetas','Insumos','Accesorios')),
precio NUMERIC(12,2) NOT NULL CHECK (precio >= 0),
costo NUMERIC(12,2) NOT NULL CHECK (costo >= 0),
stock INTEGER NOT NULL CHECK (stock >= 0),
fecha_alta DATE NOT NULL,
proveedor_codigo VARCHAR(30)
);

CREATE TABLE ordenes_envio (
id_orden INTEGER PRIMARY KEY,
cliente TEXT NOT NULL,
fecha_pedido DATE NOT NULL,
monto_total NUMERIC(14,2) NOT NULL CHECK (monto_total >= 0),
peso_gramos INTEGER NOT NULL CHECK (peso_gramos >= 0),
codigo_seguimiento VARCHAR(30),
fecha_entrega DATE,
CONSTRAINT chk_fecha_entrega CHECK (fecha_entrega IS NULL OR fecha_entrega >= fecha_pedido)
);

-- =================================== Datos =====================================

-- DML: Insercion de datos
INSERT INTO productos_tienda (id_producto, nombre, categoria, precio, costo, stock, fecha_alta, proveedor_codigo) VALUES
(1, '  Potus N-Joy  ', 'Plantas', 1500.00, 600.00, 45, '2026-01-10', 'PROV-BIO'),
(2, 'Alocasia Amazonica', 'Plantas', 4500.50, 2100.00, 12, '2026-02-15', 'PROV-BIO'),
(3, 'Maceta de Barro N18', 'Macetas', 1200.00, 500.00, 80, '2025-11-20', NULL),
(4, 'Sustrato Premium 5L', 'Insumos', 2500.00, 1100.00, 150, '2026-03-01', 'PROV-MATE'),
(5, 'Fertilizante Orgánico Líquido', 'Insumos', 3200.00, 1500.00, 0, '2026-04-12', 'PROV-MATE'),
(6, 'Regadera Plástica Vintage', 'Accesorios', 5800.00, 3000.00, 8, '2025-12-05', NULL),
(7, 'Tijera de Poda Profesional', 'Accesorios', 12500.99, 6200.00, 5, '2026-05-22', 'PROV-TOOL'),
(8, '  Lámpara LED Cultivo ', 'Accesorios', 28000.00, 14000.00, 3, '2026-01-20', 'PROV-ELEC'),
(9, 'Monstera Deliciosa', 'Plantas', 6500.00, 3000.00, 20, '2026-03-15', 'PROV-BIO'),
(10, 'Sansevieria Trifasciata', 'Plantas', 2200.00, 900.00, 60, '2026-04-01', 'PROV-BIO'),
(11, ' Ficus Lyrata ', 'Plantas', 8900.00, 4100.00, 5, '2026-05-10', 'PROV-BIO'),
(12, 'Maceta Cerámica Esmaltada', 'Macetas', 4500.00, 2000.00, 35, '2025-10-15', 'PROV-DECO'),
(13, 'Humus de Lombriz 2KG', 'Insumos', 1800.00, 750.00, 100, '2026-01-05', 'PROV-MATE'),
(14, 'Perlita Agrícola 10L', 'Insumos', 3100.00, 1200.00, 40, '2026-02-28', 'PROV-MATE'),
(15, 'Tutor de Fibra de Coco', 'Accesorios', 2500.00, 900.00, 50, '2026-06-01', NULL),
(16, 'Termohigrómetro Digital', 'Accesorios', 15000.00, 8000.00, 15, '2026-04-20', 'PROV-ELEC'),
(17, '   Pilea Peperomioides', 'Plantas', 3500.00, 1500.00, 0, '2026-05-05', 'PROV-BIO'),
(18, 'Plato Recolector N18', 'Macetas', 500.00, 150.00, 200, '2025-09-10', NULL),
(19, 'Kit Herramientas Bonsái', 'Accesorios', 22000.00, 11000.00, 4, '2026-06-15', 'PROV-TOOL'),
(20, 'Aceite de Neem 100ml', 'Insumos', 4200.00, 1800.00, 75, '2026-03-22', 'PROV-MATE');

INSERT INTO ordenes_envio (id_orden, cliente, fecha_pedido, monto_total, peso_gramos, codigo_seguimiento, fecha_entrega) VALUES
(101, 'Carlos Gómez', '2026-06-01', 7500.00, 2500, 'AR-9874-A', '2026-06-05'),
(102, 'Ana María Silva', '2026-06-10', 12000.50, 5800, 'BR-1122-X', '2026-06-15'),
(103, 'Juan Pérez', '2026-06-14', 3200.00, 850, 'AR-3344-B', NULL),
(104, 'mariana lópez', '2026-06-18', 28000.00, 4200, 'US-5566-Z', '2026-06-22'),
(105, 'Luis Fernández', '2026-06-25', 1500.00, 1200, 'AR-7788-C', NULL),
(106, 'Sofía Rodríguez', '2026-06-28', 5800.00, 3100, NULL, NULL),
(107, '  Diego Maradona  ', '2026-01-15', 45000.00, 8500, 'AR-1010-D', '2026-01-20'),
(108, 'Lucía Méndez', '2026-02-14', 2200.00, 500, 'AR-4455-E', '2026-02-18'),
(109, 'esteban quito', '2026-03-05', 15500.00, 3500, 'CH-9988-F', '2026-03-12'),
(110, 'Valeria Lynch', '2026-03-20', 8900.00, 2100, NULL, NULL),
(111, 'Roberto Carlos', '2026-04-01', 32000.00, 6200, 'BR-7777-G', '2026-04-10'),
(112, 'Marta Minujín', '2026-04-15', 4500.00, 1100, 'AR-1234-H', '2026-04-18'),
(113, '  julio bocca', '2026-05-10', 18000.00, 4000, 'AR-5678-I', '2026-05-15'),
(114, 'Florencia Peña', '2026-05-25', 500.00, 200, NULL, NULL),
(115, 'Ricardo Darín', '2026-06-05', 65000.00, 12000, 'AR-9999-J', '2026-06-12'),
(116, 'Susana Giménez', '2026-06-29', 12500.99, 1500, 'UY-4321-K', NULL),
(117, 'Charly García', '2026-06-30', 2500.00, 800, 'AR-6666-L', NULL),
(118, 'Fito Páez', '2025-12-20', 14000.00, 3200, 'AR-0001-M', '2025-12-28');

-- ================================== Querys =====================================

-- Productos que estan agotados (sin stock)
SELECT id_producto, TRIM(nombre) AS nombre, categoria 
FROM productos_tienda 
WHERE stock = 0;

-- Ordenes que aun no tienen codigo de seguimiento (pendientes de despacho)
SELECT id_orden, cliente, fecha_pedido, monto_total
FROM ordenes_envio 
WHERE codigo_seguimiento IS NULL
ORDER BY monto_total DESC;

-- Ordenes que superen los 5kg (5000 gramos) y que ya hayan sido entregadas
SELECT id_orden, cliente, peso_gramos, fecha_entrega 
FROM ordenes_envio 
WHERE peso_gramos > 5000 AND fecha_entrega IS NOT NULL
ORDER BY fecha_entrega;

-- Productos dados de alta en un mes y año específico (Ej. Marzo 2026)
SELECT nombre, categoria, fecha_alta 
FROM productos_tienda 
WHERE EXTRACT(MONTH FROM fecha_alta) = 3 
  AND EXTRACT(YEAR FROM fecha_alta) = 2026;

-- Productos cuyo precio este por encima del promedio general de la tienda
SELECT TRIM(nombre) AS nombre, categoria, precio 
FROM productos_tienda
WHERE precio > (SELECT AVG(precio) FROM productos_tienda)
ORDER BY precio DESC;


-- ================================== Schema ====================================

-- DDL: Creacion de estructuras con Claves Primarias y Foraneas
CREATE TABLE estadisticas_mundial (
    id_equipo INT PRIMARY KEY,
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

CREATE TABLE jugadores_destacados (
    id_jugador INT PRIMARY KEY,
    id_equipo INT,
    nombre VARCHAR(100),
    posicion VARCHAR(50),
    fecha_nacimiento DATE,
    altura_metros DECIMAL (3,2),
    es_capitan BOOLEAN,
    valor_mercado_millones DECIMAL (5,1),
    -- Clave foranea que conecta al jugador con su equipo
    FOREIGN KEY (id_equipo) REFERENCES estadisticas_mundial (id_equipo)
);

-- =================================== Datos =====================================

-- DML: Insercion de datos
INSERT INTO estadisticas_mundial 
(id_equipo, puesto_ranking, equipo, confederacion, puntos_fifa, goles_anotados, partidos_jugados, porterias_a_cero, goles_recibidos, paradas_portero) 
VALUES
(1, 1, 'Argentina', 'CONMEBOL', 1855, 15, 7, 3, 8, 14),
(2, 2, 'Francia', 'UEFA', 1845, 16, 7, 2, 8, 12),
(3, 3, 'Inglaterra', 'UEFA', 1800, 13, 5, 3, 4, 9),
(4, 4, 'Bélgica', 'UEFA', 1798, 1, 3, 1, 2, 8),
(5, 5, 'Brasil', 'CONMEBOL', 1784, 8, 5, 2, 3, 10),
(6, 6, 'Países Bajos', 'UEFA', 1745, 10, 5, 2, 4, 15),
(7, 7, 'Portugal', 'UEFA', 1745, 12, 5, 1, 6, 11),
(8, 8, 'España', 'UEFA', 1732, 9, 4, 2, 3, 7),
(9, 11, 'Uruguay', 'CONMEBOL', 1665, 2, 3, 2, 2, 6),
(10, 12, 'Marruecos', 'CAF', 1661, 6, 7, 4, 5, 18),
(11, 13, 'Colombia', 'CONMEBOL', 1655, 0, 0, 0, 0, 0),
(12, 14, 'EE. UU.', 'CONCACAF', 1652, 3, 4, 2, 4, 13),
(13, 15, 'México', 'CONCACAF', 1652, 2, 3, 1, 3, 10);

INSERT INTO jugadores_destacados 
(id_jugador, id_equipo, nombre, posicion, fecha_nacimiento, altura_metros, es_capitan, valor_mercado_millones) 
VALUES
-- Argentina
(1, 1, 'Lionel Messi', 'Delantero', '1987-06-24', 1.70, TRUE, 30.0),
(2, 1, 'Emiliano Martínez', 'Portero', '1992-09-02', 1.95, FALSE, 28.0),
(3, 1, 'Julián Álvarez', 'Delantero', '2000-01-31', 1.70, FALSE, 90.0),
(4, 1, 'Rodrigo De Paul', 'Mediocampista', '1994-05-24', 1.80, FALSE, 35.0),
-- Francia
(5, 2, 'Kylian Mbappé', 'Delantero', '1998-12-20', 1.78, TRUE, 180.0),
(6, 2, 'Antoine Griezmann', 'Mediocampista', '1991-03-21', 1.76, FALSE, 25.0),
(7, 2, 'Mike Maignan', 'Portero', '1995-07-03', 1.91, FALSE, 40.0),
-- Inglaterra
(8, 3, 'Harry Kane', 'Delantero', '1993-07-28', 1.88, TRUE, 110.0),
(9, 3, 'Jude Bellingham', 'Mediocampista', '2003-06-29', 1.86, FALSE, 180.0),
-- Brasil
(10, 5, 'Vinícius Júnior', 'Delantero', '2000-07-12', 1.76, FALSE, 150.0),
(11, 5, 'Alisson Becker', 'Portero', '1992-10-02', 1.93, FALSE, 32.0),
(12, 5, 'Casemiro', 'Mediocampista', '1992-02-23', 1.85, TRUE, 30.0),
-- España
(13, 8, 'Álvaro Morata', 'Delantero', '1992-10-23', 1.89, TRUE, 20.0),
(14, 8, 'Pedri', 'Mediocampista', '2002-11-25', 1.74, FALSE, 80.0),
(15, 8, 'Lamine Yamal', 'Delantero', '2007-07-13', 1.78, FALSE, 75.0),
-- Marruecos
(16, 10, 'Yassine Bounou', 'Portero', '1991-04-05', 1.95, FALSE, 15.0),
(17, 10, 'Achraf Hakimi', 'Defensa', '1998-11-04', 1.81, TRUE, 65.0),
-- EE. UU.
(18, 12, 'Christian Pulisic', 'Delantero', '1998-09-18', 1.77, TRUE, 32.0);

-- ================================== Querys =====================================

-- Ver los 5 jugadores mas caros del listado
SELECT nombre, equipo, valor_mercado_millones
FROM jugadores_destacados j
INNER JOIN estadisticas_mundial e ON j.id_equipo = e.id_equipo
ORDER BY valor_mercado_millones DESC
LIMIT 5;


-- Valor de mercado total de los jugadores destacados agrupado por equipo
SELECT e.equipo, e.confederacion, 
    SUM(j.valor_mercado_millones) AS valor_total_millones
FROM estadisticas_mundial e
INNER JOIN jugadores_destacados j ON e.id_equipo = j.id_equipo
GROUP BY e.equipo, e.confederacion
ORDER BY valor_total_millones DESC;


-- Jugadores "jovenes" (nacidos en el año 2000 o posterior) ordenados por valor de mercado
SELECT nombre, posicion, fecha_nacimiento, valor_mercado_millones
FROM jugadores_destacados
WHERE EXTRACT(YEAR FROM fecha_nacimiento) >= 2000
ORDER BY valor_mercado_millones DESC;


-- Jugadores cuyo valor de mercado supera el promedio de todos los jugadores
SELECT j.nombre, j.posicion, e.equipo, j.valor_mercado_millones
FROM jugadores_destacados j
INNER JOIN estadisticas_mundial e ON j.id_equipo = e.id_equipo
WHERE j.valor_mercado_millones > (
    SELECT AVG(valor_mercado_millones) 
    FROM jugadores_destacados
)
ORDER BY j.valor_mercado_millones DESC;


-- Valor promedio de mercado de los jugadores agrupado por confederacion
SELECT e.confederacion,
    COUNT(*) AS cantidad_jugadores,
    ROUND(AVG(j.valor_mercado_millones), 2) AS valor_promedio_millones
FROM estadisticas_mundial e
INNER JOIN jugadores_destacados j ON e.id_equipo = j.id_equipo
GROUP BY e.confederacion
ORDER BY valor_promedio_millones DESC;