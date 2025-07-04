CREATE SCHEMA tienda_zapatillas;
USE tienda_zapatillas;
CREATE TABLE zapatillas(
	id_zapatilla INT AUTO_INCREMENT,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR (45) NOT NULL,
	PRIMARY KEY (id_zapatilla)
    );
CREATE TABLE clientes(
	id_cliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    cuidad VARCHAR(45),
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL
    );
CREATE TABLE empleados(
	id_empleados INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR (45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE NOT NULL
    );
CREATE TABLE facturas(
	id_factura INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla INT NOT NULL,
    id_empleados INT NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_zapatilla
		FOREIGN KEY (id_zapatilla) REFERENCES zapatillas(id_zapatilla),
	CONSTRAINT fk_empleado
		FOREIGN KEY (id_empleados) REFERENCES empleados(id_empleados),
	CONSTRAINT fk_cliente
		FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    );