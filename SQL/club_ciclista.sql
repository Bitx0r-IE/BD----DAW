REM **** Borrado de las tablas

drop table equipos cascade constraint;
drop table ciclistas cascade constraint;
drop table etapas cascade constraint;
drop table clasificacionesetapas cascade constraint;

REM **** Creacion de las tablas

CREATE TABLE equipos(
codequipo VARCHAR2(4), 
nombre VARCHAR2(30) NOT NULL,
nacionalidad VARCHAR2(20),
nombredirector VARCHAR2(20),
CONSTRAINT equi_codequipo_pk PRIMARY KEY(codequipo),
CONSTRAINT equi_nombredir_ck CHECK(nombreDirector=UPPER(nombredirector))
);

CREATE TABLE ciclistas(
Dorsal NUMBER(3),
nombre VARCHAR2(30) NOT NULL, 
nacionalidad VARCHAR2(20),
cod_equipo VARCHAR2(4),
fecha_nac DATE,
CONSTRAINT cicl_dorsal_pk PRIMARY KEY(Dorsal),
CONSTRAINT cicl_cod_equipo_fk FOREIGN KEY(cod_equipo)   
                        REFERENCES equipos(codEquipo),
CONSTRAINT cicl_dorsal_ck CHECK( Dorsal BETWEEN 1 AND 99) 
);

CREATE TABLE etapas(
num_etapa NUMBER(2),
num_kms NUMBER(3),
tipo VARCHAR2(30),
fecha DATE,
CONSTRAINT etap_numetapa_pk PRIMARY KEY(num_etapa),
CONSTRAINT etap_fecha_ck CHECK (fecha BETWEEN
                                TO_DATE('19/07/2021','DD/MM/YYYY')
                                AND TO_DATE('20/08/2021', 'DD/MM/YYYY'))
);

CREATE TABLE clasificacionesetapas(
numetapa NUMBER(2),
dorsal NUMBER(3),
posicion VARCHAR2(8), 
distancia_ganador NUMBER,
CONSTRAINT clas_clasificacion_pk PRIMARY KEY(numetapa, dorsal),
CONSTRAINT clas_numetapa_fk FOREIGN KEY(numetapa) REFERENCES etapas(num_etapa), 
CONSTRAINT clas_dorsal_fk FOREIGN KEY(dorsal) REFERENCES ciclistas(Dorsal),
CONSTRAINT clas_posicion_ck CHECK (posicion BETWEEN '1' AND '99')
);

/* EJERCICIO 2-A */

ALTER TABLE etapas
ADD CONSTRAINT etap_tipo_ck CHECK(tipo IN('Llana', 'Media Montaña',
                                    'Alta Montaña', 'Contrarreloj'));

/* EJERCICIO 2-B */

ALTER TABLE etapas
ADD premio NUMBER(5);


/* EJERCICIO 2-C */

ALTER TABLE CLASIFICACIONESETAPAS
DROP CONSTRAINT clas_posicion_ck;
 
ALTER TABLE CLASIFICACIONESETAPAS
ADD CONSTRAINT clas_posicion_ck
CHECK (Posicion = 'Abandono' OR Posicion BETWEEN '1' and '99');


/*EJERCICIO 3*/

INSERT INTO equipos (NACIONALIDAD, NOMBRE, NOMBREDIRECTOR, CODEQUIPO)
VALUES('FRANCES', 'FDJ', 'PHILIPPE MAUDUIT', 0004);

/*EJERCICIO 4*/

// Equipos

INSERT INTO equipos(codequipo,nombre,nacionalidad,nombredirector) 
    VALUES('0001', 'Movistar Team', 'Española', 'JOSE LUIS ARRIETA');
INSERT INTO equipos(codequipo,nombre,nacionalidad,nombredirector) 
    VALUES('0002', 'Trek-Segafredo', 'Estadounidense', 'KIM ANDERSEN');
INSERT INTO equipos(codequipo,nombre,nacionalidad,nombredirector) 
    VALUES('0003', 'Team Ineos', 'Inglesa', 'NICOLAS PORTAL');
INSERT INTO equipos(codequipo,nombre,nacionalidad,nombredirector) 
    VALUES('0005', 'EF Education First', 'Estadounidense', 'TOM SOUTHAM');
INSERT INTO equipos(codequipo,nombre,nacionalidad,nombredirector) 
    VALUES('0004', 'FDJ', 'Francesa', 'PHILIPPE MAUDUIT');

// Ciclistas

INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
    VALUES (1, 'Quintana','Colombiana', '0001', TO_DATE('04/02/90','DD/MM/YY') );
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (2, 'Valverde', 'Española', '0001', TO_DATE('25/04/80','DD/MM/YY'));
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (3, 'Erviti', 'Española', '0001', TO_DATE('15/11/83','DD/MM/YY'));
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (4, 'Landa', 'Española', '0001', TO_DATE('13/12/89','DD/MM/YY'));
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (5, 'Porte', 'Australiana', '0002',TO_DATE('30/01/85','DD/MM/YY') );
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (6, 'Bernard', 'Francesa', '0002', TO_DATE('17/03/92','DD/MM/YY'));
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (7, 'Ciccone', 'Italiana', '0002',TO_DATE('20/12/94','DD/MM/YY') );
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (8, 'Thomas', 'Inglesa', '0003',TO_DATE('25/05/86','DD/MM/YY') );
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (9, 'Bernal', 'Colombiana', '0003', TO_DATE('13/01/97','DD/MM/YY'));
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (10, 'Bonnet', 'Francesa', '0004', TO_DATE('25/06/82','DD/MM/YY'));
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (11, 'Gaudu', 'Francesa', '0004', TO_DATE('10/10/96','DD/MM/YY'));
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (12, 'Rous', 'Francesa', '0004', TO_DATE('18/04/87','DD/MM/YY'));
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (13, 'Uran', 'Colombiana', '0005', TO_DATE('26/01/87','DD/MM/YY'));
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (14, 'Bettiol', 'Italiana', '0005', TO_DATE('29/10/93','DD/MM/YY'));

// Etapas

INSERT INTO etapas(num_etapa, num_kms, tipo, fecha) 
    VALUES (1, 9, 'Contrarreloj',TO_DATE('27/07/21','DD/MM/YY'));
INSERT INTO etapas(num_etapa, num_kms, tipo, fecha) 
    VALUES (2, 185, 'Llana',TO_DATE('28/07/21','DD/MM/YY'));
INSERT INTO etapas(num_etapa, num_kms, tipo, fecha, Premio) 
    VALUES (3, 198, 'Llana',TO_DATE('29/07/21','DD/MM/YY'),NULL);
INSERT INTO etapas(num_etapa, num_kms, tipo, fecha, Premio) 
    VALUES (4, 139, 'Alta Montaña',TO_DATE('30/07/21','DD/MM/YY'),NULL);
INSERT INTO etapas(num_etapa, num_kms, tipo, fecha, Premio) 
    VALUES (5, 229, 'Alta Montaña',TO_DATE('31/07/21','DD/MM/YY'),NULL);
INSERT INTO etapas(num_etapa, num_kms, tipo, fecha, Premio) 
    VALUES (6, 49, 'Contrarreloj', TO_DATE('02/08/21','DD/MM/YY'),NULL);
INSERT INTO etapas(num_etapa, num_kms, tipo, fecha, Premio) 
    VALUES (7, 203, 'Media Montaña', TO_DATE('03/08/21','DD/MM/YY'),NULL);
INSERT INTO etapas(num_etapa, num_kms, tipo, fecha, Premio)
    VALUES (8, 144, 'Llana',TO_DATE('04/08/21','DD/MM/YY'),NULL);
INSERT INTO etapas(num_etapa, num_kms, tipo, fecha, Premio) 
    VALUES (9, 175, 'Alta Montaña',TO_DATE('05/08/21','DD/MM/YY'),NULL);
INSERT INTO etapas(num_etapa, num_kms, tipo, fecha, Premio) 
    VALUES (10, 239, 'Llana',TO_DATE('06/08/21','DD/MM/YY'),NULL);

// Clasificaciones de las Etapas

INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion, distancia_ganador)  
    VALUES(1, 1, '1', 0);
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion) 
    VALUES(1, 2, 'Abandono');
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion, distancia_ganador) 
    VALUES(1, 4, '2', 04);
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion, distancia_ganador) 
    VALUES(1, 5, '3', 05);
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion, distancia_ganador) 
    VALUES(2, 1, '1', 00);
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion, distancia_ganador)   
    VALUES(2, 4, '2', 00);
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion, distancia_ganador)   
    VALUES(2, 5, '3', 00);
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion, distancia_ganador)  
    VALUES(2, 8, '4', 00);
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion)
    VALUES(2, 10, 'Abandono');
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion, distancia_ganador)   
    VALUES(2, 11, '5', 00);
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion, distancia_ganador)   
    VALUES(3, 1, '1', 00);
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion, distancia_ganador)   
    VALUES(3, 4, '2', 57);
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion, distancia_ganador)  
    VALUES(3, 5, '3', 65);

