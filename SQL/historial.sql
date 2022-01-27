DROP TABLE EMPLEADOS CASCADE CONSTRAINTS;
DROP TABLE HISTORIAL_LABORAL CASCADE CONSTRAINTS;
DROP TABLE DEPARTS CASCADE CONSTRAINTS; 

CREATE TABLE DEPARTS(
 	DEPT_NO  NUMBER(5),
	DNOMBRE  VARCHAR2(14), 
 	LOC      VARCHAR2(14),
	CONSTRAINT DEPT_PK PRIMARY KEY (DEPT_NO)
	);

CREATE TABLE EMPLEADOS(
EMP_NO		VARCHAR(6) 	 CONSTRAINT EM_PK PRIMARY KEY,
NOMBRE		VARCHAR2(10) NOT NULL,
APELLIDO1	VARCHAR2(15) NOT NULL,
APELLIDO2 	VARCHAR2(15) NOT NULL,
DIRECC		VARCHAR2(25),
CIUDAD 		VARCHAR2(20),
MUNICIPIO	VARCHAR2(20),
COD_POSTAL	VARCHAR2(5),
SEXO		CHAR CONSTRAINT EM_SEX_CK CHECK(SEXO IN('H','M')),
FECHA_NAC	DATE,
TRAB_COD 	VARCHAR2(3),
SALARIO		NUMBER(8,2),
DIR			VARCHAR2(6) REFERENCES EMPLEADOS ON DELETE SET NULL,
DPTO_COD	NUMBER(5));


CREATE TABLE HISTORIAL_LABORAL(
EMP_NO 			VARCHAR(6) CONSTRAINT HL_DNI_FK REFERENCES EMPLEADOS
						  ON DELETE CASCADE,
TRAB_COD		VARCHAR2(3) ,
FECHA_INICIO	DATE,
FECHA_FIN		DATE,
DPTO_COD		NUMBER(5),
CONSTRAINT HL_PK PRIMARY KEY(EMP_NO,FECHA_INICIO),
CONSTRAINT HL_FECHAS CHECK(FECHA_INICIO<FECHA_FIN));

INSERT INTO DEPARTS VALUES (10,'CONTABILIDAD','VITORIA');
INSERT INTO DEPARTS VALUES (20,'INVESTIGACION','VITORIA');
INSERT INTO DEPARTS VALUES (30,'VENTAS','BARCELONA');
INSERT INTO DEPARTS VALUES (40,'PRODUCCION','BILBAO');

INSERT INTO EMPLEADOS VALUES('1111','PEPE','GOMEZ','ARROYO',NULL,NULL,NULL,NULL,'H','20/09/45','T2',3400,NULL,10);
INSERT INTO EMPLEADOS VALUES('2222','ANA','GONZALEZ','LOPEZ','DATO,5','VITORIA',NULL,'01013','H','20/09/45','T1',1200,'1111',20);
INSERT INTO EMPLEADOS VALUES('3333','LUIS','NEGRO','RUIZ','POSTAS,23','VITORIA',NULL,'01014','H','20/09/45','T3',2500,'1111',10);
INSERT INTO EMPLEADOS VALUES('4444','ROSA','REY','JIMENEZ',NULL,NULL,NULL,NULL,'H','20/09/45','T3',2200,'2222',30);

INSERT INTO HISTORIAL_LABORAL VALUES('1111','T1','10/01/79','15/06/87',10);
INSERT INTO HISTORIAL_LABORAL VALUES('1111','T2','18/01/88','15/06/95',20);
INSERT INTO HISTORIAL_LABORAL VALUES('1111','T1','17/06/96','21/07/98',10);
INSERT INTO HISTORIAL_LABORAL VALUES('2222','T1','10/01/99','15/06/00',10);
INSERT INTO HISTORIAL_LABORAL VALUES('2222','T5','10/01/02','20/03/05',10);
INSERT INTO HISTORIAL_LABORAL VALUES('3333','T2','10/01/08','15/06/10',30);
INSERT INTO HISTORIAL_LABORAL VALUES('3333','T5','10/01/05','15/06/07',20);
INSERT INTO HISTORIAL_LABORAL VALUES('4444','T3','10/01/11','28/01/11',10);


COMMIT;

--ALTER TABLES:--
/*Añade a la tabla EMPLEADOS una restricción de integridad referencial para el 
departamento.*/

