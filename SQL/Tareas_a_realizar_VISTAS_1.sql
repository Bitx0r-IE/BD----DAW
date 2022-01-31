/*Ejercicio_1:*/
/*Crear una vista EMP_30 que contenga de los empleados del 
departamento 30 la siguiente información: código de empleado, 
apellidos, salario y departamento. Comprueba que se ha creado
correctamente, y su contenido.*/

CREATE OR REPLACE VIEW EMP_30 --Crearse tantas veces como sea necesario
AS
SELECT emp_no, apellido, salario, dept_no
FROM emple
WHERE dept_no = 30;

DESCRIBE EMP_30;
SELECT * FROM EMP_30;

SELECT * FROM USER_VIEWS
WHERE UPPER(view_name) = `EMP_30`;

---------------------------------------------------------------------------------------------------------------------------------

/*Ejercicio_2:*/
/*Realiza la siguiente inserción
INSERT INTO EMPLE VALUES(9999,'URRUTIA','ANALISTA',7698,NULL,200000,NULL,30);
Comprueba el contenido de la tabla. ¿Qué sucede en la vista?*/

INSERT INTO EMPLE VALUES(9999,'URRUTIA','ANALISTA',7698,NULL,200000,NULL,30);

SELECT * FROM EMPLE;
/*Se inserta un nuevo empleado, la tabla cambia y la vista al volver a crearla también cambia*/

---------------------------------------------------------------------------------------------------------------------------------

/*Ejercicio_3:*/
/*Añade ahora un nuevo empleado en la vista, en el departamento 30.
INSERT INTO EMP_30 VALUES(8888,'RUIZ',280000,30);
¿Qué ocurre en la tabla base? ¿Y en la vista? ¿Añade otro empleado en la vista, pero en el
departamento 10? ¿Qué ocurre en la tabla base? ¿Y en la vista?*/

INSERT INTO EMP_30 VALUES(8888,'RUIZ',280000,30);
SELECT * FROM EMP_30;
/*Se inserta un nuevo empleado, la tabla cambia y la vista al volver a crearla también cambia*/

INSERT INTO EMP_30 VALUES(8181,'RUIZ',280000,10);
/*Se inserta en la tabla, s epuede ver en la tabla, pero no se puede ver en la vista, por
la restricción que tiene esta*/

---------------------------------------------------------------------------------------------------------------------------------

/*Ejercicio_4:*/
/*Modificar la vista creada en el ejercicio 1 de forma que nos aseguremos que las operaciones DML
realizadas sobre la vista permanezca dentro del dominio de la misma.
Si se intenta realizar una operación DML fuera del dominio queremos que aparezca el nombre de la
restricción EMP30_ERROR.
Comprobarlo haciendo alguna inserción:
INSERT INTO EMP_30 VALUES (1111, 'LOPEZ', 1200,30);
INSERT INTO EMP_30 VALUES (2222, 'RUIZ', 2200,20);
y alguna modificación: por ejemplo, modificar el departamento a 10 al empleado 7698.*/

CREATE OR REPLACE VIEW EMP_30
AS
SELECT emp_no, apellido, salario, dept_no
FROM emple
WHERE dept_no = 30
WITH CHECK OPTION CONSTRAINT EMP30_ERROR;

SELECT * FROM EMP_30;

INSERT INTO EMP_30 VALUES (1111, 'LOPEZ', 1200, 30);
--OK

INSERT INTO EMP_30 VALUES (2222, 'RUIZ', 2200, 20);
/* ERROR en línea 1:
ORA-01402: violación de la clausula WHERE en la vista WITH CHECK OPTION */

UPDATE EMP_30 
SET DEPT_NO = 10
WHERE EMP_NO = 7698;
/* ERROR en línea 1:
ORA-01402: violación de la clausula WHERE en la vista WITH CHECK OPTION */


---------------------------------------------------------------------------------------------------------------------------------

/*Ejercicio_5:*/
/*Crear una vista SAL_20 que contenga el código del empleado con el alias ID_EMP, apellidos con el
alias APE_EMP y salario anual con el alias SAL_ANUAL para cada empleado del departamento 20.
No se permitirán operaciones DML desde la vista. Si se intenta realizar una operación DML queremos
que aparezca el nombre de la restricción SAL20_NODML.*/

DROP VIEW SAL_20

CREATE VIEW SAL_20
AS 
SELECT emp_no AS "ID_EMP", apellido AS "APE_EMP", salario AS "SAL_ANUAL"
FROM EMPLE
WHERE dept_no = 20
WITH READ ONLY CONSTRAINT SAL20_NODML;

/*Otra alternativa:*/

CREATE OR REPLACE VIEW SAL_20 (ID_EMP, APE_EMP, SAL_ANUAL)
AS 
SELECT emp_no, apellido, salario AS
FROM EMPLE
WHERE dept_no = 20
WITH READ ONLY CONSTRAINT SAL20_NODML;

SELECT * 
FROM USER_VIEWS
WHERE upper(view_name) = 'SAL_20';

DESC SAL_20;

SELECT * FROM SAL_20;

---------------------------------------------------------------------------------------------------------------------------------

/*Ejercicio_6:*/
/*Realiza la siguiente sentencia e indica qué ocurre:
INSERT INTO SAL_20 VALUES (1111, 'LOPEZ', 1200);*/

INSERT INTO SAL_20 VALUES (1111, 'LOPEZ', 1200);

----------------------------------------------------------------------------------------------------------------------------------

/*Ejercicio_7:*/
/*Eliminar la vista SAL_20. Comprueba que la tabla EMPLE continua existiendo, así como los
empleados del departamento 20.*/

DROP VIEW SAL_20;

SELECT * FROM USER_VIEWS
WHERE UPPER(view_name) = 'SAL_20';

SELECT * FROM USER_TABLES
WHERE UPPER(table_name) = 'EMPLE';

SELECT * FROM EMPLE
WHERE DEPT_NO = 20;