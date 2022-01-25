/*Ejercicio_1:*/
/*Visualizar ( no departamento y no de empleados) sólo los departamentos con más 
de 4 empleados, pero ordenar la salida en descendente por número de empleados.*/

SELECT emple.dept_no, count(*)
FROM emple 
GROUP BY dept_no
HAVING COUNT(*)>4
ORDER BY COUNT(*) DESC;
/*
   DEPT_NO   COUNT(*)
---------- ----------
        30          6
        20          5
*/

/*Ejercicio_2:*/
/*Partiendo de la tabla EMPLE, obtener la suma de salarios, el salario máximo y 
el salario mínimo por cada departamento (no departamento).*/

SELECT dept_no, SUM(salario) "SUMA", MAX(salario) "MÁXIMO", MIN(salario) "MÍNIMO"
FROM emple
GROUP BY dept_no;
/*
   DEPT_NO       SUMA     MÁXIMO     MÍNIMO
---------- ---------- ---------- ----------
        30      12220       3705       1235
        20      14137       3900       1040
        10      11375       6500       1690
*/

/*Ejercicio_3:*/
/*Calcular el número de empleados que realizan cada oficio por departamento. Los 
datos que se visualizan son: departamento, oficio y número de empleados*/

SELECT dept_no, oficio, COUNT(emp_no) "nº empleados"
FROM emple
GROUP BY dept_no, oficio
ORDER BY dept_no DESC;
/*
   DEPT_NO OFICIO          nº empleados
---------- --------------- ------------
        30 COMERCIAL                  4
        30 GERENTE                    1
        30 PROGRAMADOR                1
        20 ANALISTA                   2
        20 GERENTE                    1
        20 PROGRAMADOR                2
        10 AUXILIAR                   1
        10 GERENTE                    1
        10 PRESIDENTE                 1
*/

/*Modificacion:*/

SELECT d.dnombre, e.oficio, COUNT(*) "nº empleados"
FROM emple e, depart d
WHERE e.dept_no = d.dept_no
GROUP BY e.dept_no, d.dnombre,e.oficio
ORDER BY e.dept_no;
/*
DNOMBRE        OFICIO          nº empleados
-------------- --------------- ------------
CONTABILIDAD   AUXILIAR                   1
CONTABILIDAD   GERENTE                    1
CONTABILIDAD   PRESIDENTE                 1
INVESTIGACION  ANALISTA                   2
INVESTIGACION  GERENTE                    1
INVESTIGACION  PROGRAMADOR                2
VENTAS         COMERCIAL                  4
VENTAS         GERENTE                    1
VENTAS         PROGRAMADOR                1
*/

/*Ejercicio_4:*/
/*Visualizar el valor numérico que nos indique el número de empleados que hay en 
el departamento donde trabajan mas empleados.*/

SELECT dept_no, COUNT(emp_no) "nº empleados"
FROM emple 
GROUP BY dept_no 
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM emple
                   GROUP BY dept_no);
/*
   DEPT_NO nº empleados
---------- ------------
        30            6
*/

/*Ejercicio_5:*/
/*Mostrar los números de departamento y el salario medio para los departamentos 
cuyos salarios máximos sean mayores de 250000.*/

SELECT dept_no, ROUND(AVG(salario * 12),0) "salario medio"
FROM emple
GROUP BY dept_no
HAVING ROUND(MAX(salario * 12),0) > 250000;
/*
no se ha seleccionado ninguna fila
*/

/*Ejercicio_6:*/
/*Visualizar el salario medio máximo por departamento.*/

SELECT dept_no, AVG(salario) "Salario Medio"
FROM emple
GROUP BY dept_no;
/*
   DEPT_NO Salario Medio
---------- -------------
        30    2036,66667
        20        2827,4
        10    3791,66667
*/

/*Ejercicio_7:*/
/*Escribir una consulta para mostrar el número de personas con el mismo oficio.*/

SELECT oficio, COUNT(emp_no) "Cantidad"
FROM emple
GROUP BY oficio;
/*
OFICIO            Cantidad
--------------- ----------
GERENTE                  3
PRESIDENTE               1
COMERCIAL                4
ANALISTA                 2
PROGRAMADOR              3
AUXILIAR                 1
*/
/*v2*/
SELECT oficio, COUNT(*) "Cantidad"
FROM emple
GROUP BY oficio
ORDER BY COUNT(*);
/*
OFICIO            Cantidad
--------------- ----------
PRESIDENTE               1
AUXILIAR                 1
ANALISTA                 2
GERENTE                  3
PROGRAMADOR              3
COMERCIAL                4
*/
/*Ejercicio_8:*/
/*Mostrar el número de director y el salario del empleado peor pagado para ese 
director. Excluir los empleados de los que se desconozca el director. Excluir 
los grupos en los que el salario mínimo sea 200000 o menos. Ordenar el resultado 
por salario de forma descendente.*/

SELECT e.id_jefe, MIN(e.salario * 12) "salario minimo"
FROM emple e
WHERE e.id_jefe IS NOT NULL
GROUP BY e.id_jefe
HAVING MIN(e.salario * 12) > 20000
ORDER BY MIN(e.salario) DESC;
/*
   ID_JEFE salario minimo
---------- --------------
      7839          38220
      7782          20280
*/

/*Ejercicio_9:*/
/*Sacar el código y nombre del/los departamentos con mayor cantidad de empleados 
trabajando en el/ellos.*/

SELECT e.dept_no, d.dnombre, COUNT(e.emp_no) "Empleados"
FROM emple e, depart d
WHERE e.dept_no = d.dept_no 
group by e.dept_no, d.dnombre
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                   FROM emple
                   GROUP BY dept_no);
/*
   DEPT_NO DNOMBRE         Empleados
---------- -------------- ----------
        30 VENTAS                  6
*/

/*v2*/

SELECT e.dept_no, d.dnombre, COUNT(e.emp_no) "Empleados"
FROM emple e, depart d
WHERE e.dept_no = d.dept_no  --JOIN
group by e.dept_no, d.dnombre
HAVING COUNT(*) >=ALL (SELECT COUNT(*)
                   FROM emple
                   GROUP BY dept_no);
/*
   DEPT_NO DNOMBRE         Empleados
---------- -------------- ----------
        30 VENTAS                  6
*/
