
CREATE DATABASE ejerciciorobin;
SHOW DATABASES;
USE ejerciciorobin;
SHOW TABLES;
CREATE TABLE cliente(
	id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50),
	email VARCHAR(50),
	telefono VARCHAR(15)
);

CREATE TABLE categoria(
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
	nombre_categoria VARCHAR(50)
);

CREATE TABLE medicamento(
	id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
	nombre_medicamento VARCHAR(50),
	id_categoria INT,
	FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

ALTER TABLE cliente
MODIFY nombre VARCHAR(50) NOT NULL,
MODIFY email VARCHAR(50) NOT NULL,
MODIFY telefono VARCHAR(15) NOT NULL,
ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE categoria
MODIFY nombre_categoria VARCHAR(50) NOT NULL,
ADD CONSTRAINT unique_categoria UNIQUE (nombre_categoria);

ALTER TABLE medicamento
MODIFY nombre_medicamento VARCHAR(50) NOT NULL,
ADD CONSTRAINT unique_medicamento UNIQUE (nombre_medicamento);

CREATE TABLE factura(
	id_factura INT AUTO_INCREMENT PRIMARY KEY,
	id_cliente INT,
	fecha DATE NOT NULL,
	nro_factura VARCHAR(15) UNIQUE NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE detalle_factura(
	id_detalle_factura INT AUTO_INCREMENT PRIMARY KEY,
	precio_unitario INT NOT NULL,
	cantidad DECIMAL(10,2) NOT NULL,
	id_factura INT,
	id_medicamento INT,
	FOREIGN KEY (id_factura) REFERENCES factura(id_factura),
	FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento)
);

ALTER TABLE detalle_Factura
MODIFY COLUMN cantidad INT NOT NULL;
DESCRIBE detalle_factura;

CREATE TABLE pago(
	id_pago INT AUTO_INCREMENT PRIMARY KEY,
	id_factura INT UNIQUE,
	estado ENUM('pendiente','pagada') NOT NULL,
	metodo_pago VARCHAR(20) NOT NULL,
	total_linea DECIMAL(10,2) NOT NULL,
	FOREIGN KEY (id_factura) REFERENCES factura(id_factura)
);

SELECT * FROM cliente;
SELECT * FROM factura;
SELECT * FROM detalle_factura;