/* EJERCICIO 5 */
-- Ver tabla antes del cambio
SELECT *
FROM EQUIPOS;
WHERE UPPER(Nombre)='FDJ';

--Actualizar tabla
UPDATE EQUIPOS 
SET Nombre = 'Araba'
WHERE UPPER(Nombre)='FDJ';

-- Comprobar cambios en la tabla
SELECT *
FROM EQUIPOS;
WHERE UPPER(Nombre)='FDJ';

/* EJERCICIO 6 */
UPDATE ETAPAS 
SET Premio = '2400'
WHERE INITCAP(tipo) = 'Contrarreloj';

-- para saber cual es la clave priamria de la tabla
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE UPPER(table_name)='ETAPAS';

SELECT Num_Etapa, tipo, Premio
FROM ETAPAS
WHERE INITCAP(tipo) = 'Contrarreloj';

SELECT *
FROM ETAPAS;

/* EJERCICIO 7 */
-- Ver tabla antes del cambio
SELECT *
FROM ETAPAS
WHERE INITCAP(tipo) = 'Llana';

UPDATE ETAPAS 
SET Num_Kms = Num_Kms + 10
WHERE INITCAP(tipo) = 'Llana';

-- Comprobar cambios en la tabla
SELECT *
FROM ETAPAS
WHERE INITCAP(tipo) = 'Llana';

/*Ejercicio 2-1*/

INSERT INTO equipos(codequipo,nombre,nacionalidad,nombredirector) 
    VALUES('0005', 'ASTANA PRO TEAM', 'Kazajistan', 'DIMITRY FOFONOV');

INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (15, 'Martinelli', 'Italiano', '0005', 
     TO_DATE('31/05/93','DD/MM/YY'));
     
INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (16, 'Sanchez', 'Español', '0005', 
     TO_DATE('24/11/83','DD/MM/YY'));

INSERT INTO ciclistas(Dorsal, nombre, nacionalidad, cod_equipo,fecha_nac)
     VALUES (17, 'Rodriguez', 'Español', '0005', 
     TO_DATE('06/05/95','DD/MM/YY'));
     
SELECT *
FROM equipos;
WHERE nombre = '%ASTANA%';

SELECT *
FROM ciclistas
WHERE cod_equipo = '0005';

COMMIT;
/*Ejercicio 2-2*/

SELECT *
FROM etapas
WHERE numetapa = 5;

INSERT INTO etapas(num_etapa)
VALUES(5);

INSERT INTO clasificacioneetapas (numetapa, dorsal, posicion, ditancia_ganador)
(SELECT 5, dorsal '17', 1, 70 FROM ciclistas WHERE UPPER(nombre) 
LIKE '%RODRIGUEZ%');

INSERT INTO clasificacioneetapas (numetapa, dorsal, posicion, ditancia_ganador)
(SELECT 5, dorsal '16', 2, 75 FROM ciclistas WHERE UPPER(nombre) 
LIKE '%LEON%');

INSERT INTO clasificacioneetapas (numetapa, dorsal, posicion, ditancia_ganador)
(SELECT 5, dorsal '17', 3, 80, FROM ciclistas WHERE UPPER(nombre) 
LIKE '%MARTINELLI%');

INSERT INTO clasificacioneetapas (numetapa, dorsal, posicion, ditancia_ganador)
(SELECT 5, dorsal '17', 3, 80 FROM ciclistas WHERE UPPER(nombre) 
LIKE '%QUINTANA');

SELECT *
FROM clasificacionesetapas
WHERE numetapa = 5;

COMMIT;

/*Ejercicio 2-3*/

SELECT *
FROM clasificacionesetapas
WHERE Initcap(posicion) = 'Abandono'
AND dorsal = (SELECT Dorsal
              FROM ciclistas
              WHERE UPPER(nombre) LIKE '%BONNET%');

UPDATE clasificacionesetapas
SET posicion = NULL
WHERE dorsal = (SELECT Dorsal FROM ciclistas WHERE UPPER(nombre)
                                                LIKE '%BONNET%');

SELECT *
FROM clasificacionesetapas
WHERE Initcap(posicion) = 'Abandono'
AND dorsal = (SELECT Dorsal
              FROM ciclistas
              WHERE UPPER(nombre) LIKE '%BONNET%');
              
