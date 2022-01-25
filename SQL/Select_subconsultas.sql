/*Ejercicio_1:*/
/*Obtener el apellido de los empleados que tienen el mismo oficio que ‘GIL’.*/

SELECT apellido, oficio
FROM emple
WHERE oficio = (SELECT oficio
                FROM emple
                WHERE UPPER(apellido) = 'GIL')
AND UPPER(apellido) NOT IN 'GIL';
--En caso de que existan más de un GIL, cambiar '=' por 'IN'--
--usar también DISTINCT para evitar datos REPETIVOS--
/*
APELLIDO   OFICIO         
---------- ---------------
FERNANDEZ  ANALISTA   
*/
/*
APELLIDO   OFICIO         
---------- ---------------
GIL        ANALISTA       
FERNANDEZ  ANALISTA      
*/

/*Ejercicio_2:*/
/*Queremos consultar los datos de los empleados que trabajan en las localidades 
de ‘MADRID’ o ‘BARCELONA’.*/

SELECT e.*, d.loc
FROM emple e, depart d
WHERE e.dept_no = d.dept_no
AND UPPER(d.loc) IN ('MADRID', 'BARCELONA');
/*
   EMP_NO APELLIDO   OFICIO             ID_JEFE FECHA_AL    SALARIO COMISION_PCT    DEPT_NO LOC           
---------- ---------- --------------- ---------- -------- ---------- ------------ ---------- --------------
      7566 JIMENEZ    GERENTE               7839 12/04/81       3867                      20 MADRID        
      7698 NEGRO      GERENTE               7839 11/05/81       3705                      30 BARCELONA     
      7788 GIL        ANALISTA              7566 19/11/81       3900                      20 MADRID        
      7902 FERNANDEZ  ANALISTA              7566 13/12/81       3900                      20 MADRID        
      7499 ARROYO     COMERCIAL             7698 20/02/80       2080           10         30 BARCELONA     
      7521 SALA       COMERCIAL             7698 22/02/81       1625            5         30 BARCELONA     
      7654 MARTIN     COMERCIAL             7698 29/09/81       1625            5         30 BARCELONA     
      7844 TOVAR      COMERCIAL             7698 18/09/81       1950            8         30 BARCELONA     
      7900 JIMENO     PROGRAMADOR           7566 13/12/81       1235                      30 BARCELONA     
      7369 SANCHEZ    PROGRAMADOR           7566 17/12/80       1040                      20 MADRID        
      7876 ALONSO     PROGRAMADOR           7788 23/09/81       1430                      20 MADRID        

    EMP_NO APELLIDO   OFICIO             ID_JEFE FECHA_AL    SALARIO COMISION_PCT    DEPT_NO LOC           
---------- ---------- --------------- ---------- -------- ---------- ------------ ---------- --------------
      7984 GUTIERREZ  PROGRAMADOR           7839 21/02/81       1450                      30 BARCELONA     
*/
/*v2*/

SELECT e.*
FROM emple e
WHERE e.dept_no IN (SELECT dept_no
                   FROM depart
                   WHERE lower(loc) IN ('madrid','barcelona'));
/*
    EMP_NO APELLIDO   OFICIO             ID_JEFE FECHA_AL    SALARIO COMISION_PCT    DEPT_NO
---------- ---------- --------------- ---------- -------- ---------- ------------ ----------
      7566 JIMENEZ    GERENTE               7839 12/04/81       3867                      20
      7698 NEGRO      GERENTE               7839 11/05/81       3705                      30
      7788 GIL        ANALISTA              7566 19/11/81       3900                      20
      7902 FERNANDEZ  ANALISTA              7566 13/12/81       3900                      20
      7499 ARROYO     COMERCIAL             7698 20/02/80       2080           10         30
      7521 SALA       COMERCIAL             7698 22/02/81       1625            5         30
      7654 MARTIN     COMERCIAL             7698 29/09/81       1625            5         30
      7844 TOVAR      COMERCIAL             7698 18/09/81       1950            8         30
      7900 JIMENO     PROGRAMADOR           7566 13/12/81       1235                      30
      7369 SANCHEZ    PROGRAMADOR           7566 17/12/80       1040                      20
      7876 ALONSO     PROGRAMADOR           7788 23/09/81       1430                      20

    EMP_NO APELLIDO   OFICIO             ID_JEFE FECHA_AL    SALARIO COMISION_PCT    DEPT_NO
---------- ---------- --------------- ---------- -------- ---------- ------------ ----------
      7984 GUTIERREZ  PROGRAMADOR           7839 21/02/81       1450                      30
*/

