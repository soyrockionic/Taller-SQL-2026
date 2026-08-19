-- ================================== Schema ====================================

/*
Cliente = (idCliente, nombre, apellido, DNI, telefono, direccion)
Factura = (nroTicket, total, fecha, hora, idCliente (fk))
Detalle = (nroTicket (fk), idProducto (fk), cantidad, preciounitario)
Producto = (idProducto, nombreP, descripcion, precio, stock)
*/

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    DNI VARCHAR(20),
    telefono VARCHAR(30),
    direccion VARCHAR(200)
);

CREATE TABLE Producto (
    idProducto INT PRIMARY KEY,
    nombreP VARCHAR(100),
    descripcion VARCHAR(300),
    precio DECIMAL(10,2)
);

CREATE TABLE Factura (
    nroTicket INT PRIMARY KEY,
    total DECIMAL(10,2),
    fecha DATE,
    hora TIME,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Detalle (
    nroTicket INT,
    idProducto INT,
    cantidad INT,
    preciounitario DECIMAL(10,2),
    PRIMARY KEY (nroTicket, idProducto),
    FOREIGN KEY (nroTicket) REFERENCES Factura(nroTicket),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);


-- =================================== Datos =====================================

-- Clientes (6)
INSERT INTO Cliente VALUES (1, 'Juan', 'Perez', '40578998', '221-4400789', '11 entre 500 y 501 nro:2587');
INSERT INTO Cliente VALUES (2, 'María', 'López', '35123456', '11-5555-0000', 'Av. Siempre Viva 123');
INSERT INTO Cliente VALUES (3, 'Carlos', 'Ruiz', '28999888', '351-666-7777', 'Calle Falsa 456');
INSERT INTO Cliente VALUES (4, 'Ana', 'García', '30111222', '221-333-4444', 'Diag. 78 nro:100');
INSERT INTO Cliente VALUES (5, 'Jorge', 'Pérez', '42000111', '11-7777-8888', 'Calle 10 e/ 40 y 41');
INSERT INTO Cliente VALUES (6, 'Lucía', 'Fernández', '33444555', '221-999-0000', 'Calle 20 nro:300');

-- Productos (6)
INSERT INTO Producto VALUES (1, 'prod38', 'Producto de prueba 38', 5000.00);
INSERT INTO Producto VALUES (2, 'Z', 'Producto Z especial', 15000.00);
INSERT INTO Producto VALUES (3, 'A', 'Producto genérico A', 8000.00);
INSERT INTO Producto VALUES (4, 'B', 'Producto genérico B', 3000.00);
INSERT INTO Producto VALUES (5, 'C', 'Producto genérico C', 12000.00);
INSERT INTO Producto VALUES (6, 'D', 'Producto nunca vendido', 9000.00);  -- Sin ventas

-- Facturas (8) - distribuidas en 2023 y 2024
INSERT INTO Factura VALUES (1001, 110000.00, '2024-03-15', '10:30:00', 1);  -- Juan Perez
INSERT INTO Factura VALUES (1002, 50000.00, '2023-07-20', '14:00:00', 1);   -- Juan Perez
INSERT INTO Factura VALUES (1003, 95000.00, '2024-01-10', '09:15:00', 2);   -- María López
INSERT INTO Factura VALUES (1004, 100001.00, '2024-06-01', '16:45:00', 3);  -- Carlos Ruiz
INSERT INTO Factura VALUES (1005, 100000.00, '2023-12-31', '23:59:00', 4);  -- Ana García
INSERT INTO Factura VALUES (1006, 60000.00, '2024-05-20', '11:00:00', 5);   -- Jorge Pérez
INSERT INTO Factura VALUES (1007, 45000.00, '2023-11-10', '18:30:00', 5);   -- Jorge Pérez
INSERT INTO Factura VALUES (1008, 30000.00, '2024-08-15', '12:00:00', 6);   -- Lucía Fernández

-- Detalle (12) - relacionando facturas con productos
INSERT INTO Detalle VALUES (1001, 1, 2, 5000.00);   -- Juan: prod38 x2
INSERT INTO Detalle VALUES (1001, 3, 1, 8000.00);   -- Juan: A x1
INSERT INTO Detalle VALUES (1002, 2, 1, 15000.00);  -- Juan: Z x1 (ticket 1002)
INSERT INTO Detalle VALUES (1003, 3, 1, 8000.00);   -- María: A x1
INSERT INTO Detalle VALUES (1003, 4, 2, 3000.00);   -- María: B x2
INSERT INTO Detalle VALUES (1004, 5, 1, 12000.00);  -- Carlos: C x1
INSERT INTO Detalle VALUES (1005, 4, 3, 3000.00);   -- Ana: B x3
INSERT INTO Detalle VALUES (1006, 1, 1, 5000.00);   -- Jorge Pérez: prod38 x1
INSERT INTO Detalle VALUES (1006, 3, 2, 8000.00);   -- Jorge Pérez: A x2
INSERT INTO Detalle VALUES (1007, 2, 1, 15000.00);  -- Jorge Pérez: Z x1 (ticket 1007)
INSERT INTO Detalle VALUES (1008, 4, 2, 3000.00);   -- Lucía: B x2
INSERT INTO Detalle VALUES (1008, 5, 1, 12000.00);  -- Lucía: C x1


-- ================================== Querys =====================================

-- 1) Listar datos personales de clientes cuyo apellido comience con el string ‘Pe’. Ordenar por DNI.

