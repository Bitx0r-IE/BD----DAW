// Equipos

INSERT INTO equipos VALUES('0001', 'Movistar Team', 'Española', 'JOSE LUIS ARRIETA');
INSERT INTO equipos  VALUES('0002', 'Trek-Segafredo', 'Estadounidense', 'KIM ANDERSEN');
INSERT INTO equipos VALUES('0003', 'Team Ineos', 'Inglesa', 'NICOLAS PORTAL');
INSERT INTO equipos VALUES('0005', 'EF Education First', 'Estadounidense', 'TOM SOUTHAM');
INSERT INTO equipos VALUES('0004', 'FDJ', 'Francesa', 'PHILIPPE MAUDUIT');

// Ciclistas

INSERT INTO ciclistas VALUES (1, 'Quintana','Colombiana', '0001', TO_DATE('04/02/90','DD/MM/YY') );
INSERT INTO ciclistas VALUES (2, 'Valverde', 'Española', '0001', TO_DATE('25/04/80');
INSERT INTO ciclistas VALUES (3, 'Erviti', 'Española', '0001', TO_DATE('15/11/83','DD/MM/YY'));
INSERT INTO ciclistas VALUES (4, 'Landa', 'Española', '0001', TO_DATE('13/12/89','DD/MM/YY'));
INSERT INTO ciclistas VALUES (5, 'Porte', 'Australiana', '0002',TO_DATE('30/01/85','DD/MM/YY') );
INSERT INTO ciclistas VALUES (6, 'Bernard', 'Francesa', '0002', TO_DATE('17/03/92','DD/MM/YY'));
INSERT INTO ciclistas VALUES (7, 'Ciccone', 'Italiana', '0002',TO_DATE('20/12/94','DD/MM/YY') );
INSERT INTO ciclistas VALUES (8, 'Thomas', 'Inglesa', '0003',TO_DATE('25/05/86','DD/MM/YY') );
INSERT INTO ciclistas VALUES (9, 'Bernal', 'Colombiana', '0003', TO_DATE('13/01/97','DD/MM/YY'));
INSERT INTO ciclistas VALUES (10, 'Bonnet', 'Francesa', '0004', TO_DATE('25/06/82','DD/MM/YY'));
INSERT INTO ciclistas VALUES (11, 'Gaudu', 'Francesa', '0004', TO_DATE('10/10/96','DD/MM/YY'));
INSERT INTO ciclistas VALUES (12, 'Rous', 'Francesa', '0004', TO_DATE('18/04/87','DD/MM/YY'));
INSERT INTO ciclistas VALUES (13, 'Uran', 'Colombiana', '0005', TO_DATE('26/01/87','DD/MM/YY'));
INSERT INTO ciclistas VALUES (14, 'Bettiol', 'Italiana', '0005', TO_DATE('29/10/93','DD/MM/YY'));

// Etapas

INSERT INTO etapas (numetapa, numkms, tipo, fecha) VALUES (1, 9, 'Contrarreloj',TO_DATE('27/07/21','DD/MM/YY'));
INSERT INTO etapas VALUES (2, 185, 'Llana',TO_DATE('28/07/21','DD/MM/YY'));
INSERT INTO etapas VALUES (3, 198, 'Llana',TO_DATE('29/07/21','DD/MM/YY'),NULL);
INSERT INTO etapas VALUES (4, 139, 'Alta Montaña',TO_DATE('30/07/21','DD/MM/YY'),NULL);
INSERT INTO etapas VALUES (5, 229, 'Alta Montaña',TO_DATE('31/07/21','DD/MM/YY'),NULL);
INSERT INTO etapas VALUES (6, 49, 'Contrarreloj', TO_DATE('02/08/21','DD/MM/YY'),NULL);
INSERT INTO etapas VALUES (7, 203, 'Media Montaña', TO_DATE('03/08/21','DD/MM/YY'),NULL);
INSERT INTO etapas VALUES (8, 144, 'Llana',TO_DATE('04/08/21','DD/MM/YY'),NULL);
INSERT INTO etapas VALUES (9, 175, 'Alta Montaña',TO_DATE('05/08/21','DD/MM/YY'),NULL);
INSERT INTO etapas VALUES (10, 239, 'Llana',TO_DATE('06/08/21','DD/MM/YY'),NULL);

// Clasificaciones de las Etapas

INSERT INTO clasificacionesetapas VALUES(1, 1, '1', 0);
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion) VALUES(1, 2, 'Abandono');
INSERT INTO clasificacionesetapas VALUES(1, 4, '2', 04);
INSERT INTO clasificacionesetapas VALUES(1, 5, '3', 05);
INSERT INTO clasificacionesetapas VALUES(2, 1, '1', 00);
INSERT INTO clasificacionesetapas VALUES(2, 4, '2', 00);
INSERT INTO clasificacionesetapas VALUES(2, 5, '3', 00);
INSERT INTO clasificacionesetapas VALUES(2, 8, '4', 00);
INSERT INTO clasificacionesetapas(numetapa, dorsal, posicion) VALUES(2, 20, 'Abandono');
INSERT INTO clasificacionesetapas VALUES(2, 11, '5', 00);
INSERT INTO clasificacionesetapas VALUES(3, 1, '1', 00);
INSERT INTO clasificacionesetapas VALUES(3, 4, '2', 57);
INSERT INTO clasificacionesetapas VALUES(3, 5, '3', 65);

