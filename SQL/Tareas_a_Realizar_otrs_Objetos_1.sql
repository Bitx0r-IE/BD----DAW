/*Ejercicio_1:*/
/*Crear un sinónimo para la tabla DEPART de tu esquema llamado DEP. Comprueba que 
se ha creado y que funciona.*/

CREATE SYNONYM DEP
FOR DEPART;
/*
Synonym DEP creado
*/
SELECT *
FROM user_synonyms;
/*
SYNONYM_NAME                                                                                                                     TABLE_OWNER                                                                                                                      TABLE_NAME                                                                                                                       DB_LINK                                                                                                                          ORIGIN_CON_ID
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------
DEP  
*/
SELECT *
FROM DEP;
/*
   DEPT_NO DNOMBRE        LOC           
---------- -------------- --------------
        10 CONTABILIDAD   SEVILLA       
        20 INVESTIGACION  MADRID        
        30 VENTAS         BARCELONA     
        40 PRODUCCION     BILBAO      
*/

SELECT *
FROM daw25.DEPART;
/*
   DEPT_NO DNOMBRE        LOC           
---------- -------------- --------------
        10 CONTABILIDAD   SEVILLA       
        20 INVESTIGACION  MADRID        
        30 VENTAS         BARCELONA     
        40 PRODUCCION     BILBAO        
*/

-------------------------------------------------------------------------------------------

/*Ejercicio_2:*/
/*Cambiar el nombre de la tabla DEPART a DEPARTAMENTOS. Comprobar si es válido 
el sinónimo DEP.*/

RENAME daw25.depart depart TO daw25.departamentos;
RENAME depart TO departamentos;--Lo mismo que el anterior

SELECT * FROM user_synonyms; -- sigue siendo la tabla "depart" (nombre viejo)
SELECT * FROM dep; -- ERROR (el sinonimo esta vinculado al objeto con el nombre viejo en caso de cambiar de nombre hay que rehacerlo)

RENAME departamentos TO depart; -- revertir los cambios

--------------------------------------------------------------------------------------

/*Ejercicio_3:*/
/*En el sistema existe el esquema SCOTT. El administrador de la base de datos ha 
dado a tu usuario permiso para consultar la tabla de SCOTT denominada SALGRADE. 
Realiza una consulta de todos los datos de esa tabla.
NOTA: Recuerda SELECT [*|col1, col2, ...] FROM [esquema.] tabla/s ...*/

SELECT *
FROM SCOTT.SALGRADE;
/*
     GRADE      LOSAL      HISAL
---------- ---------- ----------
         1        700       1200
         2       1201       1400
         3       1401       2000
         4       2001       3000
         5       3001       9999
*/

---------------------------------------------------------------------------------------

/*Ejercicio_4:*/
/*Abre una nueva conexión de la base de datos con el usuario SCOTT (contraseña 
egibide).*/

--Conexión sql nueva.

---------------------------------------------------------------------------------------

/*Ejercicio_5:*/
/*Siendo el usuario SCOTT
1. crea un sinónimo, denominado CSALxx, para que pueda ser usado por tu usuario 
DAWxx, para trabajar con la tabla de SCOTT llamada SALGRADE. Siendo xx el número 
de tu usuario de base de datos en el aula.*/

--Desde SCOTT:

CREATE SYNONYM DAW25.CSAL25
FOR scot.salgrade;

/*2. crea un sinónimo público, denominado GRADOSALxx para la tabla de SCOTT denominada
SALGRADE. Siendo xx el número de tu usuario de base de datos en el aula.*/

--Desde SCOTT:

CREATE PUBLIC SYNONYM GRADOSAL25
FOR scott.salgrade;

----------------------------------------------------------------------------------------

/*Ejercicio_6:*/
/*Abre una sesión con tu usuario DAWxx.
1. Mira el nombre de los sinónimos que tienes asociados a tu esquema, así como 
el nombre de la tabla y tabla propietaria.*/

SELECT SYNONYM_NAME, TABLE_NAME, TABLE_OWNER
FROM USER_SYNONYMS

/*2. Comprueba que existe el sinónimo público que acaba de crear SCOTT.
NOTA: Recuerda que debes usar la vista del diccionario ALL_VIEWS*/
/*3. Usando el sinónimo CSALxx accede al contenido de la tabla SALGRADE de SCOTT.*/
/*4. Nos acaban de decir que SCOTT ha creado un sinónimo público denominado GRADOSALxx
para la tabla de SCOTT denominada SALGRADE. Probamos si podemos usarlo para ver 
todo el contenido de la tabla.*/
/*5. Borra el sinónimo DEP.*/