select sub.fecha_contratacion, sub."contratados" from(
  select fecha_contratacion, count(id_empleado) as "contratados" from JVARGAS.empleado
  group by fecha_contratacion) sub
where sub."contratados" > 15;

select depart.id_departamento,nombre_departamento from JVARGAS.departamento
inner join (
  select id_departamento from JVARGAS.empleado
  where por_comision != 0
  group by id_departamento ) depart
on depart.id_departamento = JVARGAS.departamento.id_departamento;

select JVARGAS.historial_puesto.id_empleado,nombre ,apellido, fecha_inicio from JVARGAS.historial_puesto
inner join JVARGAS.empleado on JVARGAS.historial_puesto.id_empleado = JVARGAS.empleado.id_empleado
where extract(year from fecha_inicio) = extract(year from sysdate);

select nombre, apellido, (trunc(sysdate) - trunc(fecha_contratacion)) as  "DIAS" from JVARGAS.empleado;
