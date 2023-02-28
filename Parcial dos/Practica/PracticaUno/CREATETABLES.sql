SELECT * FROM "LAEU_SC"."cat_barrios"
SELECT * FROM "LAEU_SC"."cat_puestos"
SELECT * FROM "LAEU_SC"."cat_tipotrabajo"
SELECT * FROM "LAEU_SC"."cat_impuestos"
SELECT * FROM "LAEU_SC"."cat_pagos"
SELECT * FROM "LAEU_SC"."cat_empleados"
SELECT * FROM "LAEU_SC"."nomina"

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

insert into "LAEU_SC"."cat_barrios" (id_bar,nom_bar) values (1, 'Aguada');
insert into "LAEU_SC"."cat_barrios" (id_bar,nom_bar) values (2, 'Blanqueada');
insert into "LAEU_SC"."cat_barrios" (id_bar,nom_bar) values (3, 'Centro');
insert into "LAEU_SC"."cat_barrios" (id_bar,nom_bar) values (4, 'Cordon');
insert into "LAEU_SC"."cat_barrios" (id_bar,nom_bar) values (5, 'Union');


create table "LAEU_SC"."cat_puestos"
(
 id_puesto smallint primary key,
 desc_puesto varchar(20) not null
);

insert into "LAEU_SC"."cat_puestos" (id_puesto, desc_puesto) values (1, 'Administrador');
insert into "LAEU_SC"."cat_puestos" (id_puesto, desc_puesto) values (2, 'Azafata');
insert into "LAEU_SC"."cat_puestos" (id_puesto, desc_puesto) values (3, 'Chofer');
insert into "LAEU_SC"."cat_puestos" (id_puesto, desc_puesto) values (4, 'Taller');
insert into "LAEU_SC"."cat_puestos" (id_puesto, desc_puesto) values (5, 'Ventas');


create table "LAEU_SC"."cat_tipotrabajo"
(
 id_tiptra smallint primary key,
 desc_tiptra varchar(10) not null
);

insert into "LAEU_SC"."cat_tipotrabajo" (id_tiptra,desc_tiptra) values (1,'Jornalero');
insert into "LAEU_SC"."cat_tipotrabajo" (id_tiptra,desc_tiptra) values (2,'Efectivo');


create table "LAEU_SC"."cat_impuestos"
(
 id_imp smallint primary key,
 desc_imp varchar(10) not null,
 val_imp decimal not null
);

insert into "LAEU_SC"."cat_impuestos" (id_imp,desc_imp,val_imp) values (1, 'ISR', 0.20);
insert into "LAEU_SC"."cat_impuestos" (id_imp,desc_imp,val_imp) values (2, 'IETU', 0.17);
insert into "LAEU_SC"."cat_impuestos" (id_imp,desc_imp,val_imp) values (3, 'IMSS', 0.12);


create table "LAEU_SC"."cat_pagos"
(
 id_pago smallint primary key,
 desc_pago varchar(5) not null,
 val_pago decimal not null
);

insert into "LAEU_SC"."cat_pagos" (id_pago,desc_pago,val_pago) values (1, 'HORAS', 25);
insert into "LAEU_SC"."cat_pagos" (id_pago,desc_pago,val_pago) values (2, 'DIAS', 250);


create table "LAEU_SC"."cat_empleados"
(
	num_emp smallint primary key,
	nom_emp varchar(20) not null,
	apa_emp varchar(15) not null,
	ama_emp varchar(15) not null,
	sex_emp varchar(1) not null,
	fna_emp date not null,
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


create table "LAEU_SC"."nomina"
(
	num_emp_nom smallint not null,
	faltas_nom  integer not null,
	canti_tra_nom integer not null,
	tip_pag_nom smallint not null,
	constraint "fk_empleados" foreign key (num_emp_nom)
	references "LAEU_SC"."cat_empleados" (num_emp)
);

alter table "LAEU_SC"."nomina"
	add constraint "fk_tipo_pagos" foreign key (tip_pag_nom)
	references "LAEU_SC"."cat_tipotrabajo" (id_tiptra)
	
