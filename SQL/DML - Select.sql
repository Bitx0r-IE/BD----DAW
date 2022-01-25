-- Ejercicio_1: --
/*Averigua la estructura de la tabla EMPLE, sus restricciones y las columnas 
que forman parte de cada restricción, ya que se pretende crear una tabla de 
trabajo a partir de ella. Crear la tabla denominada EMPLEADOS30 con la misma 
estructura de la tabla EMPLE pero con los datos de los empleados del departamento
30 de la tabla EMPLE. Para ello utiliza CREATE TABLE... AS SELECT .... ¿Se crean
todas las restricciones?*/
DESC EMPLE;
/*
Nombre       ¿Nulo?   Tipo         
------------ -------- ------------ 
EMP_NO       NOT NULL NUMBER(4)    
APELLIDO              VARCHAR2(10) 
OFICIO                VARCHAR2(15) 
ID_JEFE               NUMBER(4)    
FECHA_ALTA            DATE         
SALARIO      NOT NULL NUMBER(9)    
COMISION_PCT          NUMBER(3)    
DEPT_NO      NOT NULL NUMBER(2)    

*/

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE UPPER(TABLE_NAME) = 'EMPLE';
/*
CONSTRAINT_NAME                                                                                                                  C SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - --------------------------------------------------------------------------------
EMPLE_DEP_FK                                                                                                                     R                                                                                 
EMPLE_DIR_FK                                                                                                                     R                                                                                 
SYS_C00180735                                                                                                                    C "DEPT_NO" IS NOT NULL                                                           
SYS_C00180734                                                                                                                    C "SALARIO" IS NOT NULL                                                           
EMPLE_PK                                                                                                                         P                                                                                 
*/ 
SELECT *
FROM USER_CONS_COLUMS
WHERE UPPER(TABLE_NAME)='EMPLE';

SELECT USER_CONSTRAINTS.CONSTRAINT_NAME, USER_CONSTRAINTS.CONSTRAINT_TYPE,
USER_CONSTRAINTS.TABLE_NAME, USER_CONSTRAINTS.SEARCH_CONDITION, 
USER_CONS_COLUMNS.*
FROM USER_CONSTRAINTS, USER_CONS_COLUMNS
WHERE USER_CONSTRAINTS.CONSTRAINT_NAME = USER_CONS_COLUMNS.CONSTRAINT_NAME
AND UPPER(USER_CONSTRAINTS.TABLE_NAME)='EMPLE';

CREATE TABLE EMPLEADOS30
AS SELECT *
FROM emple
WHERE dept_no = 30;

DESC EMPLEADOS30;
/*
Nombre       ¿Nulo?   Tipo         
------------ -------- ------------ 
EMP_NO                NUMBER(4)    
APELLIDO              VARCHAR2(10) 
OFICIO                VARCHAR2(15) 
ID_JEFE               NUMBER(4)    
FECHA_ALTA            DATE         
SALARIO      NOT NULL NUMBER(9)    
COMISION_PCT          NUMBER(3)    
DEPT_NO      NOT NULL NUMBER(2)
*/

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE UPPER(TABLE_NAME) = 'EMPLEADOS30';
/*
CONSTRAINT_NAME                                                                                                                  C SEARCH_CONDITION                                                                
-------------------------------------------------------------------------------------------------------------------------------- - --------------------------------------------------------------------------------
SYS_C00181565                                                                                                                    C "SALARIO" IS NOT NULL                                                           
SYS_C00181566                                                                                                                    C "DEPT_NO" IS NOT NULL                                                          
*/
DESC EMPLEADOS30;

ALTER TABLE EMPLEADOS30
ADD CONSTRAINT E30_PK PRIMARY KEY(EMP_NO);

ALTER TABLE EMPLEADOS30
ADD CONSTRAINT E30_DEPART_FK FOREIGN KEY (DEPT_NO) REFERENCES DEPART,

ALTER TABLE EMPLEADOS30
ADD CONSTRAINT E30_FK FOREIGN KEY(ID_JEFE) REFERENCES EMPLEADOS30;

SELECT * FROM EMPLEADOS30;

UPDATE EMPLEADOS30
SET ID_JEFE = NULL
WHERE ID_JEFE NOT IN (SELECT EMP_NO
                      FROM EMPLEADOS30);        
/*MODIFICAMOS LA TABLA EMPLEADO30 EN LA COLUMNA ID_JEFE PARA QUE NO EXISTAN
VALORES QUE NO SEAN EMPLEADOS*/

ALTER TABLE EMPLEADOS30
ADD CONSTRAINT E30_FK FOREIGN KEY(ID_JEFE) REFERENCES EMPLEADOS30;
/*DESPUES DE EJECUTAR EL UPDATE TABLE, VOLVEMOS A EJECUTAR EL ALTER TABLE */

--Ejercicio_2: -- 
/*Vamos a realizar una “transacción” que tiene los siguientes pasos. 
Comprobaremos cada paso. Los pasos son:
1. Insertar en la tabla EMPLE a un empleado de apellido 'SAAVEDRA' con número de 
empleado 2000. La fecha de alta será la fecha actual, el SALARIO será el mismo 
salario que el del empleado de apellido 'SALA' más el 20 por 100 y el resto de 
datos serán los mismos que los datos del empleado de apellido 'SALA'. Hazlo en 
un sólo paso.
2. Actualiza la tabla EMPLE, cambiando el número de departamento, para todos los
empleados que tenga el mismo oficio que el empleado 7566, por el número de 
departamento actual del empleado 7499.
3. Borrar todos los departamentos de la tabla DEPART para los cuales no existan 
empleados en EMPLE.
4. Eliminar a todos los empleados que están en un departamento cuyo nombre 
contiene una 'O'.
5. Incrementa el salario del empleado de apellido REY. Su nuevo salario será el 
que tenía antes más un importe que corresponde con la comisión que tiene ARROYO.
*/

