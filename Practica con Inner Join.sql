-- ================================== Schema ====================================

-- Tabla Cliente
CREATE TABLE Cliente (
    codCliente INT PRIMARY KEY,
    nombreYAp VARCHAR(100) NOT NULL,
    DNI VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(150),
    sexo CHAR(1),
    edad INT
);

INSERT INTO Cliente (codCliente, nombreYAp, DNI, telefono, direccion, sexo, edad) VALUES
(1, 'Ana García', '30123456', '11-4567-8901', 'Av. Siempre Viva 123', 'F', 28),
(2, 'María López', '28987654', '11-4567-8902', 'Calle Falsa 456', 'F', 35),
(3, 'Laura Martínez', '32112233', '11-4567-8903', 'Belgrano 789', 'F', 42),
(4, 'Carolina Rodríguez', '35445566', '11-4567-8904', 'San Martín 101', 'F', 25),
(5, 'Sofía Fernández', '29778899', '11-4567-8905', 'Rivadavia 202', 'F', 31),
(6, 'Valeria Gómez', '31334455', '11-4567-8906', 'Corrientes 303', 'F', 29),
(7, 'Lucía Pérez', '33667788', '11-4567-8907', 'Santa Fe 404', 'F', 38),
(8, 'Camila Sánchez', '34990011', '11-4567-8908', 'Córdoba 505', 'F', 27),
(9, 'Daniela Torres', '27556677', '11-4567-8909', 'Laprida 606', 'F', 45),
(10, 'Juliana Díaz', '36223344', '11-4567-8910', 'Mitre 707', 'F', 33);


-- Tabla Esteticista
CREATE TABLE Esteticista (
    codEst INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    DNI VARCHAR(20) UNIQUE NOT NULL,
    fecha_nac DATE,
    especialidad VARCHAR(100)
);

INSERT INTO Esteticista (codEst, nombre, apellido, DNI, fecha_nac, especialidad) VALUES
(1, 'Elena', 'Ruiz', '25111222', '1985-03-15', 'Dermatología estética'),
(2, 'Patricia', 'Vega', '26333444', '1988-07-22', 'Masoterapia'),
(3, 'Mónica', 'Castro', '24555666', '1982-11-30', 'Tratamientos faciales'),
(4, 'Silvia', 'Ortiz', '27777888', '1990-01-10', 'Depilación láser'),
(5, 'Andrea', 'Molina', '28999000', '1992-05-18', 'Manicura y pedicura');


