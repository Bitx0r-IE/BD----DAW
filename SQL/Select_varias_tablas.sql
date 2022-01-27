/*Ejercicio_1:*/
/*A partir de las tablas EMPLE y DEPART obtener los siguientes datos de los 
empleados: apellido,oficio, número de empleado, nombre de departamento y 
localidad.*/

SELECT emple.apellido, emple.oficio, emple.emp_no, depart.dnombre, depart.loc
FROM EMPLE, DEPART
WHERE emple.dept_no = depart.dept_no;
/*
APELLIDO   OFICIO              EMP_NO DNOMBRE        LOC           
---------- --------------- ---------- -------------- --------------
CEREZO     GERENTE               7782 CONTABILIDAD   SEVILLA       
REY        PRESIDENTE            7839 CONTABILIDAD   SEVILLA       
SANCHEZ    AUXILIAR              7934 CONTABILIDAD   SEVILLA       
ALONSO     PROGRAMADOR           7876 INVESTIGACION  MADRID        
SANCHEZ    PROGRAMADOR           7369 INVESTIGACION  MADRID        
GIL        ANALISTA              7788 INVESTIGACION  MADRID        
FERNANDEZ  ANALISTA              7902 INVESTIGACION  MADRID        
JIMENEZ    GERENTE               7566 INVESTIGACION  MADRID        
JIMENO     PROGRAMADOR           7900 VENTAS         BARCELONA     
TOVAR      COMERCIAL             7844 VENTAS         BARCELONA     
MARTIN     COMERCIAL             7654 VENTAS         BARCELONA     

APELLIDO   OFICIO              EMP_NO DNOMBRE        LOC           
---------- --------------- ---------- -------------- --------------
SALA       COMERCIAL             7521 VENTAS         BARCELONA     
NEGRO      GERENTE               7698 VENTAS         BARCELONA     
ARROYO     COMERCIAL             7499 VENTAS         BARCELONA 
*/

/*Ejercicio_2:*/
/*Queremos consultar los datos de los empleados y el nombre de la localidad de 
aquellos que trabajan en ‘MADRID’ o ‘BARCELONA’.*/

SELECT emple.*, depart.loc
FROM emple, depart
WHERE emple.dept_no = depart.dept_no
AND lower(depart.loc) IN ('madrid', 'barcelona'); 
/*
    EMP_NO APELLIDO   OFICIO             ID_JEFE FECHA_AL    SALARIO COMISION_PCT    DEPT_NO LOC           
---------- ---------- --------------- ---------- -------- ---------- ------------ ---------- --------------
      7876 ALONSO     PROGRAMADOR           7788 23/09/81       1430                      20 MADRID        
      7369 SANCHEZ    PROGRAMADOR           7566 17/12/80       1040                      20 MADRID        
      7788 GIL        ANALISTA              7566 19/11/81       3900                      20 MADRID        
      7902 FERNANDEZ  ANALISTA              7566 13/12/81       3900                      20 MADRID        
      7566 JIMENEZ    GERENTE               7839 12/04/81       3867                      20 MADRID        
      7900 JIMENO     PROGRAMADOR           7566 13/12/81       1235                      30 BARCELONA     
      7844 TOVAR      COMERCIAL             7698 18/09/81       1950            8         30 BARCELONA     
      7654 MARTIN     COMERCIAL             7698 29/09/81       1625            5         30 BARCELONA     
      7521 SALA       COMERCIAL             7698 22/02/81       1625            5         30 BARCELONA     
      7698 NEGRO      GERENTE               7839 11/05/81       3705                      30 BARCELONA     
      7499 ARROYO     COMERCIAL             7698 20/02/80       2080           10         30 BARCELONA     
*/

/*Ejercicio_3:*/
/*Obtener para cada empleado (código y apellidos), así como los apellidos de su 
jefe. La columna JEFE de un empleado indica el numero de empleado de su jefe.*/

SELECT e.emp_no, e.apellido, j.apellido "Su jefe es"
FROM emple e, emple j
WHERE e.id_jefe = j.emp_no;
/*EL espacio e y espacio j son los alias que se les daa las tablas, tanto
para acortar la contidad de código a escribir, como para no tener que repetir el
mismo nombre*/
/*
    EMP_NO APELLIDO   Su jefe es
---------- ---------- ----------
      7369 SANCHEZ    JIMENEZ   
      7900 JIMENO     JIMENEZ   
      7902 FERNANDEZ  JIMENEZ   
      7788 GIL        JIMENEZ   
      7521 SALA       NEGRO     
      7844 TOVAR      NEGRO     
      7654 MARTIN     NEGRO     
      7499 ARROYO     NEGRO     
      7934 SANCHEZ    CEREZO    
      7876 ALONSO     GIL       
      7566 JIMENEZ    REY       

    EMP_NO APELLIDO   Su jefe es
---------- ---------- ----------
      7698 NEGRO      REY       
      7782 CEREZO     REY       
*/

