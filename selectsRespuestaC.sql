
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

select D.NOMBRE_DEPARTAMENTO, count(E.ID_EMPLEADO) as CantidadEmpleados from EMPLEADO E
    inner join DEPARTAMENTO D
        on D.ID_DEPARTAMENTO=E.ID_DEPARTAMENTO
    group by D.NOMBRE_DEPARTAMENTO;

select L.Direccion, L.ciudad, L.provincia, count(E.ID_EMPLEADO) as CantidadEmpleados from EMPLEADO E
    inner join DEPARTAMENTO D
        on D.ID_DEPARTAMENTO=E.ID_DEPARTAMENTO
    inner join LOCALIZACION L 
        on L.ID_LOCALIZACION=D.ID_LOCALIZACION
    group by L.provincia;