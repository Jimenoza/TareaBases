
select extract(year from sysdate) as only_day from dual;
select * from EMPLEADO;


-- numero 6
select E.Nombre from empleado E 
where  
    extract(year from sysdate) - extract( year from fecha_contratacion)> 1 
    and E.SALARIO > 10000;

-- numero 7
select P.TITULO_PUESTO from puesto P
    inner join HISTORIAL_PUESTO H
        on H.ID_PUESTO=P.ID_PUESTO
    where extract(year from sysdate) - extract( year from H.FECHA_INICIO) <= 1;

-- numero 8 
-- editar el numero 3 por algun otro numero especificado
select L.Direccion, L.ciudad, L.provincia, P.NOMBRE_PAIS, count(E.ID_EMPLEADO) as CantidadEmpleados from EMPLEADO E
    inner join DEPARTAMENTO D
        on D.ID_DEPARTAMENTO=E.ID_DEPARTAMENTO
    inner join LOCALIZACION L 
        on L.ID_LOCALIZACION=D.ID_LOCALIZACION
    inner join PAIS P
        on L.ID_PAIS=P.ID_PAIS
    group by L.Direccion, L.ciudad, L.provincia, P.NOMBRE_PAIS
    having count(E.ID_EMPLEADO) < 3;
    
-- numero 9
-- editar el numero 3 por algun otro numero
select H.nombre, Empleados from (select E.ID_GERENTE, count(ID_GERENTE) as Empleados from EMPLEADO E
    group by E.ID_GERENTE) E
    inner join Empleado H 
        on H.ID_EMPLEADO=E.ID_GERENTE
    where Empleados > 3;
        