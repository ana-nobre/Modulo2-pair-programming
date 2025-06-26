-- SET SQL_SAFE_UPDATES = 0;
-- ALTER TABLE empleadas AUTO_INCREMENT = 100;

-- Crear la base de datos
CREATE SCHEMA `tienda_zapatillas`;

-- Seleccionar la base de datos para usarla
USE `tienda_zapatillas`;

-- Tabla Zapatillas
CREATE TABLE Zapatillas (
    id_zapatilla INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL
);

-- Tabla Clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45),
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL
);

-- Tabla Empleados
CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE NOT NULL
);

-- Tabla Facturas
CREATE TABLE Facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla INT NOT NULL,
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
    -- Definir las claves foráneas
    CONSTRAINT fk_facturas_zapatillas FOREIGN KEY (id_zapatilla) REFERENCES Zapatillas(id_zapatilla),
    CONSTRAINT fk_facturas_empleados FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado),
    CONSTRAINT fk_facturas_clientes FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla Zapatillas:
-- Se nos ha olvidado introducir la marca y la talla de las zapatillas que tenemos en nuestra BBDD. 
-- Por lo tanto, debemos incluir:
-- marca: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
-- talla: es un entero, no nulo.

ALTER TABLE Zapatillas
ADD COLUMN marca VARCHAR(45) NOT NULL,
ADD COLUMN talla INT  NOT NULL;

SELECT*FROM Zapatillas;

-- Tabla Empleados
-- salario: es un entero, no nulo. 
-- Pero puede que el salario de nuestros empleados tenga decimales, por lo que le cambiaremos el tipo a decimal.

ALTER TABLE Empleados
MODIFY COLUMN salario INT; -- se cambio a INT al final del ejercicio para concluir los ejercicios finales.

SELECT*FROM Empleados;

-- Tabla Clientes
-- pais: la hemos incluido en la tabla pero nuestro negocio solo distribuye a España, por lo que es una columna que no hará falta. 
-- La eliminaremos.

ALTER TABLE Clientes
DROP COLUMN pais;

SELECT*FROM Clientes;

-- Tabla Facturas:
-- total: madre mía!!! Se nos ha olvidado incluir el total de la cada factura generada😨!
-- Creemos esa columna con un tipo de datos decimal.

ALTER TABLE Facturas
ADD COLUMN total FLOAT;

SELECT*FROM Facturas;

-- Lo primero que vamos a hacer es insertar datos en nuestra BBDD con los siguientes datos:
-- Tabla Zapatillas

INSERT INTO Zapatillas(id_zapatilla, modelo, color, marca, talla)VALUES
(1, 'XQYUN', 'Negro', 'Nike', 42),
(2, 'UOPMN', 'Rosas', 'Nike', 39),
(3, 'OPNYT', 'Verdes', 'Adidas', 35);

-- Tabla Empleados
INSERT INTO Empleados(id_empleado, nombre, tienda, salario, fecha_incorporacion)VALUES
(1, 'Laura', 'Alcobendas', '25987', '2010/09/03'),
(2, 'Maria', 'Sevilla', NULL, '2001/04/11'),
(3, 'Ester', 'Oviedo', '3016598', '2000/11/29');

-- Tabla Clientes
INSERT INTO Clientes(id_cliente, nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)VALUES
(1, 'Monica', '123456789', 'monica@email.com', 'Calle Felicidad', 'Móstoles', 'Madrid', '28176'),
(2, 'Lorena', '289345678', 'lorena@email.com', 'Calle Alegria', 'Barcelona', 'Barcelona', 12346),
(3, 'Carmen', '298463759', 'carmen@email.com', 'Calle del Color', 'Vigo', 'Pontevedra', '23456');

-- Tabla Facturas
INSERT INTO Facturas(id_factura, numero_factura, fecha, id_zapatilla, id_empleado, id_cliente, total)VALUES
(1, 123, '2001/12/11', 1, 2, 1, 54.98),
(2, 1234, '2005/05/23', 1, 1, 3, 89.91),
(3, 12345, '2015/09/18', 2, 3, 3, 76.23);

-- De nuevo nos hemos dado cuenta que hay algunos errores en la inserción de datos. 
-- En este ejercicios los actualizaremos para que nuestra BBDD este perfecta.
-- Tabla zapatillas
-- En nuestra tienda no vendemos zapatillas Rosas... ¿Cómo es posible que tengamos zapatillas de color rosa? 
-- 🤔 En realidad esas zapatillas son amarillas.
UPDATE Zapatillas
SET color = 'amarillas'
WHERE id_zapatilla = 2;

SELECT*FROM Zapatillas;

-- Tabla empleados
-- Laura se ha cambiado de ciudad y ya no vive en Alcobendas, se fue cerquita del mar, ahora vive en A Coruña.
UPDATE Empleados
SET tienda = 'A Coruña'
WHERE id_empleado = 1;

SELECT*FROM Empleados;

-- Tabla clientes
-- El Numero de teléfono de Monica esta mal!!! Metimos un dígito de más. En realidad su número es: 123456728
UPDATE Clientes
SET numero_telefono = '123456728'
WHERE id_cliente = 1;

SELECT*FROM Clientes;
-- Tabla facturas
-- El total de la factura de la zapatilla cuyo id es 2 es incorrecto. En realidad es: 89,92.

UPDATE Facturas
SET total = 89.92
WHERE id_factura = 2;

SELECT*FROM Facturas;
