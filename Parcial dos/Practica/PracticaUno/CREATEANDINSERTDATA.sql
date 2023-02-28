CREATE DATABASE "LAEU_BD"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Mexico.1252'
    LC_CTYPE = 'Spanish_Mexico.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE "LAEU_BD"
    IS 'Lineas Aereas Economicas Unidas';

CREATE SCHEMA IF NOT EXISTS "LAEU_SC"
    AUTHORIZATION postgres;

COMMENT ON SCHEMA "LAEU_SC"
    IS 'Esquema para Lineas Aereas Economicas Unidas';
	
create table "LAEU_SC"."cat_barrios"
(
 id_bar smallint primary key,
 nom_bar varchar(15) not null
);

insert into "LAEU_SC"."cat_barrios" values (1, 'Aguada');
insert into "LAEU_SC"."cat_barrios" values (2, 'Blanqueada');
insert into "LAEU_SC"."cat_barrios" values (3, 'Centro');
insert into "LAEU_SC"."cat_barrios" values (4, 'Cordon');
insert into "LAEU_SC"."cat_barrios" values (5, 'Union');

create table "LAEU_SC"."cat_puestos"
(
 id_puesto smallint primary key,
 desc_puesto varchar(20) not null
);

insert into "LAEU_SC"."cat_puestos" values (1, 'Administrador');
insert into "LAEU_SC"."cat_puestos" values (2, 'Azafata');
insert into "LAEU_SC"."cat_puestos" values (3, 'Chofer');
insert into "LAEU_SC"."cat_puestos" values (4, 'Taller');
insert into "LAEU_SC"."cat_puestos" values (5, 'Ventas');

create table "LAEU_SC"."cat_tipotrabajo"
(
 id_tiptra smallint primary key,
 desc_tiptra varchar(10) not null
);

insert into "LAEU_SC"."cat_tipotrabajo" values (1,'Jornalero');
insert into "LAEU_SC"."cat_tipotrabajo" values (2,'Efectivo');

update "LAEU_SC"."cat_tipotrabajo" set desc_tiptra = 'Efectivo' where id_tiptra = 1;
update "LAEU_SC"."cat_tipotrabajo" set desc_tiptra = 'Jornalero' where id_tiptra = 2;

create table "LAEU_SC"."cat_impuestos"
(
 id_imp smallint primary key,
 desc_imp varchar(10) not null,
 val_imp decimal not null
);

insert into "LAEU_SC"."cat_impuestos" values (1, 'ISR', 0.20);
insert into "LAEU_SC"."cat_impuestos" values (2, 'IETU', 0.17);
insert into "LAEU_SC"."cat_impuestos" values (3, 'IMSS', 0.12);

update "LAEU_SC"."cat_impuestos" set val_imp = 0.35 where id_imp = 1;

create table "LAEU_SC"."cat_pagos"
(
 id_pago smallint primary key,
 desc_pago varchar(5) not null,
 val_pago decimal not null
);

insert into "LAEU_SC"."cat_pagos" values (1, 'HORAS', 25);
insert into "LAEU_SC"."cat_pagos" values (2, 'DIAS', 250);

update "LAEU_SC"."cat_pagos" set desc_pago = 'DIAS', val_pago = 250  where id_pago = 1;
update "LAEU_SC"."cat_pagos" set desc_pago = 'HORAS', val_pago = 25 where id_pago = 2;

create table "LAEU_SC"."cat_empleados"
(
 num_emp smallint primary key,
 nom_emp varchar(20) not null,
 apa_emp varchar(15) not null,
 ama_emp varchar(15) not null,
 sex_emp varchar(1) not null,
 fna_emp date not null,
 tel_emp varchar(20) not null,
 barrio_emp smallint not null,
 puesto_emp smallint not null,
 tiptra_emp smallint not null,
 constraint "fk_barrio" foreign key (barrio_emp) 
 references "LAEU_SC"."cat_barrios"(id_bar),
 constraint "fk_puesto" foreign key (puesto_emp) 
 references "LAEU_SC"."cat_puestos"(id_puesto),
 constraint "fk_tiptra" foreign key (tiptra_emp) 
 references "LAEU_SC"."cat_tipotrabajo"(id_tiptra)
);

