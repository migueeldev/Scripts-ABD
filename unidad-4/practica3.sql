/*Practica 3: Uso y aplicación de índices*/

-- Muestra la base de datos agencia
SHOW DATABASES;

-- Pon en uso la base de datos agencia
USE agencia;

-- Muestra las tablas
SHOW TABLES;

-- Ver la información de la tabla cliente
DESCRIBE Cliente;

-- Crear un índice de clave primaria para el campo dirección de la tabla cliente
-- Nota: Una tabla no puede tener dos claves primarias, así que debes eliminar la clave primaria actual antes de hacerlo.
ALTER TABLE Cliente DROP PRIMARY KEY; 
ALTER TABLE Cliente ADD PRIMARY KEY (direccion);

-- Crear un índice único para el campo nombre de la tabla cliente
CREATE UNIQUE INDEX idx_nombre_cliente ON Cliente(nombre);

-- Crear un índice ordinario para el campo indicador de la tabla reserva
CREATE INDEX idx_indicador_reserva ON Reserva(indicador);

-- Eliminar el índice del campo nombre de la tabla cliente
DROP INDEX idx_nombre_cliente ON Cliente;


-- Se creo una base de datos biblioteca y se pone en uso
CREATE DATABASE biblioteca;
USE biblioteca;

-- Se creo la tabla libros con índice PRIMARY KEY
CREATE TABLE libros (
    codigo INT AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    PRIMARY KEY (codigo)
);

-- Se Muestran los índices de la tabla libros
SHOW INDEX FROM libros;

-- Se Creo un segundo índice único en el campo titulo y se muestran índices
CREATE UNIQUE INDEX idx_titulo_libro ON libros(titulo);
SHOW INDEX FROM libros;

-- Se Creo otro índice único en el campo autor y se muestran índices
CREATE UNIQUE INDEX idx_autor_libro ON libros(autor);
SHOW INDEX FROM libros;

-- Se creo tabla usuarios con los siguientes campos:
CREATE TABLE usuarios (
    control INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    domicilio VARCHAR(255) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    PRIMARY KEY (control)
);

-- Se crearon los índices ordinarios en ciudad y estado, y se muestran
CREATE INDEX idx_ciudad_usuario ON usuarios(ciudad);
CREATE INDEX idx_estado_usuario ON usuarios(estado);
SHOW INDEX FROM usuarios;

-- Se Creo un índice único en domicilio y se muestran índices
CREATE UNIQUE INDEX idx_domicilio_usuario ON usuarios(domicilio);
SHOW INDEX FROM usuarios;

-- Se Borro el siguiente índice ordinario
ALTER TABLE usuarios DROP INDEX idx_ciudad_usuario;
SHOW INDEX FROM usuarios;

