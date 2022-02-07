/*Ejercicio_1:*/
/*Crear una vista de nombre DEPT_SUM con los nombres de departamentos, salarios 
m�xnimos y salarios medios por departamento. Utiliza los alias DEPT_NOMBRE, SAL_MIN, SAL_MED
�Es una vista simple o compleja?*/

CREATE OR REPLACE VIEW DEPT_SUM (DEPT_NOMBRE, SAL_MIN, SAL_MED)
AS
SELECT dept_no, MIN(salario), AVG(salario)
FROM emple
GROUP BY dept_no;
/*View DEPT_SUM creado.*/

SELECT * FROM DEPT_SUM;
/*
DEPT_NOMBRE    SAL_MIN    SAL_MED
----------- ---------- ----------
         30       1235 1952,85714
         20       1040     2827,4
         10       1690 3791,66667
*/

----------------------------------------------------------------------------------------------------------------------------

/*Ejercicio_2:*/
/*El equipo de programadores se ha dado cuenta que realizan muchas consultas en 
las que intervienen el sueldo m�ximo de cada departamento, as� que deciden crear 
una vista denominada DEPT_SALMAX. Realiza una vista que muestre el c�digo del 
departamento y el salario m�ximo del departamento.*/

CREATE OR REPLACE VIEW DEPT_SALMAX (N�_DEPT, SAL_MAX)
AS
SELECT dept_no, MAX(salario)
FROM emple
GROUP BY dept_no;
/*View DEPT_SALMAX creado*/

SELECT * FROM DEPT_SALMAX;
/*
  N�_DEPT    SAL_MAX
---------- ----------
        30       3705
        20       3900
        10       6500
*/

----------------------------------------------------------------------------------------------------------------------------

/*Ejercicio_3:*/
/*Realiza una consulta que muestre el nombre del empleado, el salario del empleado, 
el c�digo del departamento y el salario m�ximo del departamento, para aquellos 
empleados cuyo salario sea el m�ximo de su departamento.
PISTA: Piensa que una vista es una tabla l�gica. Usa alguna de las vistas creada 
en el apartado anterior.*/

SELECT e.apellido, e.salario, v.*
FROM emple e, DEPT_SALMAX v
WHERE e.dept_no = v.dept_no;

----------------------------------------------------------------------------------------------------------------------------

/*Ejercicio_4:*/
/*Usando alguna de las vistas creadas, realiza una consulta que muestre el nombre 
del empleado, el salario del empleado, el c�digo del departamento para aquellos 
empleados cuyo salario no supere la media de su departamento.*/


----------------------------------------------------------------------------------------------------------------------------

/*Ejercicio_5:*/
/*Crear la vista, denominada MP_MAX, para recoger los empleados que ganan menos 
que el salario m�ximo de su departamento. De cada empleado guardaremos el apellido, 
su salario, el departamento en el que trabaja y el salario m�ximo de su departamento.
Para realizar la vista utiliza una tabla dinámica que contenga el c�digo del 
departamento y el salario m�ximo del departamento.
NOTA: Una tabla din�mica es una select en el FROM de otra select (punto 12.4. de 
la unidad 6 REALIZACI�N DE CONSULTAS).*/



----------------------------------------------------------------------------------------------------------------------------

/*Ejercicio_6:*/
/*Acceder al diccionario de datos para averiguar el nombre las vistas que tienes 
creadas y la consulta usada para su creaci�n.*/