ALTER table "LAEU_SC"."cat_empleados" drop column tel_emp;

create table "LAEU_SC"."nomina"
(
 num_emp_nom smallint not null,
 faltas_nom  integer not null,
 canti_tra_nom integer not null,
 tip_pag_nom smallint not null,
 constraint "fk_empleados" foreign key (num_emp_nom)
 references "LAEU_SC"."cat_empleados" (num_emp)
);

select * from "LAEU_SC"."cat_barrios" --Consulta de la categoría barrios
select * from "LAEU_SC"."cat_puestos" --Consulta de la categoría puestos
select * from "LAEU_SC"."cat_tipotrabajo" --Consulta de la categoría tipo trabajo
select * from "LAEU_SC"."cat_impuestos" order by id_imp --Consulta de la categoría impuestos
select * from "LAEU_SC"."cat_pagos" --Consulta de la categoría pagos
select * from "LAEU_SC"."cat_empleados" --Consulta de la categoría empleados
select * from "LAEU_SC"."nomina" --Consulta de la categoría nomina

insert into "LAEU_SC"."cat_empleados" values (1,'LUIS','SUAREZ','ACOSTA','M','10/08/1956',4,3,2);
insert into "LAEU_SC"."cat_empleados" values (2,'EMA','PEREZ','ALFONSO','F','09/04/1961',1,2,1);
insert into "LAEU_SC"."cat_empleados" values (3,'ANA','PEREIRA','ANGELUCCI','F','04/06/1979',1,1,1);
insert into "LAEU_SC"."cat_empleados" values (4,'ADOLFO','GUTIERREZ','BACCIO','M','14/07/1965',1,3,2);
insert into "LAEU_SC"."cat_empleados" values (5,'SOFIA','LOPEZ','BARCIA','F','21/12/1966',5,2,2);
insert into "LAEU_SC"."cat_empleados" values (6,'RODRIGO','ALFONSO','BRESIA','M','11/08/1982',4,3,1);
insert into "LAEU_SC"."cat_empleados" values (7,'BEATRIZ','PEÑA','COSTA','F','07/10/1974',5,5,1);
insert into "LAEU_SC"."cat_empleados" values (8,'PEDRO','ACOSTA','COSTELA','M','30/07/1978',5,3,1);
insert into "LAEU_SC"."cat_empleados" values (9,'MARTHA','COSTELA','DE LOS SANTOS','F','05/05/1959',4,2,2);
insert into "LAEU_SC"."cat_empleados" values (10,'LEONCIO','PERERA','FERREIRA','M','18/09/1970',5,1,1);
insert into "LAEU_SC"."cat_empleados" values (11,'DANIEL','BACCIO','GALO','M','13/08/1976',2,3,2);
insert into "LAEU_SC"."cat_empleados" values (12,'LORENA','LOPEZ','GARCIA','F','08/12/1962',5,3,1);
insert into "LAEU_SC"."cat_empleados" values (13,'JULIO','HERNANDEZ','GARCIA','M','19/07/1969',2,5,1);
insert into "LAEU_SC"."cat_empleados" values (14,'PEDRO','GARCIA','GIMENEZ','M','05/08/1949',2,4,2);
insert into "LAEU_SC"."cat_empleados" values (15,'JULIAN','COSTA','GUTIERREZ','M','26/01/1959',2,3,2);
insert into "LAEU_SC"."cat_empleados" values (16,'SONIA','MARTINEZ','HERNANDEZ','F','28/02/1969',1,1,1);
insert into "LAEU_SC"."cat_empleados" values (17,'PABLO','GARCIA','HERRERA','M','20/01/1977',5,4,1);
insert into "LAEU_SC"."cat_empleados" values (18,'FEDERICO','FERREIRA','LOPEZ','M','05/09/1968',1,3,1);
insert into "LAEU_SC"."cat_empleados" values (19,'MARIA','VICENTE','LOPEZ','F','09/05/1973',2,2,2);
insert into "LAEU_SC"."cat_empleados" values (20,'IRMA','PEÑA','MARTINEZ','F','03/09/1980',5,5,1);
insert into "LAEU_SC"."cat_empleados" values (21,'RODOLFO','GALO','PALACIOS','M','10/11/1968',5,3,1);
insert into "LAEU_SC"."cat_empleados" values (22,'SANTIAGO','HERRERA','PEÑA','M','06/08/1960',3,3,2);
insert into "LAEU_SC"."cat_empleados" values (23,'ELBIO','GIMENEZ','PEÑA','M','27/12/1978',5,3,2);
insert into "LAEU_SC"."cat_empleados" values (24,'JULIO','BRESIA','PEREIRA','M','06/01/1982',2,1,1);
insert into "LAEU_SC"."cat_empleados" values (25,'JOUAQUIN','BARCIA','PERERA','M','04/06/1976',2,3,1);
insert into "LAEU_SC"."cat_empleados" values (26,'ESTELA','PALACIOS','PEREZ','F','25/05/1969',5,2,1);
insert into "LAEU_SC"."cat_empleados" values (27,'LEONARDO','RODAS','RODAS','M','18/04/1975',3,3,2);
insert into "LAEU_SC"."cat_empleados" values (28,'FABRICIO','ANGELUCCI','SUAREZ','M','30/12/1981',2,1,1);
insert into "LAEU_SC"."cat_empleados" values (29,'JACINTO','DE LOS SANTOS','VICENTE','M','16/04/1945',1,3,1);

