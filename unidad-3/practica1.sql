/*Practica 1: Resolución a problemas de configuración
de espacios en disco*/

-- Se creo la base de datos AgenciaResguardo
CREATE DATABASE AgenciaResguardo;

USE AgenciaResguardo;

-- Se creo la tabla Coche:
CREATE TABLE Coche (
    matricula VARCHAR(15) PRIMARY KEY,
    modelo VARCHAR(10) NOT NULL,
    marca VARCHAR(20)
);

-- Se ingresaron 5 registros en la tabla Coche:
INSERT INTO Coche (matricula, modelo, marca) VALUES 
('ABC1234', 'Sedan', 'Toyota'),
('DEF5678', 'SUV', 'Ford'),
('GHI9101', 'Compacto', 'Honda'),
('JKL2345', 'Pickup', 'Chevrolet'),
('MNO6789', 'Coupe', 'Nissan');

-- Se creo la tabla Agencia:
CREATE TABLE Agencia (
    cod_a VARCHAR(11) PRIMARY KEY
);

-- Se ingresaron 5 registros en la tabla Agencia:
INSERT INTO Agencia (cod_a) VALUES
('AG001234567'),
('AG002345678'),
('AG003456789'),
('AG004567890'),
('AG005678901');

-- Se creo la tabla Garaje:
CREATE TABLE Garaje (
    cod_g VARCHAR(11) PRIMARY KEY
);

-- Se ingresaron 5 registros en la tabla Garaje:
INSERT INTO Garaje (cod_g) VALUES
('GR001234567'),
('GR002345678'),
('GR003456789'),
('GR004567890'),
('GR005678901');

-- Se creo la tabla Cliente:
CREATE TABLE Cliente (
    cliente VARCHAR(10) PRIMARY KEY,
    direccion VARCHAR(20),
    nombre VARCHAR(20)
);

-- Se ingresaron 5 registros en la tabla Cliente:
INSERT INTO Cliente (cliente, direccion, nombre) VALUES
('CL001', 'Calle 1 #123', 'Juan Pérez'),
('CL002', 'Avenida 2 #456', 'Ana Gómez'),
('CL003', 'Calle 3 #789', 'Luis Martínez'),
('CL004', 'Boulevard 4 #101', 'María López'),
('CL005', 'Calle 5 #202', 'Carlos Ruiz');

-- Se creo la tabla Reserva:
CREATE TABLE Reserva (
    cod_r VARCHAR(14) PRIMARY KEY,
    precio int(5),
    indicador VARCHAR(10)
);

-- Se ingresaron 5 registros en la tabla Reserva: 
INSERT INTO Reserva (cod_r, precio, indicador) VALUES
('RSV0000000001', 500, 'Confirmado'),
('RSV0000000002', 750, 'Pendiente'),
('RSV0000000003', 300, 'Cancelado'),
('RSV0000000004', 450, 'Confirmado'),
('RSV0000000005', 600, 'Pendiente');