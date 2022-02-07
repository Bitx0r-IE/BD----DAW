INSERT INTO departseq(dept_no, dnombre)
    VALUES(dept_id_seq.NEXTVAL, 'EDUCACION');
    
INSERT INTO departseq(dept_no, dnombre)
    VALUES(dept_id_seq.NEXTVAL, 'ADMINISTRACION');
    
SELECT * 
FROM DEPARTSEQ
WHERE UPPER(dnombre) IN ('EDUCACION','ADMINISTRACION');
/*
   DEPT_NO DNOMBRE        LOC           
---------- -------------- --------------
       210 EDUCACION                    
       220 ADMINISTRACION               
       240 EDUCACION                    
       250 ADMINISTRACION    
*/

SELECT dept_id_seq.NEXTVAL FROM DUAL;
/*
   NEXTVAL
----------
       260
*/

INSERT INTO departseq(dept_no, dnombre)
    VALUES(dept_id_seq.CURRVAL, 'PROGRAMACION');
    
SELECT *
FROM DEPARTSEQ
WHERE UPPER(dnombre) = 'PROGRAMACION';
/*
   DEPT_NO DNOMBRE        LOC           
---------- -------------- --------------
       260 PROGRAMACION                 

*/