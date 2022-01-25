REM **** Borrado de las tablas

drop table employees cascade constraint;
drop table departments cascade constraint;
drop table articulos cascade constraint;
drop table fabricantes cascade constraint;
drop table tiendas cascade constraint;
drop table pedidos cascade constraint;
drop table ventas cascade constraint;


REM **** Creación de las tablas
CREATE TABLE tiendas (
nif VARCHAR2(10) PRIMARY KEY,
nombre VARCHAR2(20),
direccion  VARCHAR2(20),
poblacion  VARCHAR2(20),
provincia  VARCHAR2(20),
codpostal  VARCHAR2(5),
CONSTRAINT tie_provincia_ck CHECK(provincia = UPPER(provincia))
);
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    PALABRA CLAVEPRIMARY KEY mal escrita pone PRYMARY
*Action:   Escribir bien
*/
/*
Informe de error -
ORA-00904: : identificador no válido
00904. 00000 -  "%s: invalid identifier"
*Cause:    Funcion uppercase inventada
*Action:    usar la función UPPER
*/
/*
Informe de error -
ORA-00904: : identificador no válido
00904. 00000 -  "%s: invalid identifier"
*Cause:    FALTA EL IDENTIFICADOR CHECK
*Action:    PONER EL TIPO CHECK

*/
CREATE TABLE fabricantes (
cod_fabricante VARCHAR2(3) NOT NULL,
nombre  VARCHAR2(15),
pais VARCHAR2(15), 
CONSTRAINT fab_cod_fab_pk PRIMARY KEY(cod_fabricante),
CONSTRAINT fab_nombre_mayusuculas_ck CHECK(nombre = upper(nombre)),
CONSTRAINT fab_pais_mayusuculas_ck CHECK(pais= upper(pais))
);
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    CHECK mal escritos y colocados
*Action:    Escribir correctamente
*/
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    VARCHAR2 mal escrito --> "VARCHAR"
*Action:    Añadir un 2 a VARCHAR
*/

create table departments(
   department_id NUMBER(2),
   department_name VARCHAR2(30) CONSTRAINTS dept_name_nn NOT NULL, 
   manager_id NUMBER(3),
   location_id NUMBER(4),
CONSTRAINT dept_id_pk PRIMARY KEY(department_id)
);
/*
Informe de error -
ORA-00904: "DEPARMENT_ID": identificador no válido
00904. 00000 -  "%s: invalid identifier"
*Cause:    CONSTRAINTS está mal escrito
*Action:    Escribir bien CONSTRAINT
*/
/*
Informe de error -
ORA-00904: "DEPARMENT_ID": identificador no válido
00904. 00000 -  "%s: invalid identifier"
*Cause:    derparment_id está mal escrito
*Action:    Escribir correctamente deprtment_id
*/

CREATE TABLE articulos (
articulo VARCHAR2(20)NOT NULL,
cod_fabricante VARCHAR2(3) NOT NULL,
peso NUMBER(3) NOT NULL,
categoria VARCHAR2(10) NOT NULL,
precio_venta NUMBER(4),
precio_costo NUMBER(4),
existencias NUMBER(5),
CONSTRAINT art_pk PRIMARY KEY(articulo, cod_fabricante, peso, categoria),
CONSTRAINT art_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante) ON DELETE CASCADE,
CONSTRAINT precio_ck CHECK (precio_venta>0 AND precio_costo>0 AND peso >0),
CONSTRAINT categoria_ck CHECK (categoria IN('primero','segundo','tercero') )   
);
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    Demasiados variable para la clave primaria
*Action:    Elegir articulo como clave primaria
*/
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    CONSTRAINTS de los CHECK no declaradas y sobra un paréntesis al final
*Action:    Declarar los CONSTRAINTS y eliminar 1 parentesis del final
*/
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:   En precio_ck no se puede poner || para declarar un 'y..'
*Action:   Cambiar || por AND 
*/
/*
Informe de error -
ORA-00907: falta el paréntesis izquierdo
00907. 00000 -  "missing left parenthesis"
*Cause:   La secuencia CHECK de categoria_ck no está dentro de un paréntesis
*Action:   Insertar la secuencia dentro de un paréntesis --> (categoria IN('primero', 'segundo', 'tercero'))
*/