--Apartado_1:--

INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, FECHA_ALTA, SALARIO, ID_JEFE,COMISION_PCT, 
                    DEPT_NO) 
SELECT 2000, 'SAAVEDRA', oficio, SYSDATE, salario+salario*0.2, id_jefe,
        comision_pct, dept_no
FROM EMPLE
WHERE lower(emple.apellido)='sala';

SELECT *
FROM EMPLE
WHERE lower(apellido) IN('sala','saavedra');
/*
    EMP_NO APELLIDO   OFICIO             ID_JEFE FECHA_AL    SALARIO COMISION_PCT    DEPT_NO
---------- ---------- --------------- ---------- -------- ---------- ------------ ----------
      7521 SALA       COMERCIAL             7698 22/02/81       1625            5         30
      2000 SAAVEDRA   COMERCIAL             7698 10/01/22       1950            5         30
*/

--Apartado_2:--

SELECT *
FROM EMPLE
WHERE oficio = (SELECT oficio
                FROM EMPLE
                WHERE emp_no = 7566);
/*
    EMP_NO APELLIDO   OFICIO             ID_JEFE FECHA_AL    SALARIO COMISION_PCT    DEPT_NO
---------- ---------- --------------- ---------- -------- ---------- ------------ ----------
      7566 JIMENEZ    GERENTE               7839 12/04/81       3867                      20
      7698 NEGRO      GERENTE               7839 11/05/81       3705                      30
      7782 CEREZO     GERENTE               7839 19/06/81       3185                      10

*/                
UPDATE EMPLE
SET dept_no = (SELECT dept_no
                FROM EMPLE
                WHERE emp_no = 7499)
WHERE oficio = (SELECT oficio
                FROM EMPLE
                WHERE emp_no = 7566);

SELECT *
FROM EMPLE
WHERE oficio = (SELECT oficio
                FROM EMPLE
                WHERE emp_no = 7566);
/*
    EMP_NO APELLIDO   OFICIO             ID_JEFE FECHA_AL    SALARIO COMISION_PCT    DEPT_NO
---------- ---------- --------------- ---------- -------- ---------- ------------ ----------
      7566 JIMENEZ    GERENTE               7839 12/04/81       3867                      30
      7698 NEGRO      GERENTE               7839 11/05/81       3705                      30
      7782 CEREZO     GERENTE               7839 19/06/81       3185                      30
*/

--Apartado_3:--
SELECT DISTINCT(DEPT_NO)
FROM DEPART;
/*
   DEPT_NO
----------
        10
        20
        30
        40
*/
SELECT * 
FROM DEPART
/*
   DEPT_NO DNOMBRE        LOC           
---------- -------------- --------------
        10 CONTABILIDAD   SEVILLA       
        20 INVESTIGACION  MADRID        
        30 VENTAS         BARCELONA     
        40 PRODUCCION     BILBAO       
*/
DELETE FROM DEPART
WHERE DEPT_NO IN (SELECT DISTINCT(DEPT_NO)
                  FROM EMPLE);

SELECT *
FROM DEPART;
/*
   DEPT_NO DNOMBRE        LOC           
---------- -------------- --------------
        40 PRODUCCION     BILBAO        
*/

--Apartado_4:--

SELECT DEPT_NO, DNOMBRE
FROM DEPART
WHERE UPPER(DNOMBRE) LIKE '%O%';
/*
   DEPT_NO DNOMBRE       
---------- --------------
        40 PRODUCCION   
*/
DELETE FROM EMPLE
WHERE DEPT_NO IN (SELECT DEPT_NO
                  FROM DEPART
                  WHERE UPPER(DNOMBRE) LIKE '%O%');

SELECT *
FROM EMPLE
WHERE DEPT_NO IN (SELECT DEPT_NO
                  FORM DEPART
                  WHERE UPPER(DNOMBRE) LIKE '%O%');

--Apartado_5:--

SELECT COMISION_PCT  
FORM EMPLE
WHERE UPPER(APELLIDO)='ARROYO';

SELECT SALARIO
FROM EMPLE
WHERE UPPER(APELLIDO)='REY';

UPDATE EMPLE
SET SALARIO = SALARIO + NVL((SELECT COMISION_PCT
                         FROM EMPLE
                         WHERE UPPER(APELLIDO)='ARROYO'),0)
WHERE UPPER(APELLIDO) = 'REY';
    
SELECT SALARIO
FROM EMPLE
WHERE UPPER(APELLIDO)='REY';

ROLLBACK;

SELECT *
FORM DEPART;

/*Cambiar el dept al empleado de apellido SAAVEDRA. EL nuevo dep será el dept 
cuyo oficio sea PROGRAMADOR
*/

ELECT DEPT_NO
FROM EMPLE 
WHERE UPPER(APELLIDO) = 'SAAVEDRA';

UPDATE EMPLE
SET dept_no = (SELECT DEPT_NO
               FROM EMPLE
               WHERE UPPER(OFICIO)='PROGRAMADOR'
               GROUP BY DEPT_NO
               HAVING COUNT(*)=(SELECT MAX(COUNT(*))
                                FROM EMPLE
                                WHERE UPPER(OFICIO)='PROGRAMADOR'
                                GROUP BY DEPT_NO))
WHERE UPPER(apellido)='SAAVEDRA';

SELECT DEPT_NO
FROM EMPLE 
WHERE UPPER(APELLIDO) = 'SAAVEDRA';
    