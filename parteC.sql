select sub.fecha_contratacion, sub."contratados" from(
  select fecha_contratacion, count(id_empleado) as "contratados" from JVARGAS.empleado
  group by fecha_contratacion) sub
where sub."contratados" > 15;
