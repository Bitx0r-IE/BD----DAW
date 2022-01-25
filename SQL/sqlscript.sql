REM   Script: Academiaingles-DDL-DML
REM   Ejercicio_00_SQL

CREATE TABLE niveles
(
  cod number(2) CONSTRAINT niv_cod_pk PRIMARY KEY,
  Nombre varchar2(20) NOT NULL,
  Titulo varchar(1) CONSTRAINT niv_titulo_ck CHECK(Titulo IN ('S', 'N')),
  Homologado_oposicion varchar2(1) NULL
);

CREATE TABLE profesores
(
  Id number(2) CONSTRAINT prof_id_pk PRIMARY KEY,
  DNI varchar2(9) NOT NULL CONSTRAINT prof_dni_uk UNIQUE,
  nombre varchar2(30)
);

CREATE TABLE grupos
(
  Id number(2) CONSTRAINT grup_id_fk PRIMARY KEY,
  nombre varchar2(30),
  Cod_niveles number(2) CONSTRAINT prof_niv_fk REFERENCES  NIVELES (cod),
  Id_profe number(2) CONSTRAINT grup_prof_fk REFERENCES PROFESORES (id)
);

CREATE TABLE alumnos
(
  Id number(2) CONSTRAINT alu_id_pk PRIMARY KEY,
  DNI varchar2(9) CONSTRAINT alu_dni_uk UNIQUE NOT NULL,
  nombre varchar2(30),
  apellido varchar2(30),
  id_grupo number(2) CONSTRAINT alu_grupo_fk REFERENCES GRUPOS (id)
);

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  1,'PET','S',NULL
);

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  2,'FIRST','S','S'
);

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  1,'PET','S',NULL
);

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  2,'FIRST','S','S'
);

SELECT

select COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
from  NIVELES;

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  1,'PET','S',NULL
);

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  2,'FIRST','S','S'
);

select COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
from  NIVELES;

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  1,'PET','S',NULL
);

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  2,'FIRST','S','S'
);

select COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
from  NIVELES

insert into PROFESORES (
 ID,NOMBRE,DNI
) values (
  1,'Teacher para PET y FIRST',12123456H
);

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  1,'PET','S',NULL
);

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  2,'FIRST','S','S'
);

select COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
from  NIVELES

insert into PROFESORES (
 ID,NOMBRE,DNI
) values (
  1,'Teacher para PET y FIRST','12123456H'
);

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  1,'PET','S',NULL
);

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  2,'FIRST','S','S'
);

select COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
from  NIVELES

insert into PROFESORES (
 ID,NOMBRE,DNI
) values (
  1,'Teacher para PET y FIRST','12123456H'
);

select ID,NOMBRE,DNI
from PROFESORES;

insert into PROFESORES (
 ID,NOMBRE,DNI
) values (
  1,'Teacher para PET y FIRST','12123456H'
);

select ID,NOMBRE,DNI
from PROFESORES;

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  1,'PET','S',NULL
);

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  2,'FIST','S','S'
);

select COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
from  NIVELES

insert into PROFESORES (
 ID,NOMBRE,DNI
) values (
  1,'Teacher para PET y FIST','12123456H'
);

select ID,NOMBRE,DNI
from PROFESORES

insert into GRUPOS (
 ID,NOMBRE,ID_PROFE,COD_NIVELES
) values (
  2,'Preparación FiST',1,2
);

insert into GRUPOS (
 ID,NOMBRE,ID_PROFE,COD_NIVELES
) values (
  2,Preparación FIST',1,2
);

insert into GRUPOS (
 ID,NOMBRE,ID_PROFE,COD_NIVELES
) values (
  1,'Preparación PET',1,1
);

select ID,NOMBRE,ID_PROFE,COD_NIVELES
from GRUPOS;

insert into GRUPOS (
 ID,NOMBRE,ID_PROFE,COD_NIVELES
) values (
  2,Preparación FIST',1,2
);