-- Tabla Producto
CREATE TABLE Producto (
    codProd INT PRIMARY KEY,
    nombreP VARCHAR(100) NOT NULL,
    descripcion TEXT,
    stock INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

INSERT INTO Producto (codProd, nombreP, descripcion, stock, precio) VALUES
(1, 'Crema Hidratante Facial', 'Crema con ácido hialurónico 50ml', 50, 2500.00),
(2, 'Serum Vitamina C', 'Serum antioxidante 30ml', 40, 3200.00),
(3, 'Mascarilla de Arcilla', 'Limpieza profunda de poros', 60, 1500.00),
(4, 'Aceite Esencial de Lavanda', 'Relajante muscular 50ml', 30, 1800.00),
(5, 'Exfoliante Corporal', 'Con sales marinas y miel', 45, 2100.00),
(6, 'Protector Solar FPS 50', 'Crema solar facial 50ml', 70, 2800.00),
(7, 'Crema Contorno de Ojos', 'Reduce bolsas y ojeras', 35, 3500.00),
(8, 'Tónico Facial', 'Equilibra el pH de la piel', 55, 1200.00),
(9, 'Gel Reductor', 'Tratamiento corporal reafirmante', 40, 2900.00),
(10, 'Esmalte Semipermanente', 'Varios colores, larga duración', 100, 800.00);


-- Tabla Aplicacion (Atencion)
CREATE TABLE Aplicacion (
    nroAplicacion INT PRIMARY KEY,
    codEst INT NOT NULL,
    codCliente INT NOT NULL,
    costoTotal DECIMAL(10, 2) NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (codEst) REFERENCES Esteticista(codEst),
    FOREIGN KEY (codCliente) REFERENCES Cliente(codCliente)
);

INSERT INTO Aplicacion (nroAplicacion, codEst, codCliente, costoTotal, fecha) VALUES
(1, 1, 1, 5700.00, '2023-10-01'),
(2, 2, 2, 1500.00, '2023-10-02'),
(3, 3, 3, 3900.00, '2023-10-03'),
(4, 4, 4, 2800.00, '2023-10-04'),
(5, 5, 5, 800.00, '2023-10-05'),
(6, 1, 6, 6700.00, '2023-10-06'),
(7, 2, 7, 2100.00, '2023-10-07'),
(8, 3, 8, 1200.00, '2023-10-08'),
(9, 4, 9, 5800.00, '2023-10-09'),
(10, 5, 10, 1600.00, '2023-10-10'),
(11, 1, 2, 2500.00, '2023-10-11'),
(12, 3, 4, 4700.00, '2023-10-12'),
(13, 2, 5, 3900.00, '2023-10-13'),
(14, 4, 7, 2800.00, '2023-10-14'),
(15, 5, 9, 800.00, '2023-10-15');


-- Tabla ProductoAplicado (Detalle de la aplicacion)
CREATE TABLE ProductoAplicado (
    nroAplicacion INT NOT NULL,
    codProd INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL, -- Precio del producto al momento de la aplicacion
    PRIMARY KEY (nroAplicacion, codProd),
    FOREIGN KEY (nroAplicacion) REFERENCES Aplicacion(nroAplicacion),
    FOREIGN KEY (codProd) REFERENCES Producto(codProd)
);

INSERT INTO ProductoAplicado (nroAplicacion, codProd, cantidad, precio) VALUES
-- Atencion 1: Crema + Serum
(1, 1, 1, 2500.00),
(1, 2, 1, 3200.00),
-- Atencion 2: Mascarilla
(2, 3, 1, 1500.00),
-- Atencion 3: Aceite + Exfoliante
(3, 4, 1, 1800.00),
(3, 5, 1, 2100.00),
-- Atencion 4: Protector Solar
(4, 6, 1, 2800.00),
-- Atencion 5: Esmalte
(5, 10, 1, 800.00),
-- Atencion 6: Serum + Contorno de Ojos
(6, 2, 1, 3200.00),
(6, 7, 1, 3500.00),
-- Atencion 7: Exfoliante
(7, 5, 1, 2100.00),
-- Atencion 8: Tonico
(8, 8, 1, 1200.00),
-- Atencion 9: Gel Reductor (x2)
(9, 9, 2, 2900.00),
-- Atencion 10: Esmalte (x2)
(10, 10, 2, 800.00),
-- Atencion 11: Crema
(11, 1, 1, 2500.00),
-- Atencion 12: Serum + Mascarilla
(12, 2, 1, 3200.00),
(12, 3, 1, 1500.00),
-- Atencion 13: Aceite + Exfoliante
(13, 4, 1, 1800.00),
(13, 5, 1, 2100.00),
-- Atencion 14: Protector Solar
(14, 6, 1, 2800.00),
-- Atencion 15: Esmalte
(15, 10, 1, 800.00);


-- ================================== Querys =====================================

-- "Listar para cada producto, la cantidad de aplicaciones en las que fue utilizado. Indicar nombre,
 -- descripcion, stock, precio y cantidad de aplicaciones. Ordenar por cantidad de aplicaciones"

SELECT P.nombreP, P.descripcion, P.stock, P.precio,
       COUNT(A.nroAplicacion) AS cantidad_aplicaciones
FROM Producto P
INNER JOIN ProductoAplicado A ON P.codProd = A.codProd
GROUP BY P.nombreP, P.descripcion, P.stock, P.precio
ORDER BY cantidad_aplicaciones DESC;


-- "Listar cada esteticista mostrando su nombre completo y el monto total recaudado. Ordenar por
  -- el monto recaudado de mayor a menor."

SELECT CONCAT(E.nombre, ' ', E.apellido) AS nombre_completo,
             SUM(A.costoTotal) AS total_recaudado
FROM Esteticista E
LEFT JOIN Aplicacion A ON E.codEst = A.codEst
GROUP BY E.codEst, E.nombre, E.apellido
ORDER BY total_recaudado DESC;


-- "Actualizar el precio de los productos de nombre 'tintura' incrementando 20% su valor actual"

UPDATE Producto
SET precio = precio * 1.20
WHERE nombreP = '%Gel Reductor%';


-- "Listar informacion de productos utilizados en las aplicaciones realizadas al cliente con DNI: 38329663."

SELECT P.codProd, P.nombreP, P.descripcion, P.stock, P.precio
FROM Producto P
INNER JOIN ProductoAplicado PA ON P.codProd = PA.codProd
INNER JOIN Aplicacion A ON PA.nroAplicacion = A.nroAplicacion
INNER JOIN Cliente C ON A.codCliente = C.codCliente
WHERE C.DNI = '33667788';


-- "Mostrar el cliente que mas dinero gasto en total, incluyendo su nombre, DNI y el monto total."

SELECT C.nombreYAp, C.DNI, SUM(A.costoTotal) AS total_gastado
FROM Cliente C
INNER JOIN Aplicacion A ON C.codCliente = A.codCliente
GROUP BY C.codCliente, C.nombreYAp, C.DNI
ORDER BY total_gastado DESC
LIMIT 1;