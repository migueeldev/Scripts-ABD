/*Practica 3: Creacion de una bitacora usando Triggers en mysql */

/*CREACION DE LA BASE DE DATOS CONTROL*/

-- Se creo la base de datos Control
CREATE DATABASE control;

-- Se pone en uso la base de datos
use control; 

-- Se creo la tabla Articulos
CREATE TABLE articulos (
    id_articulo INT(20) NOT NULL PRIMARY KEY,
    nombre_articulo VARCHAR(20),
    precio VARCHAR(20)
) ENGINE=InnoDB;

-- Se creo la tabla Bitacora
CREATE TABLE bitacora (
    id_bitacora INT(30) AUTO_INCREMENT PRIMARY KEY,
    id_articulo INT(20),
    nombre_nuevo VARCHAR(20),
    nombre_viejo VARCHAR(20),
    precio_nuevo VARCHAR(20),
    precio_viejo VARCHAR(20),
    usuario VARCHAR(30),
    fecha DATETIME,
    accion VARCHAR(15)
) ENGINE=InnoDB;

/*CRECION DE LOS TRIGGERS*/

/*Trigger para capturar datos al insertar en articulos
Este trigger guardará automáticamente un registro en la tabla bitacora cada vez que se inserte un nuevo artículo.*/
CREATE TRIGGER insertar
AFTER INSERT ON articulos
FOR EACH ROW
INSERT INTO bitacora (id_articulo, nombre_nuevo, precio_nuevo, usuario, fecha, accion) 
VALUES (NEW.id_articulo, NEW.nombre_articulo, NEW.precio, USER(), NOW(), 'Inserto');

/*Trigger para capturar datos al actualizar articulos
Este trigger registrará los datos antiguos y nuevos en la tabla bitacora cada vez que se actualice un artículo.*/
CREATE TRIGGER actualizar
AFTER UPDATE ON articulos
FOR EACH ROW
INSERT INTO bitacora (id_articulo, nombre_nuevo, nombre_viejo, precio_nuevo, precio_viejo, usuario, fecha, accion) 
VALUES (OLD.id_articulo, NEW.nombre_articulo, OLD.nombre_articulo, NEW.precio, OLD.precio, USER(), NOW(), 'Modifico');

/*Trigger para capturar datos al eliminar en articulos
Este trigger guardará automáticamente en la tabla bitacora los datos del artículo eliminado.*/
CREATE TRIGGER eliminar
AFTER DELETE ON articulos
FOR EACH ROW
INSERT INTO bitacora (id_articulo, nombre_viejo, precio_viejo, usuario, fecha, accion) 
VALUES (OLD.id_articulo, OLD.nombre_articulo, OLD.precio, USER(), NOW(), 'Elimino');

/*COMPROBACION*/

-- Se creo usuario pedro en localhost:
CREATE USER 'pedro'@'localhost' IDENTIFIED BY '123';

-- Se otorgan todos los privilegios al usuario pedro sobre la base de datos control:
GRANT ALL ON control.* TO 'pedro'@'localhost';

-- Se Actualizan los privilegios asignados:
FLUSH PRIVILEGES;

/* Se accede a MySQL con el usuario pedro:
mysql -u pedro -p
CONTRASEÑA: 123*/

-- Se pone en uso la base de datos:
USE control;

-- Inserta un nuevo registro en la tabla articulos para probar el trigger de inserción:
INSERT INTO articulos VALUES ('05', 'Computadora', '$20,000.00');

-- Verifica la tabla bitacora para confirmar que el trigger se ejecutó:
SELECT * FROM bitacora;

-- Modifica el registro insertado para probar el trigger de actualización:
UPDATE articulos SET nombre_articulo='Lap-top', precio='$15,000.00' WHERE id_articulo='05';

-- Consulta nuevamente la tabla bitacora para corroborar que los datos del nombre y precio anterior se almacenaron:
SELECT * FROM bitacora;

-- Elimina el registro para probar el trigger de eliminación:
DELETE FROM articulos WHERE id_articulo='05';

-- Consulta una vez más la tabla bitacora para confirmar que se guardaron los datos del artículo eliminado:
SELECT * FROM bitacora;
