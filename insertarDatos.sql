insert into PUESTO (SALARIO_MAX, SALARIO_MIN, TITULO_PUESTO) values (3000, 6000, 'Miscelaneo');
insert into PUESTO (SALARIO_MAX, SALARIO_MIN, TITULO_PUESTO) values (10000, 12000, 'Ingeniero Computacion');
insert into PUESTO (SALARIO_MAX, SALARIO_MIN, TITULO_PUESTO) values (6000, 12000, 'Gerente');
insert into PUESTO (SALARIO_MAX, SALARIO_MIN, TITULO_PUESTO) values (6000, 15000, 'Administrador');
insert into PUESTO (SALARIO_MAX, SALARIO_MIN, TITULO_PUESTO) values (5000, 8000, 'Asistente');

insert into REGION (NOMBRE_REGION) values ('Latinoamerica');
insert into REGION (NOMBRE_REGION) values ('Europa Central');
insert into REGION (NOMBRE_REGION) values ('Norteamerica');
insert into REGION (NOMBRE_REGION) values ('Sudamerica');
insert into REGION (NOMBRE_REGION) values ('Centroamerica');
insert into REGION (NOMBRE_REGION) values ('Europa Oriental');

insert into PAIS (ID_REGION, NOMBRE_PAIS)
select (select R.ID_REGION from REGION R where NOMBRE_REGION = 'Norteamerica'), 'USA' 
from dual;

insert into PAIS (ID_REGION, NOMBRE_PAIS)
select (select R.ID_REGION from REGION R where NOMBRE_REGION = 'Centroamerica'), 'Costa Rica' 
from dual;

insert into PAIS (ID_REGION, NOMBRE_PAIS)
select (select R.ID_REGION from REGION R where NOMBRE_REGION = 'Norteamerica'), 'Canada' 
from dual;

insert into PAIS (ID_REGION, NOMBRE_PAIS)
select (select R.ID_REGION from REGION R where NOMBRE_REGION = 'Sudamerica'), 'Argentina' 
from dual;

insert into PAIS (ID_REGION, NOMBRE_PAIS)
select (select R.ID_REGION from REGION R where NOMBRE_REGION = 'Sudamerica'), 'Brazil' 
from dual;

insert into LOCALIZACION (PROVINCIA, CIUDAD, CODIGO_POSTAL, DIRECCION, ID_PAIS)
select 'San Jose', 'San Jose', 10801, 'por el arbol',(select ID_PAIS from PAIS where NOMBRE_PAIS = 'Costa Rica')
from dual;

insert into LOCALIZACION (PROVINCIA, CIUDAD, CODIGO_POSTAL, DIRECCION, ID_PAIS)
select 'Sao Paulo', 'Novinha', 10801, 'Tauro',(select ID_PAIS from PAIS where NOMBRE_PAIS = 'Brazil')
from dual;

insert into LOCALIZACION (PROVINCIA, CIUDAD, CODIGO_POSTAL, DIRECCION, ID_PAIS)
select 'New York', 'Soho', 12374, '3rd street',(select ID_PAIS from PAIS where NOMBRE_PAIS = 'USA')
from dual;

insert into LOCALIZACION (PROVINCIA, CIUDAD, CODIGO_POSTAL, DIRECCION, ID_PAIS)
select 'Messi', 'Messi', 10301, 'por el arbol',(select ID_PAIS from PAIS where NOMBRE_PAIS = 'Argentina')
from dual;



insert into DEPARTAMENTO (ID_GERENTE, ID_LOCALIZACION, NOMBRE_DEPARTAMENTO) values (1, 1000001, 'Computacion');
insert into DEPARTAMENTO (ID_GERENTE, ID_LOCALIZACION, NOMBRE_DEPARTAMENTO) values (1, 1000000, 'Limpieza');
insert into DEPARTAMENTO (ID_GERENTE, ID_LOCALIZACION, NOMBRE_DEPARTAMENTO) values (1, 1000003, 'Administracion');
insert into DEPARTAMENTO (ID_GERENTE, ID_LOCALIZACION, NOMBRE_DEPARTAMENTO) values (1, 1000002, 'Gerencia');



insert into EMPLEADO (ID_EMPLEADO, NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_CONTRATACION,
SALARIO, POR_COMISION, ID_PUESTO, ID_GERENTE, ID_DEPARTAMENTO)
values (1, 'Juan', 'Carlos', 'mucho@hotmail.com', 28832222, 
TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 12500, 10, 106, 1, 100);

insert into EMPLEADO (NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_CONTRATACION,
SALARIO, POR_COMISION, ID_PUESTO, ID_GERENTE, ID_DEPARTAMENTO)
values ('Juan1', 'Carlos', 'mucho@hotmail.com', 28832222, 
TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 6000, 0, 108, 1, 100);

insert into EMPLEADO (NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_CONTRATACION,
SALARIO, POR_COMISION, ID_PUESTO, ID_GERENTE, ID_DEPARTAMENTO)
values ('Juan2', 'Carlos', 'mucho@hotmail.com', 28832222, 
TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 9000, 10, 107, 1, 100);

insert into EMPLEADO (NOMBRE, APELLIDO, EMAIL, TELEFONO, FECHA_CONTRATACION,
SALARIO, POR_COMISION, ID_PUESTO, ID_GERENTE, ID_DEPARTAMENTO)
values ('Juan3', 'Carlos', 'mucho@hotmail.com', 28832222, 
TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), 12500, 10, 106, 1, 100);



select * from Puesto;
select * from LOCALIZACION;
select * from REGION;