/*Ejercicio_3:*/
/*Obtener el apellido de los empleados con el mismo oficio y salario que ‘GIL’.*/

SELECT apellido 
FROM emple
WHERE oficio IN (SELECT DISTINCT oficio  --CASO de que existan más de un GIL(en clase se creó otro gil)--
                FROM emple
                WHERE UPPER(apellido)='GIL')
AND salario = (SELECT salario
               FROM emple
               WHERE UPPER(apellido)='GIL')
AND UPPER(apellido) NOT IN 'GIL';
/*
APELLIDO  
----------
FERNANDEZ
*/

/*Ejercicio_4:*/
/*Mostrar los empleados (nombre, oficio, salario y fecha de alta) que desempeñen 
el mismo oficio que "JIMENEZ" o que tengan un salario mayor o igual que "FERNANDEZ".
Nota: se supone que puede haber mas que un fernandez y un jimenez en la empresa*/

SELECT apellido, oficio, salario, fecha_alta
FROM emple
WHERE (oficio IN (SELECT DISTINCT oficio
                FROM emple
                WHERE UPPER(apellido) = 'JIMENEZ')
OR salario >= ALL (SELECT salario
                   FROM emple
                   WHERE UPPER(apellido) = 'FERNANDEZ'))
AND UPPER(apellido) NOT IN ('JIMENEZ','FERNANDEZ');
/*
APELLIDO   OFICIO             SALARIO FECHA_AL
---------- --------------- ---------- --------
REY        PRESIDENTE            6500 17/11/81
JIMENEZ    GERENTE               3867 12/04/81
NEGRO      GERENTE               3705 11/05/81
CEREZO     GERENTE               3185 19/06/81
GIL        ANALISTA              3900 19/11/81
FERNANDEZ  ANALISTA              3900 13/12/81
*/

/*Ejercicio_5:*/
/*Visualizar el número de departamento y la cantidad de empleados del 
departamento con más empleados.*/

SELECT dept_no "nº departamento", COUNT(*) "Empleados"
FROM emple
GROUP BY dept_no
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                  FROM emple
                  GROUP BY dept_no);
/*
nº departamento  Empleados
--------------- ----------
             30          6

*/

/*Ejercicio_6:*/
/*Buscar el oficio con el salario medio más bajo.*/

SELECT oficio, AVG(salario)
FROM emple
GROUP BY oficio
HAVING AVG(salario) = (SELECT MIN(AVG(salario))
                      FROM emple
                      GROUP BY oficio);
/*
OFICIO          AVG(SALARIO)
--------------- ------------
PROGRAMADOR             1235

*/

/*Ejercicio_7*/
/*¿Qué es incorrecto en esta sentencia?
SELECT EMP_NO, APELLIDO
FROM EMPLE
WHERE SALARIO = (SELECT MIN(SALARIO))
                 FROM EMPLE
                 GROUP BY DEPT_NO);*/
SELECT EMP_NO, APELLIDO
FROM EMPLE
WHERE SALARIO = (SELECT MIN(SALARIO)
                 FROM EMPLE);
/*
    EMP_NO APELLIDO  
---------- ----------
      7369 SANCHEZ   
*/

/*Ejercicio_8:*/
/*¿Qué ocurre con la siguiente sentencia?
SELECT APELLIDO, OFICIO
FROM EMPLE
WHERE OFICIO = (SELECT OFICIO
                FROM EMPLE
                WHERE APELLIDO = 'PEREZ');*/

SELECT APELLIDO, OFICIO
FROM EMPLE
WHERE OFICIO = (SELECT OFICIO
                FROM EMPLE
                WHERE UPPER(APELLIDO) = 'PEREZ');
/*No hay nadie con el apellido Perez*/
/*¿Qué ocurriría si existiera un oficio con valor nulo?*/

/*Ejercicio_9:*/
/*Mostrar los apellidos de los empleados que no tienen subordinados.*/