CREATE TABLE ventas(
nif VARCHAR2(10) NOT NULL,
articulo VARCHAR2(20) NOT NULL,
cod_fabricante VARCHAR2(3) NOT NULL,
peso NUMBER(3) NOT NULL,
categoria VARCHAR2(10) NOT NULL,
fecha_venta DATE DEFAULT SYSDATE,
unidades_vendidas NUMBER(4), 
CONSTRAINT ven_pk PRIMARY KEY(nif, articulo, cod_fabricante, peso, categoria, fecha_venta),
CONSTRAINT ven_fab_fk FOREIGN KEY(cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CHECK (unidades_vendidas>0),
CHECK (categoria IN('primero','segundo','tercero')),
CONSTRAINT ven_art_fk FOREIGN KEY(articulo, cod_fabricante, peso, categoria) REFERENCES
articulos(articulo, cod_fabricante, peso, categoria),
CONSTRAINT ven_tie_fk FOREIGN KEY(nif) REFERENCES tiendas(nif)
);
/*
Informe de error -
ORA-00904: "CODIGO": identificador no válido
00904. 00000 -  "%s: invalid identifier"
*Cause:    El identificador codigo no existe
*Action:    Utilizar cod_fabricante
*/

CREATE TABLE employees(
   employee_id NUMBER(6),
   first_name VARCHAR2(25) NOT NULL ,
   last_name VARCHAR2(25),
   email VARCHAR2(25) CONSTRAINT emp_email_uk UNIQUE,
   phone_number NUMBER(12),
   hire_date DATE  DEFAULT SYSDATE ,
   job_id VARCHAR2(10),
   salary NUMBER(8),
   comission_pct NUMBER(5),
   manager_id NUMBER(3),
   department_id NUMBER(2),
    CONSTRAINT emp_id_pk PRIMARY KEY(employee_id),
    CONSTRAINT emp_dept_fk FOREIGN KEY(department_id) REFERENCES departments(department_id)
);
/*
Informe de error - 
*Cause:     La operación no está introducida en un paréctesis, ni empieza ni termina
*Action:    Incuir un '(' tras el CREATE TABLE employees y terminar con ');' tras el último CONSTRAINT
*/
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:   salary y comision_pct tienen NUMBER CON DOBLE DATO 
*Action:    Eliminar uno de los datos de sus NUMBER
*/
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:    deparmtmentes_id es incorrecto y FOREING está mal escrito
*Action:    Reemplazarlo por department_id y FROREIGN
*/

CREATE TABLE pedidos (
nif VARCHAR2 (10) NOT NULL,
articulo VARCHAR2 (20) NOT NULL,
cod_fabricante VARCHAR2 (3) NOT NULL,
peso NUMBER(3) NOT NULL,
categoria VARCHAR2 (10) NOT NULL,
fecha_pedido DATE DEFAULT SYSDATE,
unidades_pedidas NUMBER(4),
CONSTRAINT ped_pk PRIMARY KEY(nif,articulo,cod_fabricante,peso,categoria,fecha_pedido),
CONSTRAINT ped_fk FOREIGN KEY (cod_fabricante) REFERENCES fabricantes(cod_fabricante),
CONSTRAINT ped_unidades_ck CHECK (unidades_pedidas>0),
CONSTRAINT ped_categoria_ck CHECK (categoria  IN('primero','segundo','tercero')),
CONSTRAINT art_fk FOREIGN KEY (articulo,cod_fabricante,peso,categoria) REFERENCES articulos(articulo,cod_fabricante,peso,categoria),
CONSTRAINT tie_fk FOREIGN KEY (nif) REFERENCES tiendas(nif)
);
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:  Constraint CHECK de categoría sin nombrar y sin poner entre '' las categorías  
*Action: Dar un nombre y poner primero, segunod y tercero entre ''
*/
/*
Informe de error -
ORA-00907: falta el paréntesis derecho
00907. 00000 -  "missing right parenthesis"
*Cause:  DATE SYSDATE es incorrecto
*Action: Cambiarlo por DATE DEFAULT SYSDATE 
*/
/*
Informe de error -
ORA-00905: falta una palabra clave
00905. 00000 -  "missing keyword"
*Cause:    REFERENCE es incorrecto
*Action:    Escribir REFERENCES
*/