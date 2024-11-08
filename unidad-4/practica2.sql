/*Practica 2: Manipulación de los modos de operación*/

-- Se consulta el modo de operación actual:
select @@sql_mode;

select @@global.sql_mode;

-- Cambia de modo de operación traditional y muestra los resultados:
set sql_mode='traditional';
select @@sql_mode;

-- Se cambia a modo de operación 'ansi' y muestra resultados:
set sql_mode='ansi';
select @@sql_mode;

-- Se cambia a modo de operación 'strict_trans_tables':
set sql_mode='strict_trans_tables';
select @@sql_mode;

-- Se restablece a modo normal:
select sql_mode='';
select @@sql_mode;

-- Mostramos la cantidad de variables con show variables:
show variables;

-- Mostramos la cantidad de variables globales:
show global variables;

-- También podemos mostrar por partes con show variables like ‘have%’;:
show variables like 'have%';