SELECT apellido, oficio
FROM emple
WHERE id_jefe IS NOT NULL;
/*
APELLIDO   OFICIO         
---------- ---------------
JIMENEZ    GERENTE        
NEGRO      GERENTE        
CEREZO     GERENTE        
GIL        ANALISTA       
FERNANDEZ  ANALISTA       
ARROYO     COMERCIAL      
SALA       COMERCIAL      
MARTIN     COMERCIAL      
TOVAR      COMERCIAL      
JIMENO     PROGRAMADOR    
SANCHEZ    PROGRAMADOR    

APELLIDO   OFICIO         
---------- ---------------
ALONSO     PROGRAMADOR    
SANCHEZ    AUXILIAR      
*/

/*Ejercicio_10:*/
/*Mostrar los apellidos de los empleados que tienen subordinados.*/

SELECT apellido, oficio
FROM emple
WHERE id_jefe IS NULL;
/*
APELLIDO   OFICIO         
---------- ---------------
REY        PRESIDENTE   
*/

/*Ejercicio_11:*/
/*Escribir una consulta para mostrar los códigos de empleado y los apellidos de 
todos los empleados que trabajen en un departamento con cualquier empleado cuyo 
apellido contenga una 'U'.*/

SELECT emp_no, apellido
FROM emple
WHERE dept_no = (SELECT dept_no
                 FROM emple
                 WHERE UPPER(apellido) LIKE '%U%');
/*
    EMP_NO APELLIDO  
---------- ----------
      7698 NEGRO     
      7499 ARROYO    
      7521 SALA      
      7654 MARTIN    
      7844 TOVAR     
      7900 JIMENO    
      7984 GUTIERREZ 
*/

/*Ejercicio_12:*/
/*Modificar la consulta anterior para mostrar los códigos de empleado y los 
apellidos de todos los empleados que ganan más del salario medio y que trabajen 
en un departamento con un empleado que tenga una 'U' en su apellido.*/

SELECT emp_no, apellido
FROM emple
WHERE dept_no = (SELECT dept_no
                 FROM emple
                 WHERE UPPER(apellido) LIKE '%U%'
                 AND salario > AVG(salario));
                 
/*Ejercicio_13:*/
/*Escribir una consulta para mostrar el apellido, número de departamento y el 
salario de cualquier empleado cuyo número de departamento y salario coincidan 
con el número de departamento y salario de cualquier empleado que ganen comisión.*/

SELECT apellido, dept_no, salario
FROM emple
WHERE dept_no IN (SELECT dept_no
                 FROM emple
                 WHERE comision_pct IS NOT NULL)
AND salario IN (SELECT salario
               FROM emple
               WHERE comision_pct IS NOT NULL);
/*
APELLIDO      DEPT_NO    SALARIO
---------- ---------- ----------
TOVAR              30       1950
SALA               30       1625
MARTIN             30       1625
ARROYO             30       2080
SANCHEZ            20       1040
SANCHEZ            10       1690
*/

/*Ejercicio_14:*/
/*Escribir una consulta para encontrar todos los empleados que ganan más que el 
salario medio de sus departamentos. Mostrar el apellido, el salario y el código 
del departamento*/

SELECT e.apellido, e.salario, e.dept_no
FROM emple e
WHERE salario > (SELECT AVG(emp.salario)
                 FROM emple emp
                 WHERE emp.dept_no = e.dept_no);
/*
APELLIDO      SALARIO    DEPT_NO
---------- ---------- ----------
REY              6500         10
JIMENEZ          3867         20
NEGRO            3705         30
GIL              3900         20
FERNANDEZ        3900         20
ARROYO           2080         30
*/
/*Ejercicio_15:*/
/*Modificar el ejercicio anterior para visualizar el apellido, el salario, el 
código del departamento y el salario medio de los sueldos de ese departamento. 
Ordenar por salario medio.*/

SELECT e.apellido, e.salario, e.dept_no, AVG(salario) "salario medio"
FROM emple e
GROUP BY e.dept_no, e.salario, e.apellido
HAVING salario > (SELECT AVG(salario)
                 FROM emple emp
                 WHERE emp.dept_no = e.dept_no);
/*

*/