SELECT *
FROM Cliente
WHERE apellido LIKE 'PE%'
ORDER BY DNI;


-- 2) Listar nombre, apellido, DNI, telefono y direccion de clientes que realizaron compras solamente
    -- durante 2024

SELECT c.nombre, c.apellido, c.dni, c.telefono, c.direccion
FROM Cliente c
WHERE c.idCliente IN (
  SELECT f.idCliente
  FROM Factura f
  WHERE f.fecha >= '2024-01-01' AND f.fecha < '2025-01-01')
AND c.idCliente NOT IN (
  SELECT f.idCliente
  FROM Factura f
  WHERE f.fecha < '2024-01-01' OR f.fecha >= '2025-01-01');


-- 3. Listar nombre, descripcion, precio y stock de productos vendidos al cliente con DNI 45789456,
    -- pero que no fueron vendidos a clientes de apellido ‘Garcia’.

SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p
WHERE p.idProducto IN (
  SELECT d.idProducto
  FROM Detalle d
  INNER JOIN Factura f ON d.nroTicket = f.nroTicket
  INNER JOIN Cliente c ON f.idCliente = c.idCliente
  WHERE c.DNI = '45789456')
AND p.idProducto NOT IN (
  SELECT d.idProducto
  FROM Detalle d
  INNER JOIN Factura f ON d.nroTicket = f.nroTicket
  INNER JOIN Cliente c ON f.idCliente = c.idCliente
  WHERE c.apellido = 'Garcia');


-- 4. Listar nombre, descripcion, precio y stock de productos no vendidos a clientes que tengan
    -- telefono con caracteristica 221 (la caracteristica esta al comienzo del telefono). Ordenar por
    -- nombre.

SELECT p.nombreP, p.descripcion, p.precio, p.stock
FROM Producto p
WHERE p.idProducto NOT IN (
  SELECT d.idProducto
  FROM Detalle d
  INNER JOIN Factura f ON d.nroTicket = f.nroTicket
  INNER JOIN Cliente c ON f.idCliente = c.idCliente
  WHERE c.telefono LIKE '221%')
ORDER BY p.nombreP;


-- 5) Listar para cada producto nombre, descripcion, precio y cuantas veces fue vendido. Tenga en
    -- cuenta que puede no haberse vendido nunca el producto.

SELECT p.nombreP, p.descripcion, p.precio,
COUNT(d.nroTicket) AS veces_vendido
FROM Producto p
LEFT JOIN Detalle d ON p.idProducto = d.idProducto
GROUP BY  p.nombreP, p.descripcion, p.precio;


-- 6. Listar nombre, apellido, DNI, telefono y direccion de clientes que compraron los productos con
    -- nombre ‘prod1’ y ‘prod2’ pero nunca compraron el producto con nombre ‘prod3’.

SELECT c.nombre, c.apellido, c.DNI, c.telefono, c.direccion
FROM Cliente c
WHERE c.idCliente IN (
  SELECT f.idCliente
  FROM Factura f
  INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
  INNER JOIN Producto p ON d.idProducto = p.idProducto
  WHERE p.nombreP = 'prod1')
AND c.idCliente IN (
  SELECT f.idCliente
  FROM Factura f
  INNER JOIN Detalle d ON f.nroTicket = d.nroTicket
  INNER JOIN Producto p ON d.idProducto = p.idProducto
  WHERE p.nombreP = 'prod2')
AND c.idCliente NOT IN (
  SELECT f.idCliente
  FROM Factura f
  INNER JOIN Detalle d ON f.nroticket = d.nroTicket
  INNER JOIN Producto p ON d.idProducto = p.idProducto
  WHERE p.nombreP = 'prod3');


-- 7. Listar nroTicket, total, fecha, hora y DNI del cliente, de aquellas facturas donde se haya
    -- comprado el producto ‘prod38’ o la factura tenga fecha de 2023.

SELECT f.nroTicket, f.total, f.fecha, f.hora, c.DNI
FROM Factura f
INNER JOIN Cliente c ON f.idCliente = c.idCliente
WHERE f.nroTicket IN (
  SELECT d.nroTicket
  FROM Detalle d
  INNER JOIN Producto p ON d.idProducto = p.idProducto
  WHERE p.nombreP = 'prod38')
OR (f.fecha >= '2023-01-01' AND f.fecha < '2024-01-01');


-- 9. Listar nroTicket, total, fecha, hora para las facturas del cliente ´Jorge Pérez´ donde no haya
    -- comprado el producto ´Z´.

SELECT f.nroTicket, f.total, f.fecha, f.hora
FROM Factura f
INNER JOIN Cliente c ON f.idCliente = c.idCliente
WHERE (c.nombre = 'Jorge' AND c.apellido = 'Pérez')
AND f.nroTicket NOT IN (
  SELECT d.nroTicket
  FROM Detalle d
  INNER JOIN Producto p ON d.idProducto = p.idProducto
  WHERE p.nombreP = 'Z');


-- 10. Listar DNI, apellido y nombre de clientes donde el monto total comprado, teniendo en cuenta
      -- todas sus facturas, supere $100000.

SELECT c.DNI, c.apellido, c.nombre
FROM Cliente c
INNER JOIN Factura f ON c.idCliente = f.idCliente
GROUP BY c.DNI, c.apellido, c.nombre
HAVING SUM(f.total) > 100000;