desc ciclistas
desc equipos
desc etapas

SELECT COUNT(dorsal)
FROM ciclistas;
/*
COUNT(DORSAL)
-------------
           14
*/
/*
SELECT COUNT(*)
FROM ciclistas;
*/
SELECT DISTINCT COD_EQUIPO
FROM ciclistas;
/*
COD_
----
0001
0005
0002
0004
0003
*/
/*Ejercicio_1*/

SELECT COUNT(*) AS "TOTAL CICLISTAS", 
COUNT(DISTINCT COD_EQUIPO) AS "TOTAL EQUIPOS"
FROM ciclistas;
/*
TOTAL CICLISTAS TOTAL EQUIPOS
--------------- -------------
             14             5
*/

/*Ejercicio_2*/

SELECT cod_equipo AS "25-Equipo", COUNT(*) AS "25-Cant. Ciclistas"
FROM ciclistas
GROUP BY cod_equipo;
/*
25-E 25-Cant. Ciclistas
---- ------------------
0001                  4
0005                  2
0002                  3
0004                  3
0003                  2
*/

/*Ejercicio_3*/

SELECT SUM(NUM_KMS) AS "TOTAL KMS"
FROM etapas;
/*
TOTAL KMS
----------
      1610

*/

/*Ejercicio_4*/

SELECT TIPO AS "25-Tipo etapa", AVG(NUM_KMS) AS "25-Media kms"
FROM etapas
GROUP BY tipo;
/*
25-Tipo etapa                  25-Media kms
------------------------------ ------------
Alta Montaña                            181
Contrarreloj                             29
Media Montaña                           203
Llana                                 201,5
*/

/*Ejercicio_5*/

SELECT SUM(NUM_KMS) AS "Km. Totales Montaña"
FROM etapas
WHERE UPPER(tipo) LIKE '%MONTAÑA%';
/*
Km. Totales Montaña
-------------------
                746
*/

/*Ejercicio_6*/

SELECT TIPO AS "25-Tipo etapas", AVG(NUM_KMS) AS "25-Media Kms"
FROM etapas
GROUP BY tipo
HAVING AVG(NUM_KMS)<150;
/*
25-Tipo etapas                 25-Media Kms
------------------------------ ------------
Contrarreloj                             29

*/