/*Ejercicio 2-4*/

SELECT *
FROM clasificacionesetapas
WHERE dorsal = (SELECT Dorsal
                FROM ciclistas
                WHERE UPPER(nombre) LIKE '%VALVERDE%')
AND numetapa = 2;

UPDATE clasificacionesetapas
SET numetapa = 3
WHERE dorsal = (SELECT Dorsal
                FROM ciclistas
                WHERE UPPER(nombre) LIKE '%VALVERDE%');

SELECT *
FROM clasificacionesetapas
WHERE dorsal = (SELECT Dorsal
                FROM ciclistas
                WHERE UPPER(nombre) LIKE '%VALVERDE%')
AND numetapa = 3;

/*Ejercicio 2-5*/

UPDATE clasificacionesetapas
SET numetapa = 3
WHERE dorsal = (SELECT Dorsal
                FROM ciclistas
                WHERE UPPER(nombre) LIKE '%VALVERDE%');

/*Ejercicio 2-6*/
/*Comprobar si existe una columna sobre puntuacion*/
desc etapas;

ALTER TABLE etapas
ADD puntua VARCHAR2(1) DEFAULT 'N' 
CHECK(puntua IN ('S', 'N')); 
/*Para comprobar que se ha creado la columna*/
desc etapas;
/*Para comprobar que hemos creado la restriccion*/
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION
FROM user_constraints
WHERE UPPER(table_name) = 'ETAPAS';

/*Ejercicio 2-7*/

SELECT *   
FROM etapas
WHERE tipo = 'Contrarreloj';

UPDATE etapas 
SET INITCAP(tipo) = 'Contrarreloj'
WHERE INITCAP(tipo) = 'Contrarreloj';

SELECT *
FROM etapas
WHERE tipo = 'Contrarreloj';

COMMIT;

/*Ejercicio 2-8*/

SELECT extract (YEAR FROM FECHA) AS YEAR
FROM etapas
WHERE extract (YEAR FROM FECHA) = 2021;

UPDATE etapas
SET fecha = ADD_YEARS(fecha, -1)
WHERE extract (YEAR FROM FECHA) = 2021;

SELECT extract (YEAR FROM FECHA AS YEAR)
FROM etapas
WHERE extract (YEAR FROM FECHA) = 2020;

/*Tareas Select Basicas Ciclismo Parte 3:*/

/*Ejercicio 3-1*/

SELECT nombre AS "Nombre de equipos espa�oles 25"
FROM equipos
WHERE UPPER(nacionalidad)= 'ESPA�OL';

/*Ejercicio 3-2*/

--DESC CICLISTAS

SELECT (Dorsal || ' ' || nombre) AS "Ciclistas 25", fecha_nac
FROM ciclistas
WHERE UPPER(nacionalidad) = 'FRANCESA';

/*
Ciclistas 25                                                            FECHA_NA
----------------------------------------------------------------------- --------
6 Bernard                                                               17/03/92
10 Bonnet                                                               25/06/82
11 Gaudu                                                                10/10/96
12 Rous                                                                 18/04/87
*/

/*Ejercicio 3-3*/

SELECT nombre, nombredirector
FROM equipos
WHERE UPPER(nombredirector) LIKE '_O%';
/*
NOMBRE                         NOMBREDIRECTOR      
------------------------------ --------------------
Movistar Team                  JOSE LUIS ARRIETA   
EF Education First             TOM SOUTHAM   
*/

/*Ejercicio 3-4*/

SELECT nombre AS "Nombre del ciclista"
FROM ciclistas
WHERE cod_equipo = (SELECT codequipo
                    FROM equipos
                    WHERE INITCAP(nombre) LIKE '%Movistar%')
AND UPPER(nacionalidad) = 'ESPA�OLA'
ORDER BY nombre;
/*
Nombre del ciclista           
------------------------------
Erviti
Landa
Valverde
*/

/*Ejercicio 3-5*/

SELECT nombre, fecha_nac
FROM ciclistas
WHERE fecha_nac BETWEEN (TO DATE('01/01/1989', 'DD/MM/YYYY') AND
                        TO DATE('01/01/1993', 'DD/MM/YYYY'))
OR UPPER(nacionalidad) = 'FRANCESA'
ORDER BY fecha_nac;

/*Ejercicio 3-6*/

SELECT 'Equipo ganador' || cod_equipo
FROM ciclistas
WHERE Dorsal = (SELECT dorsal
                FROM clasificacionesetapas
                WHERE posicion = 1);