SELECT table_name, constraint_name, constraint_type
FROM user_constraints
WHERE lower(table_name) = 'empleados';
/*
TABLE_NAME                                                                                                                       CONSTRAINT_NAME                                                                                                                  C
-------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -
EMPLEADOS                                                                                                                        SYS_C00183166                                                                                                                    C
EMPLEADOS                                                                                                                        SYS_C00183167                                                                                                                    C
EMPLEADOS                                                                                                                        SYS_C00183168                                                                                                                    C
EMPLEADOS                                                                                                                        EM_SEX_CK                                                                                                                        C
EMPLEADOS                                                                                                                        SYS_C00183171                                                                                                                    R
EMPLEADOS                                                                                                                        EM_PK                                                                                                                            P

*/

ALTER TABLE empleados
ADD CONSTRAINT DEPT_NO_FK FOREIGN KEY (DPTO_COD)REFERENCES DEPARTS(DEPT_NO)
                                                ON DELETE CASCADE;

SELECT table_name, constraint_name, constraint_type
FROM user_constraints
WHERE lower(table_name) = 'empleados';
/*
TABLE_NAME                                                                                                                       CONSTRAINT_NAME                                                                                                                  C
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -
EMPLEADOS                                                                                                                        EM_PK                                                                                                                            P
EMPLEADOS                                                                                                                        SYS_C00183171                                                                                                                    R
EMPLEADOS                                                                                                                        DEPT_NO_FK                                                                                                                       R
EMPLEADOS                                                                                                                        EM_SEX_CK                                                                                                                        C
EMPLEADOS                                                                                                                        SYS_C00183168                                                                                                                    C
EMPLEADOS                                                                                                                        SYS_C00183167                                                                                                                    C
EMPLEADOS                                                                                                                        SYS_C00183166                                                                                                                    C

*/

/*Añade a la tabla DEPARTS una columna denominada PRESUPUESTO. Los presupuestos 
de los departamentos deben de estar entre 100.000 y 300.000.
Inserta valores en la columna PRESUPUESTO que has añadido para los departamentos 
ya existentes de tal forma que el departamento de INVESTIGACIÓN tenga 300.000 y 
el resto 150.000.*/

SELECT *
FROM DEPARTS;
/*
   DEPT_NO DNOMBRE        LOC           
---------- -------------- --------------
        10 CONTABILIDAD   VITORIA       
        20 INVESTIGACION  VITORIA       
        30 VENTAS         BARCELONA     
        40 PRODUCCION     BILBAO        
*/

ALTER TABLE DEPARTS
ADD (PRESUPUESTO NUMBER(6)
CONSTRAINT DEPT_RANGO_CK CHECK(PRESUPUESTO BETWEEN 100000 AND 300000));

SELECT CONSTRAINT_TYPE, CONSTRAINT_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE UPPER(TABLE_NAME) = 'DEPARTS';
/*
 C CONSTRAINT_NAME                                                                                                                  SEARCH_CONDITION                                                                
- -------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------------
C DEPT_RANGO_CK                                                                                                                    PRESUPUESTO BETWEEN 100000 AND 200000                                           
P DEPT_PK  
*/

DESC DEPARTS;
/*
Nombre      ¿Nulo?   Tipo         
----------- -------- ------------ 
DEPT_NO     NOT NULL NUMBER(5)    
DNOMBRE              VARCHAR2(14) 
LOC                  VARCHAR2(14) 
PRESUPUESTO          NUMBER(6)  
*/

SELECT DNOMBRE, PRESUPUESTO 
FROM DEPARTS;
/*
DNOMBRE        PRESUPUESTO
-------------- -----------
CONTABILIDAD              
INVESTIGACION             
VENTAS                    
PRODUCCION             
*/
UPDATE DEPARTS
SET PRESUPUESTO = 150000 WHERE UPPER(DNOMBRE) != 'INVESTIGACION';

SELECT DNOMBRE, PRESUPUESTO 
FROM DEPARTS;
/*
DNOMBRE        PRESUPUESTO
-------------- -----------
CONTABILIDAD        150000
INVESTIGACION       150000
VENTAS              150000
PRODUCCION          150000
*/

UPDATE DEPARTS
SET PRESUPUESTO = 300000 WHERE UPPER(DNOMBRE) = 'INVESTIGACION';

