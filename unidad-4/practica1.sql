/*Practica 1: Verifica archivos log verificando buen funcionamiento*/

-- Mostramos la variables log:
show variables like '%log%';

show variables like '%general_log%';

-- Se observa el contenido de archivo log que utiliza mysql:
describe mysql.general_log;

-- Se uso la base de datos Agencia, y se activo la función del archivo log(general_log):
use AgenciaResguardo;

set global general_log=ON;

-- Se especifica la función del archivo log (general_log) guardara su información a manera de tabla para poder acceder a ella:
set global log_output='table';

-- Se realiza acciones de consulta e inserción de valores:
show tables;

describe Cliente;

select*from Cliente;

-- Se reviso las acciones de archivo log(general_log):
select*from mysql.general_log;

select*from mysql.general_log order by event_time desc limit 5;

-- Se regresa al estatus del archivo log a off:
set global general_log=OFF;