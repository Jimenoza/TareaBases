CREATE USER JVARGAS
IDENFIED BY 1234
TEMPORARY TABLESPACE temp
DEFAULT TABLESPACE GRUPO7_TBL

create TABLESPACE GRUPO7_TBL
datafile _LUGAR_
EXTENT MANAGEMENT LOCAL
blocksize 8k
autoextend off;

create TABLESPACE GRUPO7_IDX
datafile _LUGAR_
EXTENT MANAGEMENT LOCAL
blocksize 8k
autoextend off;

create USER EPEREZ
IDENFIED BY 1234
TEMPORARY TABLESPACE temp
DEFAULT TABLESPACE GRUPO7_TBL

create USER LPMONGE
IDENFIED BY 1234
TEMPORARY TABLESPACE temp
DEFAULT TABLESPACE GRUPO7_TBL

CREATE USER GASTORGA
IDENFIED BY 1234
TEMPORARY TABLESPACE temp
DEFAULT TABLESPACE GRUPO7_TBL

create table EMPLEADO (ID_EMPLEADO NUMBER(10) GENERATED BY DEFAULT AS IDENTITY (START WITH 1000000000 INCREMENT BY 1),
NOMBRE VARCHAR2(25) NOT NULL,
APELLIDO VARCHAR2(20) NOT NULL,
EMAIL VARCHAR2(50) NOT NULL,
TELEFONO NUMBER(8) NOT NULL,
FECHA_CONTRATACION DATE,
SALARIO NUMBER(20,2),
POR_COMISION NUMBER(3),
CONSTRAINT PK_ID_EMPLEADO PRIMARY KEY (ID_EMPLEADO)
CONSTRAINT FK_ID_PUESTO FOREIGN KEY (ID_PUESTO) REFERENCES PUESTO(ID_PUESTO)
CONSTRAINT FK_ID_GERENTE FOREIGN KEY (ID_GERENTE) REFERENCES EMPLEADO(ID_GERENTE)
CONSTRAINT FK_ID_DEPT FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES DEPARTAMENTO(ID_DEPARTAMENTO)
)

create table DEPARTAMENTO (ID_DEPARTAMENTO NUMBER(4) GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1),
NOMBRE_DEPARTAMENTO VARCHAR2(25) NOT NULL,
CONSTRAINT PK_ID_DEPARTAMENTO PRIMARY KEY (ID_DEPARTAMENTO)
CONSTRAINT FK_ID_GERENTE FOREIGN KEY (ID_GERENTE) REFERENCES PUESTO(ID_GERENTE)
CONSTRAINT FK_ID_LOCALIZACION FOREIGN KEY (ID_LOCALIZACION) REFERENCES PUESTO(ID_LOCALIZACION)
)

create table PUESTO (ID_PUESTO NUMBER(3) GENERATED BY DEFAULT AS IDENTITY (START WITH 100 INCREMENT BY 1),
TITULO_PUESTO VARCHAR2(30) NOT NULL,
SALARIO_MIN NUMBER(20) NOT NULL,
SALARIO_MAX NUMBER(20) NOT NULL,
CONSTRAINT PK_ID_PUESTO PRIMARY KEY (ID_PUESTO)
)

create table HISTORIAL_PUESTO (FECHA_INICIO DATE,
CONSTRAINT FK_ID_EMPLEADO FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADO(ID_EMPLEADO)
CONSTRAINT FK_ID_DEPT FOREIGN KEY (ID_DEPARTAMENTO) REFERENCES DEPARTAMENTO(ID_DEPARTAMENTO)
CONSTRAINT FK_ID_PUESTO FOREIGN KEY (ID_PUESTO) REFERENCES PUESTO(ID_PUESTO)
)

create table LOCALIZACION (ID_LOCALIZACION NUMBER(7) GENERATED BY DEFAULT AS IDENTITY (START WITH 1000000 INCREMENT BY 1),
DIRECCION VARCHAR2(50) NOT NULL,
CODIGO_POSTAL NUMBER(5),
CIUDAD VARCHAR2(10),
PROVINCIA VARCHAR2(10) NOT NULL,
CONSTRAINT PK_ID_LOCALIZACION PRIMARY KEY (ID_LOCALIZACION)
CONSTRAINT FK_ID_PAIS FOREIGN KEY (ID_PAIS) REFERENCES PAIS(ID_PAIS)
)

create table PAIS(ID_PAIS NUMBER(3) GENERATED BY DEFAULT AS IDENTITY (START WITH 100 INCREMENT BY 1),
NOMBRE_PAIS VARCHAR2(30) NOT NULL,
CONSTRAINT PK_ID_PAIS PRIMARY KEY (ID_PAIS)
CONSTRAINT FK_ID_REGION FOREIGN KEY (ID_REGION) REFERENCES REGION(ID_REGION)
)

create table REGION(ID_REGION NUMBER(3) GENERATED BY DEFAULT AS IDENTITY (START WITH 100 INCREMENT BY 1),
NOMBRE_REGION VARCHAR2(20) NOT NULL,
CONSTRAINT PK_ID_REGION PRIMARY KEY (ID_REGION)
)
tablespace GRUPO7_TBL

create role ROL_EJECUTA
create role ROL_NOVATO
create role ROL_SUPERIOR

--GRANT execute ON sp TO ROL_EJECUTA AQUI SE PONEN TODOS LOS SP CREADOS
GRANT select, insert EMPLEADO TO ROL_NOVATO
GRANT update PAIS TO ROL_NOVATO
GRANT select HISTORIAL_PUESTO TO ROL_NOVATO
GRANT all ON EMPLEADO TO ROL_SUPERIOR
GRANT all ON DEPARTAMENTO TO ROL_SUPERIOR
GRANT all ON PUESTO TO ROL_SUPERIOR
GRANT all ON HISTORIAL_PUESTO TO ROL_SUPERIOR
GRANT all ON REGION TO ROL_SUPERIOR
GRANT all ON PAIS TO ROL_SUPERIOR
GRANT all ON LOCALIZACION TO ROL_SUPERIOR
GRANT ROL_SUPERIOR TO JVARGAS
GRANT ROL_SUPERIOR TO EPEREZ
GRANT ROL_SUPERIOR TO LPMONGE
GRANT ROL_SUPERIOR TO GASTORGA
