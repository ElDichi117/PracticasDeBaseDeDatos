CREATE DATABASE "Alianza_DB"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Mexico.1252'
    LC_CTYPE = 'Spanish_Mexico.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE SCHEMA IF NOT EXISTS "Alianza_SC"
    AUTHORIZATION postgres;

CREATE TABLE "Alianza_SC"."cat_Equipos"
(
 	Id_Equipos smallint GENERATED ALWAYS AS IDENTITY,
 	NUm_Equipo varchar(15) NOT NULL,
	PRIMARY KEY(Id_Equipos)
);

CREATE TABLE "Alianza_SC"."cat_TiposBebidas"
(
 	Id_TiposBebidas smallint GENERATED ALWAYS AS IDENTITY,
 	Nom_TiposBebidas varchar(20) NOT NULL,
	PRIMARY KEY(Id_TiposBebidas)
);

CREATE TABLE "Alianza_SC"."cat_Bebidas"
(
	Id_Bebida smallint GENERATED ALWAYS AS IDENTITY,
	Nom_Bebida varchar(50) NOT NULL,
	Precio_Bebida decimal NOT NULL,
	Id_tipbebida smallint NOT NULL,
	PRIMARY KEY(Id_Bebida),
	CONSTRAINT "fk_tipobebida"
		FOREIGN KEY(Id_tipbebida)
			REFERENCES "Alianza_SC"."cat_TiposBebidas"(Id_TiposBebidas)
);

CREATE TABLE "Alianza_SC"."cat_Vendedor"
(
	Id_ven smallint GENERATED ALWAYS AS IDENTITY,
	Nom_ven varchar(15) NOT NULL,
	Apa_ven varchar(15) NOT NULL,
	Ama_ven varchar(15) NOT NULL,
	FechaIngreso_ven date NOT NULL,
	Sex_ven varchar(1) NOT NULL,
	RFC_ven varchar(15) NOT NULL,
	Id_equipo smallint NOT NULL,
	PRIMARY KEY(Id_ven),
	CONSTRAINT "fk_NomEquipo"
		FOREIGN KEY(Id_equipo)
			REFERENCES "Alianza_SC"."cat_Equipos"(Id_Equipos)
);

CREATE TABLE "Alianza_SC"."Ventas"
(
	Id_venta smallint GENERATED ALWAYS AS IDENTITY,
	Fecha_venta date NOT NULL,
	Hora_Venta varchar(15) NOT NULL,
	Id_vendedor smallint NOT NULL,
	PRIMARY KEY(Id_venta),
	CONSTRAINT "fk_vendedor"
		FOREIGN KEY(Id_vendedor)
			REFERENCES "Alianza_SC"."cat_Vendedor"(Id_ven)
);

CREATE TABLE "Alianza_SC"."Detalle_Ventas"
(
	num_venta smallint NOT NULL,
	Id_prod smallint NOT NULL,
	CantUnidades int NOT NULL,
	CONSTRAINT "fk_venta"
		FOREIGN KEY(num_venta)
			REFERENCES "Alianza_SC"."Ventas"(Id_venta),
	CONSTRAINT "fk_producto"
		FOREIGN KEY(Id_prod)
			REFERENCES "Alianza_SC"."cat_Bebidas"(Id_Bebida)
);

DROP SCHEMA "Alianza_SC" CASCADE