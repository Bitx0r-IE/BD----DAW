/*Ejercicio_1:*/
/*Obtén los datos de los empleados cuyo salario supera la media de los salarios 
de la empresa.*/

SELECT AVG(salario) "salario medio"
FROM emple;
/*
salario medio
-------------
   2695,14286

*/

SELECT emp_no, apellido, oficio, salario
FROM emple
WHERE salario > (SELECT AVG(salario)
                 FROM EMPLE);
/*
    EMP_NO APELLIDO   OFICIO             SALARIO
---------- ---------- --------------- ----------
      7839 REY        PRESIDENTE            6500
      7566 JIMENEZ    GERENTE               3867
      7698 NEGRO      GERENTE               3705
      7782 CEREZO     GERENTE               3185
      7788 GIL        ANALISTA              3900
      7902 FERNANDEZ  ANALISTA              3900 
*/

/*Ejercicio_2:*/
/*Realiza una consulta que muestre el nombre, el salario y el código del 
departamento de los empleados cuyo salario supere la media de su departamento.*/

SELECT e.emp_no, d.dnombre, e.salario, e.dept_no "nº departamento" 
FROM emple e, depart d
WHERE e.dept_no = d.dept_no
AND salario > (SELECT AVG( e.salario)
               FROM emple emp
               WHERE emp.dept_no = e.dept_no); --e.dept_no para coordinar
/*
   EMP_NO DNOMBRE           SALARIO nº departamento
---------- -------------- ---------- ---------------
      7839 CONTABILIDAD         6500              10
      7566 INVESTIGACION        3867              20
      7698 VENTAS               3705              30
      7782 CONTABILIDAD         3185              10
      7788 INVESTIGACION        3900              20
      7902 INVESTIGACION        3900              20
*/

/*Ejercicio_3:*/
/*Modifica a los empleados de apellido SANCHEZ para la COMISION sea 20. 
Comprueba y da por buena la transacción.*/

UPDATE emple
SET comision_pct = 20
WHERE UPPER(apellido) = 'SANCHEZ';
/*
2 filas actualizadas.
*/

/*Ejercicio_4:*/
/*Listar las localidades donde existan departamentos con empleados cuya comisión 
sea menor el 10% del salario. Realízala de dos formas.*/

SELECT loc, dept_no, dnombre
FROM depart 
WHERE EXISTS (SELECT 'x'
              FROM emple
              WHERE comision_pct < (salario*0.1)
              AND dept_no = depart.dept_no); --para coordinar
/*
LOC               DEPT_NO DNOMBRE       
-------------- ---------- --------------
BARCELONA              30 VENTAS        
MADRID                 20 INVESTIGACION 
SEVILLA                10 CONTABILIDAD  
*/

/*v2*/

SELECT loc, dept_no, dnombre
FROM depart 
WHERE dept_no IN (SELECT distinct dept_no
                  FROM emple
                  WHERE comision_pct < (salario*0.1));
/*
LOC               DEPT_NO DNOMBRE       
-------------- ---------- --------------
BARCELONA              30 VENTAS        
MADRID                 20 INVESTIGACION 
SEVILLA                10 CONTABILIDAD  
*/

/*Ejercicio_5:*/
/*Escribir una consulta para mostrar los apellidos de los empleados, que tengan 
uno o más compañeros de trabajo en sus departamentos con fechas de contratación 
posteriores a ellos y salarios más altos que ellos. Realízala de dos formas.*/

SELECT e.apellido
FROM emple e
WHERE EXISTS (SELECT 'x'
              FROM emple emp
              WHERE emp.dept_no = e.dept_no
              AND emp.salario > e.salario
              AND emp.fecha_alta > e.fecha_alta);
/*
APELLIDO  
----------
CEREZO
SANCHEZ
SALA
ARROYO
ALONSO
JIMENEZ
*/

/*v2*/

SELECT e.apellido
FROM emple e
WHERE 1 <= (SELECT COUNT(emp_no)-- otra opción: COUNT(*)
            FROM emple emp
            WHERE emp.dept_no = e.dept_no
            AND emp.salario > e.salario
            AND emp.fecha_alta > e.fecha_alta);
/*
APELLIDO  
----------
CEREZO
SANCHEZ
SALA
ARROYO
ALONSO
JIMENEZ
*/

/*Ejercicio_6:*/
/*Buscar los departamentos que no tengan empleados. Hazlo de dos formas.*/