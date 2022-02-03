/*Ejercicio_1:*/
/*Crear la tabla CENTROS siguiendo el modelo de la figura, teniendo en cuenta que 
el modelo físico se va a implementar en un SGBD Oracle 12c y que la columna id 
debe ser auto-incremental (=AS IDENTITY). Los valores de la columna id serán siempre 
generados por el SGBD Oracle.
NOTA: Recuerda * delante del nombre de una columna indica que es obligatorio que 
tenga valor.*/

CREATE TABLE CENTROS (
ID NUMBER(2) GENERATED ALWAYS AS IDENTITY MAXVALUE 99,
NOMBRE VARCHAR2(30) NOT NULL,
CALLE VARCHAR2(30),
NUMERO NUMBER(2),
CP VARCHAR2(5),
CIUDAD VARCHAR2(15),
PROVINCIA VARCHAR2(40),
TELEFONO VARCHAR2(9),
CONSTRAINT CENTROS_ID_PK PRIMARY KEY (id)
);
/*Table CENTROS creado.*/

desc centros;
/*
Nombre    ¿Nulo?   Tipo         
--------- -------- ------------ 
ID        NOT NULL NUMBER(2)    
NOMBRE    NOT NULL VARCHAR2(30) 
CALLE              VARCHAR2(30) 
NUMERO             NUMBER(2)    
CP                 VARCHAR2(5)  
CIUDAD             VARCHAR2(15) 
PROVINCIA          VARCHAR2(40) 
TELEFONO           VARCHAR2(9)
*/

SELECT a.constraint_name, a.constraint_type, a.search_condition, b.*
FROM user_constraints a, user_cons_columns b
WHERE a.constraint_name = b.constraint_name
AND UPPER(a.table_name) = 'CENTROS';
/*
CONSTRAINT_NAME                                                                                                                  C SEARCH_CONDITION                                                                 OWNER                                                                                                                            CONSTRAINT_NAME                                                                                                                  TABLE_NAME
-------------------------------------------------------------------------------------------------------------------------------- - -------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- --------------------------------------------------------------------------------------------------------------------------------
COLUMN_NAME
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  POSITION
----------

CENTROS_ID_PK                                                                                                                    P                                                                                  DAW25                                                                                                                            CENTROS_ID_PK                                                                                                                    CENTROS                                                                                                                          
ID                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
         1

*/

SELECT table_name, column_name, data_default, identity_column
FROM user_tab_columns
WHERE upper(table_name) = 'CENTROS';
/*
TABLE_NAME                                                                                                                       COLUMN_NAME                                                                                                                      DATA_DEFAULT                                                                     IDE
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------- ---
CENTROS                                                                                                                          ID                                                                                                                               "DAW25"."ISEQ$$_449658".nextval                                                  YES
CENTROS                                                                                                                          NOMBRE                                                                                                                                                                                                            NO 
CENTROS                                                                                                                          CALLE                                                                                                                                                                                                             NO 
CENTROS                                                                                                                          NUMERO                                                                                                                                                                                                            NO 
CENTROS                                                                                                                          CP                                                                                                                                                                                                                NO 
CENTROS                                                                                                                          CIUDAD                                                                                                                                                                                                            NO 
CENTROS                                                                                                                          PROVINCIA                                                                                                                                                                                                         NO 
CENTROS                                                                                                                          TELEFONO                                                                                                                                                                                                          NO 
*/

------------------------------------------------------------------------------------

/*Ejercicio_2:*/
/*Realiza la inserción de un centro. Inventa los datos.*/

INSERT INTO CENTROS(nombre, calle, numero, cp, ciudad, provincia, telefono) 
         VALUES('JAVI', 'QUINTO COLON',21, 01034, 'BURGOS','MIRANDA',657388664);
         
SELECT * FROM CENTROS;
/*
        ID NOMBRE                         CALLE                              NUMERO CP    CIUDAD          PROVINCIA                                TELEFONO 
---------- ------------------------------ ------------------------------ ---------- ----- --------------- ---------------------------------------- ---------
         1 JAVI                           QUINTO COLON                           21 1034  BURGOS          MIRANDA                                  657388664
*/

-------------------------------------------------------------------------------------

/*Ejercicio_3:*/
/*Crea una tabla, que tenga la misma estructura y datos que la tabla DEPART, 
denominada DEPARTSEQ.
NOTA: Recuerda que las restricciones no se crean.*/