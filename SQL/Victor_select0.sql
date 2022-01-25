/* Victor Ibañez Emborujo */
set linesize 1000
set pagesize 3000

/* Enunciado 1: A partir de la tabla EMPLE , obtener todos los datos de aquellos empleados cuyo 
apellido empiece por una 'J'*/

SELECT * 
FROM EMPLE 
WHERE UPPER(apellido) LIKE 'J%';
/*
 EMP_NO APELLIDO   OFICIO             ID_JEFE FECHA_AL    SALARIO COMISION_PCT    DEPT_NO
---------- ---------- --------------- ---------- -------- ---------- ------------ ----------
      7566 JIMENEZ    GERENTE               7839 12/04/81       3867                      20
      7900 JIMENO     PROGRAMADOR           7566 13/12/81       1235                      30

*/

/* Enunciado 2: Obtener todos los datos de aquellos empleados cuyo apellido tengan una 'R' 
en la segunda posiición*/

SELECT * 
FROM EMPLE 
WHERE UPPER(apellido) LIKE '_R%';
/*

    EMP_NO APELLIDO   OFICIO             ID_JEFE FECHA_AL    SALARIO COMISION_PCT    DEPT_NO
---------- ---------- --------------- ---------- -------- ---------- ------------ ----------
      7499 ARROYO     COMERCIAL             7698 20/02/80       2080           10         30

*/

/* Enunciado 3: Obtener todos los datos de aquellos empleados cuyo apellido empiece por 'A' 
y tengan una 'O' en su interior*/

SELECT * 
FROM EMPLE 
WHERE UPPER(apellido) LIKE 'A%O';   
/*
        EMP_NO APELLIDO   OFICIO             ID_JEFE FECHA_AL    SALARIO COMISION_PCT    DEPT_NO
    ---------- ---------- --------------- ---------- -------- ---------- ------------ ----------
          7499 ARROYO     COMERCIAL             7698 20/02/80       2080           10         30

*/
/* Enunciado 4: A partir de la tabla EMPLE, obtener el apellido y el salario de los empleados
 cuyo salario ANUAL (es el salario de latabla por 14 pagas) esté comprendido entre 
 10000 y 200000.*/

SELECT apellido, salario, salario*14 "SALARIO ANUAL"
FROM EMPLE 
WHERE salario*14 BETWEEN 10000 AND 200000
--ORDER BY salario*14 DESC--
; 
/*
APELLIDO      SALARIO SALARIO ANUAL
---------- ---------- -------------
REY              6500         91000
JIMENEZ          3867         54138
NEGRO            3705         51870
CEREZO           3185         44590
GIL              3900         54600
FERNANDEZ        3900         54600
ARROYO           2080         29120
SALA             1625         22750
MARTIN           1625         22750
TOVAR            1950         27300
JIMENO           1235         17290

APELLIDO      SALARIO SALARIO ANUAL
---------- ---------- -------------
SANCHEZ          1040         14560
ALONSO           1430         20020
SANCHEZ          1690         23660

*/
/* Enunciado 5: A partir de la tabla EMPLE, obtener el apellido y el salario de los empleados cuyo
 salario ANUAL NO esté comprendido entre 10000 y 200000.*/

SELECT apellido, salario, salario*14 "SALARIO ANUAL"
FROM EMPLE 
WHERE salario*14 NOT BETWEEN 10000 AND 200000
/*
No se ha seleccionado ninguna fila
*/
/* Enunciado 6: Consultar los apellidos de la tabla EMPLE cuyo oficio sea ‘VENDEDOR’, ‘ANALISTA’
 o ’EMPLEADO’.*/

SELECT apellido 
FROM EMPLE 
WHERE UPPER(oficio) IN ('VENDEDOR', 'ANALISTA', 'EMPLEADO');
/*
APELLIDO  
----------
GIL
FERNANDEZ
*/

/* Enunciado 7: Consultar los apellidos de la tabla EMPLE cuyo oficio no sea ni ‘VENDEDOR’, ni
‘ANALISTA’ ni ’EMPLEADO’.*/

SELECT apellido 
FROM EMPLE 
WHERE UPPER(oficio) NOT IN ('VENDEDOR', 'ANALISTA', 'EMPLEADO');
/*
APELLIDO  
----------
REY
JIMENEZ
NEGRO
CEREZO
ARROYO
SALA
MARTIN
TOVAR
JIMENO
SANCHEZ
ALONSO

APELLIDO  
----------
SANCHEZ

12 filas seleccionadas. 
*/
/* Enunciado 8: A partir de la tabla EMPLE, obtener el apellido de los empleados cuyo departamento 
sea 10 o 30.*/

SELECT apellido
FROM EMPLE
WHERE dept_no IN (10, 30);
/*
APELLIDO  
----------
REY
NEGRO
CEREZO
ARROYO
SALA
MARTIN
TOVAR
JIMENO
SANCHEZ

9 filas seleccionadas. 
*/

/* Enunciado 9: Consultar los empleados cuyo departamento no sea ni 10 ni 30.*/

SELECT apellido
FROM EMPLE
WHERE dept_no NOT IN (10, 30);
/*
APELLIDO  
----------
JIMENEZ
GIL
FERNANDEZ
SANCHEZ
ALONSO
*/

/* Enunciado 10: Consultar los apellidos de los empleados cuya comisión es nula.*/

SELECT apellido
FROM EMPLE
WHERE comision_pct IS NULL;
/*
APELLIDO  
----------
REY
JIMENEZ
NEGRO
CEREZO
GIL
FERNANDEZ
JIMENO
SANCHEZ
ALONSO
SANCHEZ

10 filas seleccionadas. 
*/

/* Enunciado 11: Obtener los apellidos de empleados que tienen comisión.*/

SELECT apellido
FROM EMPLE
WHERE comision_pct IS NOT NULL;
/*
APELLIDO  
----------
ARROYO
SALA
MARTIN
TOVAR
*/
