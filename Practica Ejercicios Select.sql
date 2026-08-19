-- ================================== Schema ====================================

CREATE TABLE productos_tienda (
  id_producto INT,
  nombre VARCHAR(50),
  categoria VARCHAR(50),
  precio DECIMAL(10,2),
  costo DECIMAL(10,2),
  stock INT,
  fecha_alta DATE,
  proveedor_codigo VARCHAR(20)
);

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
(17, ' Pilea Peperomioides', 'Plantas', 3500.00, 1500.00, 0, '2026-05-05', 'PROV-BIO'),
(18, 'Plato Recolector N18', 'Macetas', 500.00, 150.00, 200, '2025-09-10', NULL),
(19, 'Kit Herramientas Bonsái', 'Accesorios', 22000.00, 11000.00, 4, '2026-06-15', 'PROV-TOOL'),
(20, 'Aceite de Neem 100ml', 'Insumos', 4200.00, 1800.00, 75, '2026-03-22', 'PROV-MATE');


CREATE TABLE ordenes_envio (
  id_orden INT,
  cliente VARCHAR(50),
  fecha_pedido DATE,
  monto_total DECIMAL(10,2),
  peso_gramos INT,
  codigo_seguimiento VARCHAR(20),
  fecha_entrega DATE);

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

-- Obtener todos los datos de los productos que pertenezcan a la categoria 'Plantas'.

SELECT * FROM productos_tienda 
WHERE categoria = 'Plantas';


-- Mostrar el nombre y el precio de los productos cuyo precio sea mayor o igual a 10000.

SELECT nombre, precio 
FROM productos_tienda 
WHERE precio >= 10000;


-- Listar los productos que tengan un stock estrictamente menor a 10 unidades o que no tengan stock (0).

SELECT nombre, stock 
FROM productos_tienda 
WHERE stock < 10;


-- Encontrar todos los productos cuyo costo se encuentre entre 1000 y 3000 inclusive.

SELECT nombre, costo 
FROM productos_tienda 
WHERE costo BETWEEN 1000 AND 3000;


-- Obtener los productos que pertenezcan a los proveedores 'PROV-TOOL', 'PROV-DECO' o 'PROV-ELEC'.

SELECT nombre, proveedor_codigo 
FROM productos_tienda 
WHERE proveedor_codigo IN ('PROV-TOOL', 'PROV-DECO', 'PROV-ELEC');


-- Mostrar todas las ordenes de envio que aun no tengan un codigo de seguimiento asignado.

SELECT id_orden, cliente 
FROM ordenes_envio 
WHERE codigo_seguimiento IS NULL;


-- Listar las ordenes que ya fueron entregadas (que tengan una fecha de entrega registrada) y cuyo monto total supere los 15000.

SELECT id_orden, cliente, monto_total 
FROM ordenes_envio 
WHERE fecha_entrega IS NOT NULL AND monto_total > 15000;


-- Calcular el valor de venta total potencial de cada producto multiplicando el precio por el stock actual.
-- Llamar a la columna resultante 'valor_potencial'.

SELECT nombre, 
       (precio * stock) AS valor_potencial 
FROM productos_tienda;


-- Determinar el margen de ganancia porcentual de cada producto.
-- La formula es '((precio - costo) / costo) * 100'.
-- Nombrar la columna 'margen_porcentual'.

SELECT nombre, 
       ((precio - costo) / costo) * 100 AS margen_porcentual 
FROM productos_tienda;


-- El costo de envío es de $50 por cada 100 gramos de peso. Calcular el costo de envio estimado para cada orden.

SELECT id_orden, 
       cliente, 
       (peso_gramos / 100) * 50 AS costo_envio_estimado 
FROM ordenes_envio;


-- Mostrar los nombres de los productos eliminando los espacios en blanco que puedan tener al principio o al final.

SELECT TRIM(nombre) AS nombre_corregido 
FROM productos_tienda;


-- Encontrar todos los productos cuyo nombre contenga la palabra 'Maceta' en cualquier parte de la cadena.

SELECT nombre, categoria 
FROM productos_tienda 
WHERE nombre LIKE '%Maceta%';


-- Generar un codigo de producto concatenando las tres primeras letras de la categoria en mayusculas, un guion y el ID del producto.

SELECT id_producto, nombre, 
       CONCAT(UPPER(SUBSTRING(categoria, 1, 3)), '-', id_producto)
       AS codigo_generado 
FROM productos_tienda;


-- Extraer unicamente el año de la fecha de pedido de todas las ordenes.

SELECT id_orden, 
       EXTRACT(YEAR FROM fecha_pedido) AS anio_pedido 
FROM ordenes_envio;


-- Encontrar los productos que fueron dados de alta en la base de datos durante el mes de marzo (mes 3) de cualquier año.

SELECT nombre, fecha_alta 
FROM productos_tienda 
WHERE EXTRACT(MONTH FROM fecha_alta) = 3;


-- Calcular la cantidad de días exactos que demoro el envio de cada orden que ya fue entregada, restando la fecha de pedido a la fecha de entrega.

SELECT id_orden, cliente, (fecha_entrega - fecha_pedido) AS dias_demora 
FROM ordenes_envio 
WHERE fecha_entrega IS NOT NULL;


-- Mostrar la fecha de alta de los productos en formato 'DD/MM/YYYY'.

SELECT nombre, 
       TO_CHAR(fecha_alta, 'DD/MM/YYYY') AS fecha_formateada 
FROM productos_tienda;

SELECT id_producto, nombre, 
       DATE_FORMAT(fecha_alta, '%d/%m/%Y') AS fecha_formateada 
FROM productos_tienda;
