CREATE DATABASE "IPN_BD"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Mexico.1252'
    LC_CTYPE = 'Spanish_Mexico.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
COMMENT ON DATABASE "IPN_BD"
    IS 'Instituto Politécnico Nacional';
	
CREATE SCHEMA IF NOT EXISTS "IPN_SC"
    AUTHORIZATION postgres;

COMMENT ON SCHEMA "IPN_SC"
    IS 'Esquema para Instituto Politécnico Nacional';
	
create table "IPN_SC"."cat_Escuelas"
(
	id_escuela smallint primary key,
	nombre_escuela varchar(50) not null
);

create table "IPN_SC"."cat_Materias"
(
	id_materia smallint primary key,
	nombre_materia varchar(50) not null
);

create table "IPN_SC"."cat_Areas"
(
	id_area smallint primary key,
	nombre_area varchar(30) not null
);

create table "IPN_SC"."cat_Carreras"
(
	id_carrera smallint primary key,
	nombre_carrera varchar(50) not null,
	area_carrera smallint not null,
	constraint "fk_area" foreign key (area_carrera)
	references "IPN_SC"."cat_Areas" (id_area)
);

create table "IPN_SC"."carrera_escuela"
(
	carrera_caresc smallint not null,
	escuela_caresc smallint not null,
	constraint "fk_carreraCE" foreign key (carrera_caresc)
	references "IPN_SC"."cat_Carreras" (id_carrera),
	constraint "fk_escuelaCE" foreign key (escuela_caresc)
	references "IPN_SC"."cat_Escuelas" (id_escuela)
);

create table "IPN_SC"."carrera_materia"
(
	carrera_carmat smallint not null,
	materia_carmat smallint not null,
	constraint "fk_carreraCM" foreign key (carrera_carmat)
	references "IPN_SC"."cat_Carreras" (id_carrera),
	constraint "fk_materiaCM" foreign key (materia_carmat)
	references "IPN_SC"."cat_Materias" (id_materia)
);

create table "IPN_SC"."cat_Alumnos"
(
	boleta_alumno integer primary key,
	nom_alumno varchar(20) not null,
	apa_alumno varchar(15) not null,
	ama_alumno varchar(15) not null,
	direc_alumno varchar(50) not null,
	tel_alumno varchar(13) not null,
	carrera_alumno smallint not null,
	escuela_alumno smallint not null,
	constraint "fk_carreraCA" foreign key (carrera_alumno)
	references "IPN_SC"."cat_Carreras" (id_carrera),
	constraint "fk_escuelaCA" foreign key (escuela_alumno)
	references "IPN_SC"."cat_Escuelas" (id_escuela)
);

create table "IPN_SC"."alumno_materia"
(
	alumno_almat integer not null,
	materia_almat smallint not null,
	constraint "fk_alumnoAM" foreign key (alumno_almat)
	references "IPN_SC"."cat_Alumnos" (boleta_alumno),
	constraint "fk_materiaAM" foreign key (materia_almat)
	references "IPN_SC"."cat_Materias" (id_materia)
);