SELECT DNOMBRE, PRESUPUESTO 
FROM DEPARTS;
/*
DNOMBRE        PRESUPUESTO
-------------- -----------
CONTABILIDAD        150000
INVESTIGACION       300000
VENTAS              150000
PRODUCCION          150000
*/

COMMIT;
--CONSULTAS:--

/*Ejercicio_1:*/
/*Obtén una relación de todos los empleados y de todos los puestos de trabajo que
ha ido desarrollando. Visualizar el código de empleado y el código de trabajo. 
Si un empleado ha desarrollado mas de una vez un mismo trabajo, esta información 
aparecerá una sola vez.*/

SELECT emp_no, trab_cod
FROM empleados
UNION
SELECT emp_no, trab_cod
FROM historial_laboral;
/*
EMP_NO TRA
------ ---
1111   T1 
1111   T2 
2222   T1 
2222   T5 
3333   T2 
3333   T3 
3333   T5 
4444   T3 
*/
--mismo resultado:--
/*
SELECT emp_no, trab_cod
FROM historial_laboral
UNION 
SELECT emp_no, trab_cod
FROM empleados;
*/

/*Ejercicio_2:*/
/*Lista los empleados que aparte de haber cambiado de puesto, también han cambiado 
de departamento. Visualizar el código de empleado, el código de trabajo (incluirá 
los trabajos actuales y anteriores de todos los empleados), el código y el nombre 
del departamento en el que desarrolla y desarrollaba cada trabajo. Si un empleado 
ha desarrollado mas de una vez un mismo trabajo, esta información aparecerá. 
Mostrar la salida ordenada por departamento.*/

SELECT e.emp_no, e.trab_cod, e.dpto_cod, d.dnombre
FROM empleados e, depart d
WHERE e.dpto_cod = d.dept_no
UNION ALL
SELECT h.emp_no, h.trab_cod, h.dpto_cod, d.dnombre
FROM historial_laboral h, departs d;
WHERE h.dpto_cod = d.dept_no
ORDER BY dpto_cod;
/*
EMP_NO TRA   DPTO_COD DNOMBRE       
------ --- ---------- --------------
4444   T3          10 CONTABILIDAD  
1111   T1          10 INVESTIGACION 
1111   T2          20 INVESTIGACION 
1111   T1          10 INVESTIGACION 
2222   T1          10 INVESTIGACION 
2222   T5          10 INVESTIGACION 
3333   T2          30 INVESTIGACION 
3333   T5          20 INVESTIGACION 
4444   T3          10 INVESTIGACION 
1111   T1          10 VENTAS        
1111   T2          20 VENTAS        

EMP_NO TRA   DPTO_COD DNOMBRE       
------ --- ---------- --------------
1111   T1          10 VENTAS        
2222   T1          10 VENTAS        
2222   T5          10 VENTAS        
3333   T2          30 VENTAS        
3333   T5          20 VENTAS        
4444   T3          10 VENTAS        
1111   T1          10 PRODUCCION    
1111   T2          20 PRODUCCION    
1111   T1          10 PRODUCCION    
2222   T1          10 PRODUCCION    
2222   T5          10 PRODUCCION    

EMP_NO TRA   DPTO_COD DNOMBRE       
------ --- ---------- --------------
3333   T2          30 PRODUCCION    
3333   T5          20 PRODUCCION    
4444   T3          10 PRODUCCION 
*/

/*Ejercicio_3:*/
/*Visualizar los códigos de los empleados y de los trabajos de los empleados que 
actualmente tengan un trabajo que ocuparon ya anteriormente en la compañía.*/

SELECT emp_no, trab_cod
FROM empleados
INTERSECT
SELECT emp_no, trab_cod
FROM historial_laboral;
/*
EMP_NO TRA
------ ---
1111   T2 
2222   T1 
4444   T3 
*/


/*Ejercicio_4:*/
/*Muestra los empleados que han cambiado de puesto, es decir tipo de trabajo y 
departamento en algún momento, pero han vuelto al mismo puesto, es decir al mismo 
departamento con el mismo tipo de trabajo.*/

SELECT emp_no, trab_cod, dpto_cod
FROM empleados
INTERSECT
SELECT emp_no, trab_cod, dpto_cod
FROM historial_laboral;
/*
no se ha seleccionado ninguna fila
*/

