select * from "IPN_SC"."cat_Escuelas"
select * from "IPN_SC"."cat_Materias"
select * from "IPN_SC"."cat_Areas"
select * from "IPN_SC"."cat_Carreras"
select * from "IPN_SC"."carrera_escuela"
select * from "IPN_SC"."carrera_materia"
select * from "IPN_SC"."cat_Alumnos"
select * from "IPN_SC"."alumno_materia"

select A.boleta_alumno, A.nom_alumno, A.apa_alumno, A.ama_alumno, C.nombre_carrera
from "IPN_SC"."cat_Alumnos" A, "IPN_SC"."cat_Carreras" C
where C.id_carrera = A.carrera_alumno
and C.id_carrera = 1

select A.boleta_alumno, A.nom_alumno, A.apa_alumno, A.ama_alumno, M.nombre_materia
from "IPN_SC"."cat_Alumnos" A, "IPN_SC"."cat_Materias" M, "IPN_SC"."alumno_materia" AM
where A.boleta_alumno = AM.alumno_almat
and AM.materia_almat = M.id_materia
and M.id_materia = 2

select E.nombre_escuela, M.nombre_materia
from "IPN_SC"."cat_Escuelas" E, "IPN_SC"."cat_Materias" M, "IPN_SC"."carrera_escuela" CE, "IPN_SC"."cat_Carreras" C, "IPN_SC"."carrera_materia" CM
where E.id_escuela = CE.escuela_caresc
and CE.carrera_caresc = C.id_carrera
and C.id_carrera = CM.carrera_carmat
and CM.materia_carmat = M.id_materia
and E.id_escuela = 4

select E.nombre_escuela, AR.nombre_area
from "IPN_SC"."cat_Escuelas" E, "IPN_SC"."carrera_escuela" CE, "IPN_SC"."cat_Carreras" C, "IPN_SC"."cat_Areas" AR
where E.id_escuela = CE.escuela_caresc
and CE.carrera_caresc = C.id_carrera
and C.area_carrera = AR.id_area
and AR.id_area = 1


CREATE OR REPLACE FUNCTION Inscritos_Escuela(claesc int)
RETURNS TABLE (NOMBRE varchar(29), APA varchar(30), AMA varchar(30)) AS $BODY$
DECLARE
    reg RECORD;
BEGIN
    FOR REG IN SELECT A.nom_alumno as n,A.apa_alumno as pa,A.ama_alumno as ma
    FROM "IPN_SC"."cat_Alumnos" A, "IPN_SC"."cat_Escuelas" E 
    WHERE A.escuela_alumno = id_escuela
	AND E.id_escuela=claesc LOOP
        NOMBRE := reg.n;
        APA := reg.pa;
        AMA := reg.ma;
       RETURN NEXT;
    END LOOP;
    RETURN;
END     
$BODY$ LANGUAGE 'plpgsql'

DROP FUNCTION inscritos_escuela(integer)

select * from Inscritos_Escuela(4);