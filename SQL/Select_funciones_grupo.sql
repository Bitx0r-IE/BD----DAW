        /*Ejercicio_1*/
/*Mostrar la media, salario mayor, menor y suma de salarios mensuales de todos
los comerciantes*/

SELECT AVG(SALARIO) AS "Media", MAX(SALARIO) AS "Maximo", 
        MIN(SALARIO) AS "Minimo", SUM(SALARIO) AS "Sumatorio"
FROM emple
WHERE lower(OFICIO) = 'comercial';
/*
     Media     Maximo     Minimo  Sumatorio
---------- ---------- ---------- ----------
      1820       2080       1625       7280
*/

/*Ejercicio_2*/
/*Mostrar la fecha de mayor antigüedad y la de menor antigüedad.*/

SELECT MIN(FECHA_ALTA) AS "Mayor Antigüedad", 
        MAX(FECHA_ALTA) AS "Menor Antigüedad"
FROM emple;
/*
Mayor An Menor An
-------- -------
20/02/80 23/01/82
*/

/*Ejercicio_3*/
/*Mostrar el primer apellido y el último de la lista alfabética de todos los 
empleados.*/

SELECT MIN(APELLIDO) AS "Primer apellido", MAX(APELLIDO) AS "Último apellido"
FROM emple;
/*
Primer ape Último ape
---------- ----------
ALONSO     TOVAR   
*/

/*Ejercicio_4*/
/*Mostrar el número de empleados del departamento 40.*/

SELECT COUNT(*) AS "Empleados del departamento 40"
FROM emple
WHERE dept_no = 40;
/*
Empleados del departamento 40
-----------------------------
                            0
*/

/*Otra posible solución:
SELECT COUNT(emp_no) as "Empleados del departamento 40"
FROM emple
WHERE dept_no = 40;

Usamos emp_no porque es la clave primaria
*/

/*Ejercicio_5*/
/*Mostrar el número de empleados del departamento 30 que pueden percibir 
comisión.*/

SELECT COUNT(*) AS "Empleados del departamento 30"
FROM EMPLE
WHERE dept_no = 30 and comision_pct IS NOT NULL;
/*
Empleados del departamento 30
-----------------------------
                            4
*/

 --Otra posible solución(no cuenta los nulos):--
 
 SELECT COUNT(comision_pct) AS "Empleados del departamento 30"
FROM EMPLE
WHERE dept_no = 30;

/*Ejercicio_6*/
/*Visualizar la cantidad de departamentos distintos que hay en la tabla 
empleados.(DISTINC --> para no repetir valores, solo se quiere cuentos tipos)*/

SELECT COUNT(DISTINCT dept_no) AS "Cantidad de departs distintos"
FROM emple;
/*
Cantidad de departs distintos
-----------------------------
                            3
*/

--De esta manera contamos todos los tipos que hay incluidas repeticiones--

SELECT COUNT(dept_no) AS "Cantidad de departs distintos"
FROM emple;
/*
Cantidad de departs distintos
-----------------------------
                           14
*/

/*Ejercicio_7*/
/*Visualizar el número de empleados que hay en cada departamento. Mostrar las 
columnas nodepartamento y no de empleados -cantidad-.*/

SELECT dept_no, count(*)
FROM emple
GROUP BY dept_no;

--Otra solución: --

SELECT dept_no, count(emp_no)
FROM emple
GROUP BY dept_no;
/*
  DEPT_NO   COUNT(*)
---------- ----------
        30          6
        20          5
        10          3
*/

/*Ejercicio_8*/
/*Visualizar ( no departamento y no de empleados -cantidad-) sólo de los 
departamentos con más de 4 empleados.*/

SELECT dept_no AS "num. depart", count(emp_no) AS "num empleados"
FROM emple
GROUP BY dept_no
HAVING COUNT(emp_no) > 4;

--Otra solución posible: --

SELECT dept_no AS "num. depart", count(*) AS "num empleados"
FROM emple
GROUP BY dept_no
HAVING COUNT(*) > 4;
/*
num. depart num empleados
----------- -------------
         30             6
         20             5
*/