insert into "LAEU_SC"."nomina" values (1,1,276,2);
insert into "LAEU_SC"."nomina" values (2,0,22,1);
insert into "LAEU_SC"."nomina" values (3,0,21,1);
insert into "LAEU_SC"."nomina" values (4,0,128,2);
insert into "LAEU_SC"."nomina" values (5,0,490,2);
insert into "LAEU_SC"."nomina" values (6,3,22,1);
insert into "LAEU_SC"."nomina" values (7,2,22,1);
insert into "LAEU_SC"."nomina" values (8,4,18,1);
insert into "LAEU_SC"."nomina" values (9,1,260,2);
insert into "LAEU_SC"."nomina" values (10,1,22,1);
insert into "LAEU_SC"."nomina" values (11,1,168,2);
insert into "LAEU_SC"."nomina" values (12,1,22,1);
insert into "LAEU_SC"."nomina" values (13,0,16,1);
insert into "LAEU_SC"."nomina" values (14,0,185,2);
insert into "LAEU_SC"."nomina" values (15,0,450,2);
insert into "LAEU_SC"."nomina" values (16,5,26,1);
insert into "LAEU_SC"."nomina" values (17,2,15,1);
insert into "LAEU_SC"."nomina" values (18,4,20,1);
insert into "LAEU_SC"."nomina" values (19,3,120,2);
insert into "LAEU_SC"."nomina" values (20,7,22,1);
insert into "LAEU_SC"."nomina" values (21,8,22,1);
insert into "LAEU_SC"."nomina" values (22,0,176,2);
insert into "LAEU_SC"."nomina" values (23,0,168,2);
insert into "LAEU_SC"."nomina" values (24,0,19,1);
insert into "LAEU_SC"."nomina" values (25,0,10,1);
insert into "LAEU_SC"."nomina" values (26,0,21,1);
insert into "LAEU_SC"."nomina" values (27,1,265,2);
insert into "LAEU_SC"."nomina" values (28,1,22,1);
insert into "LAEU_SC"."nomina" values (29,2,22,1);
