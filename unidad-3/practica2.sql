/*Practica 2: Particionado de tablas en mysql*/

-- Muestra las bases de datos:
Show databases;

-- Poner en uso la Base de datos agencia:
Use agencia;

-- Crear la tabla de reportes;
CREATE TABLE reports (
id int(10) NOT NULL AUTO_INCREMENT,
date datetime NOT NULL,
report TEXT,
PRIMARY KEY (id,date)
) ENGINE=InnoDB;

-- particionar con la siguiente instrucción:
ALTER TABLE reports PARTITION BY RANGE(TO_DAYS(date)) (
    PARTITION p201111 VALUES LESS THAN (TO_DAYS("2011-12-01")),
    PARTITION p201112 VALUES LESS THAN (TO_DAYS("2012-01-01")),
    PARTITION p201201 VALUES LESS THAN (TO_DAYS("2012-02-01")),
    PARTITION p201202 VALUES LESS THAN (TO_DAYS("2012-03-01")),
    PARTITION p201203 VALUES LESS THAN (TO_DAYS("2012-04-01")),
    PARTITION p201204 VALUES LESS THAN (TO_DAYS("2012-05-01")),
    PARTITION p201205 VALUES LESS THAN (TO_DAYS("2012-06-01")),
    PARTITION pdefault VALUES LESS THAN MAXVALUE
);

-- Borrar la partición más antigua con la siguiente instrucción:
ALTER TABLE reports DROP PARTITION p201111;

-- Añadir las siguientes particiones:
ALTER TABLE reports REORGANIZE PARTITION pdefault INTO (
    PARTITION p201206 VALUES LESS THAN (TO_DAYS("2012-07-01")),
    PARTITION pdefault VALUES LESS THAN MAXVALUE
);

-- Consultar información de particiones creadas en una tabla, así como también los registros que contiene cada una:
SELECT PARTITION_NAME, TABLE_ROWS 
FROM information_schema.PARTITIONS 
WHERE TABLE_NAME = 'reports';