insert into GRUPOS (
 ID,NOMBRE,ID_PROFE,COD_NIVELES
) values (
  1,'Preparación PET',1,1
);

select ID,NOMBRE,ID_PROFE,COD_NIVELES
from GRUPOS;

insert into ALUMNOS (
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  1,'53984244R',Ibañez,2,Victor
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from ALUMNOS;

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  1,'PET','S',NULL
);

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  2,'FIST','S','S'
);

select COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
from  NIVELES

insert into PROFESORES (
 ID,NOMBRE,DNI
) values (
  1,'Teacher para PET y FIST','12123456H'
);

select ID,NOMBRE,DNI
from PROFESORES

insert into GRUPOS (
 ID,NOMBRE,ID_PROFE,COD_NIVELES
) values (
  2,'Preparación FiST',1,2
);

insert into GRUPOS (
 ID,NOMBRE,ID_PROFE,COD_NIVELES
) values (
  2,Preparación FIST',1,2
);

insert into GRUPOS (
 ID,NOMBRE,ID_PROFE,COD_NIVELES
) values (
  1,'Preparación PET',1,1
);

select ID,NOMBRE,ID_PROFE,COD_NIVELES
from GRUPOS

insert into ALUMNOS (
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  1,'53984244R',Ibañez,2,Victor
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from ALUMNOS;

insert into ALUMNOS (
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  1,'53984244R',Ibañez,2,Victor
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from ALUMNOS;

insert into ALUMNOS (
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  1,'53984244R',Ibañez,2,Victor
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from  ALUMNOS;

insert into ALUMNOS (
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  1,'53984244R','Ibañez',2,'Victor'
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from  ALUMNOS;

insert into ALUMNOS (
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  1,'53984244R','IBAÑEZ',2,'VICTOR'
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from  ALUMNOS;

insert into ALUMNOS (
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  1,'53984244R','IBAÑEZ',2,'VICTOR'
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from  ALUMNOS;

insert into ALUMNOS (
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  null,'53984244R','IBAÑEZ',2,'VICTOR'
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from  ALUMNOS;

insert into ALUMNOS (
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  1,'53984244R','IBAÑEZ',2,'VICTOR'
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from  ALUMNOS;

insert into ALUMNOS (
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  1,'53984244R','IBAÑEZ',2,'VICTOR'
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from  ALUMNOS;

insert into ALUMNOS (
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  1,53984244R,'IBAÑEZ',2,'VICTOR'
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from  ALUMNOS;

insert into ALUMNOS ( 
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  1,53984244'R','IBAÑEZ',2,'VICTOR'
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from  ALUMNOS;

insert into ALUMNOS (
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  1,'53984244R','IBAÑEZ',2,'VICTOR'
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from  ALUMNOS;

select ID,NOMBRE,ID_PROFE,COD_NIVELES
from GRUPOS;

insert into GRUPOS (
 ID,NOMBRE,ID_PROFE,COD_NIVELES
) values (
  2,Preparación FIST',1,2
);

insert into GRUPOS (
 ID,NOMBRE,ID_PROFE,COD_NIVELES
) values (
  2,'Preparación FIRST',1,2
);

select ID,NOMBRE,ID_PROFE,COD_NIVELES
from GRUPOS;

insert into ALUMNOS (
 ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
) values (
  1,'53984244R','IBAÑEZ',2,'VICTOR'
);

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from  ALUMNOS;

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  2,'FIRST','S','S'
);

insert into NIVELES (
 COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
) values (
  2,'FIRST','S','S'
);

select COD,NOMBRE,TITULO,HOMOLOGADO_OPOSICION
from  NIVELES;

select ID,NOMBRE,DNI
from PROFESORES;

select ID,NOMBRE,ID_PROFE,COD_NIVELES
from GRUPOS;

select ID,DNI,APELLIDO,ID_GRUPO,NOMBRE
from  ALUMNOS;