/*Ejercicio_4:*/
/*Visualizar el apellido, el oficio y la localidad de los departamentos donde 
trabajan los ANALISTAS.*/

SELECT e.apellido, e.oficio, d.loc
FROM emple e, depart d
WHERE e.dept_no = d.dept_no
AND LOWER(e.oficio) = 'analista';
/*
APELLIDO   OFICIO          LOC           
---------- --------------- --------------
GIL        ANALISTA        MADRID        
FERNANDEZ  ANALISTA        MADRID
*/

/*Ejercicio_5:*/
/*Mostrar para cada empleado quién es su jefe (apellido ). Si no tiene jefe, 
mostrar ausencia de valor(NULL).*/

SELECT e.emp_no, j.apellido "Su jefe es"
FROM emple e, emple j
WHERE e.id_jefe = j.emp_no(+); 
/*

*/

/*Ejercicio_6:*/
/*Mostrar para todos los departamentos que tenemos en la empresa los apellidos 
de los empleados que pertenecen a cada uno de ellos. Si algún departamento está 
vacío, mostrar ausencia de valor NULL.*/
 
SELECT emple.apellido, depart.dnombre
FROM emple, depart
WHERE emple.dept_no(+) = depart.dept_no;
/*
APELLIDO   DNOMBRE       
---------- --------------
CEREZO     CONTABILIDAD  
REY        CONTABILIDAD  
SANCHEZ    CONTABILIDAD  
ALONSO     INVESTIGACION 
SANCHEZ    INVESTIGACION 
GIL        INVESTIGACION 
FERNANDEZ  INVESTIGACION 
JIMENEZ    INVESTIGACION 
JIMENO     VENTAS        
TOVAR      VENTAS        
MARTIN     VENTAS        

APELLIDO   DNOMBRE       
---------- --------------
SALA       VENTAS        
NEGRO      VENTAS        
ARROYO     VENTAS        
           PRODUCCION 
*/

-------------------------------------------------------------------------------

--Select_Varias_Tablas_2:--

/*Ejercicio_1:*/
/*Crear un listado único con todos los oficios que haya en el departamento 10. 
Incluir la localidad del departamento en el resultado.*/

SELECT  e.oficio, e.dept_no, d.loc
FROM emple e, depart d
WHERE e.dept_no = d.dept_no
AND e.dept_no = 10;
/*
OFICIO             DEPT_NO LOC           
--------------- ---------- --------------
PRESIDENTE              10 SEVILLA       
GERENTE                 10 SEVILLA       
AUXILIAR                10 SEVILLA  
*/

/*Ejercicio_2:*/
/*Obtener la siguiente salida:
    DEPT_NO  DNOMBRE           Número de empleados
    -------  ----------------- -------------------
        10   CONTABILIDAD                       3
        20   INVESTIGACIÓN                      5
        30   VENTAS                             6
        40   PRODUCCIÓN                         0
*/
    
SELECT d.dept_no, d.dnombre, COUNT(e.emp_no) "Número de empleados"  
FROM emple e, depart d
WHERE e.dept_no(+) = d.dept_no
GROUP BY d.dept_no, d.dnombre
ORDER BY d.dept_no;
/*
   DEPT_NO DNOMBRE        Número de empleados
---------- -------------- -------------------
        10 CONTABILIDAD                     3
        20 INVESTIGACION                    5
        30 VENTAS                           7
        40 PRODUCCION                       0
*/

/*Ejercicio_3:*/
/*Visualizar el número de departamento, el nombre del departamento, y la cantidad 
de empleados del departamento con más empleados.*/

SELECT e.dept_no, d.dnombre, COUNT(e.emp_no) "Número de empleados"  
FROM emple e, depart d
GROUP BY d.dept_no, d.dnombre, e.dept_no 
HAVING e.dept_no = d.dept_no
AND COUNT(e.emp_no) = (SELECT MAX(COUNT(e.emp_no))
                       FROM emple e
                       GROUP BY e.dept_no)
ORDER BY dept_no;
/*
  DEPT_NO DNOMBRE        Número de empleados
---------- -------------- -------------------
        30 VENTAS                           7
*/

/*Ejercicio_4:*/
/*Mostrar el apellido, el nombre del departamento y el salario de cualquier 
empleado cuyo salario y comisión coincidan con los de cualquier empleado que 
trabaje en Barcelona, incluidos los que no tienen comisión.*/

SELECT e.apellido, d.dnombre, e.salario
FROM emple e, depart d
WHERE e.dept_no = d.dept_no
AND e.salario = ANY (SELECT e.salario
                     FROM emple e, depart d
                     WHERE UPPER(d.loc) = 'BARCELONA')
AND e.comision_pct = ANY (SELECT e.comision_pct
                          FROM emple e, depart d
                          WHERE UPPER(d.loc) = 'BARCELONA');
/*
APELLIDO   DNOMBRE           SALARIO
---------- -------------- ----------
TOVAR      VENTAS               1950
SALA       VENTAS               1625
MARTIN     VENTAS               1625
ARROYO     VENTAS               2080
*/