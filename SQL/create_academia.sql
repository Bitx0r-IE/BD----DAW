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