/*Ejercicio_5:*/
/*Obtén los empleados que no han cambiado de puesto ninguna vez. Visualizar el 
código del empleado, el nombre del empleado y el código del trabajo.*/

SELECT emp_no, nombre 
FROM empleados
MINUS
SELECT h.emp_no, e.nombre
FROM historial_laboral h, empleados e
WHERE h.emp_no = e.emp_no;--join
/*
no se ha seleccionado ninguna fila
*/
--No es posible sacar los que nunca han cambiado pidiendo que se seleccionen el trab_cod


/*modificación del ejercicio:*/

INSERT INTO EMPLEADOS (EMP_NO, NOMBRE, APELLIDO1, APELLIDO2, TRAB_COD, DPTO_COD)
            VALUES('5555', 'LOLA', 'AGUIRRE', 'AGUIRRE', 'T4', 10);

SELECT *
FROM empleados;
/*
EMP_NO NOMBRE     APELLIDO1       APELLIDO2       DIRECC                    CIUDAD               MUNICIPIO            COD_P S FECHA_NA TRA    SALARIO DIR      DPTO_COD
------ ---------- --------------- --------------- ------------------------- -------------------- -------------------- ----- - -------- --- ---------- ------ ----------
1111   PEPE       GOMEZ           ARROYO                                                                                    H 20/09/45 T2        3400                10
2222   ANA        GONZALEZ        LOPEZ           DATO,5                    VITORIA                                   01013 H 20/09/45 T1        1200 1111           20
3333   LUIS       NEGRO           RUIZ            POSTAS,23                 VITORIA                                   01014 H 20/09/45 T3        2500 1111           10
4444   ROSA       REY             JIMENEZ                                                                                   H 20/09/45 T3        2200 2222           30
5555   LOLA       AGUIRRE         AGUIRRE                                                                                              T4                            10
*/

          
SELECT emp_no, nombre
FROM empleados
WHERE emp_no IN (SELECT emp_no
                 FROM empleados
                 MINUS
                 SELECT h.emp_no
                 FROM historial_laboral h);
/*
EMP_NO NOMBRE    
------ ----------   
5555   LOLA  
*/

/*Ejercicio_6:*/
/*Muestra empleados que han cambiado de puesto de trabajo en la empresa. Visualiza 
el código del empleado, el nombre del empleado, el código del trabajo y el código 
y nombre del departamento. Ordena la salida por código de empleado.*/

SELECT h.emp_no, e.nombre, h.trab_cod, d.dnombre
FROM empleados e, departs d, historial_laboral h
WHERE h.emp_no = e.emp_no
AND h.dpto_cod = d.dept_no
ORDER BY h.emp_no, h.dpto_cod;
/*
EMP_NO NOMBRE     TRA DNOMBRE       
------ ---------- --- --------------
1111   PEPE       T1  CONTABILIDAD  
1111   PEPE       T1  CONTABILIDAD  
1111   PEPE       T2  INVESTIGACION 
2222   ANA        T5  CONTABILIDAD  
2222   ANA        T1  CONTABILIDAD  
3333   LUIS       T5  INVESTIGACION 
3333   LUIS       T2  VENTAS        
4444   ROSA       T3  CONTABILIDAD 
*/

/*Ejercicio_7:*/
/*¿Qué hace la siguiente sentencia?:*/

SELECT EMP_NO, TRAB_COD, SALARIO
FROM EMPLEADOS
UNION
SELECT EMP_NO, TRAB_COD, 0
FROM HISTORIAL_LABORAL;
/*Visualizar el codigo del empleado, codigo trabajo y salario. Enunciado 
ejercicio 5*/        

---------------------------------------------------------------------------------

/*Sacar los datos de los empleados que trabajan en un departamento cuya localidad
tenga también almacenes. En nuestra base de datos ha aparecido una nueva tabla
llamada almacenes que continene el código del almacén, numérico de 3, la 
descripción alfanumerico de 10 y la localidad alfanumérico de 14.*/

CREATE TABLE ALMACENES(
    cod_almacen NUMBER(3),
    descripcion VARCHAR2(10),
    loc VARCHAR2(14),
    CONSTRAINT cod_alm_pk PRIMARY KEY(cod_almacen),
    CONSTRAINT loc_alm_fk FOREIGN KEY
);