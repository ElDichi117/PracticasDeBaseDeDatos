Create table Sueldos
(
	Id_Sueldo smallint GENERATED ALWAYS AS IDENTITY,
	Id_Traba smallint,
	primary key(Id_Sueldo),
	constraint fk_trabajador
		foreign key(Id_Traba)
			references Trabajador(Id_Trabajador)
);

create table Rubros
(
	Id_Rubro smallint GENERATED ALWAYS AS IDENTITY,
	Nom_Rubro varchar(20) not null,
	primary key(Id_Rubro)
);

create table Barrios
(
	Id_Barrio smallint GENERATED ALWAYS AS IDENTITY,
	Nom_Barrio varchar(20) not null,
	primary key(Id_Barrio)
);

create table Trabajos
(
	Id_Trabajo smallint GENERATED ALWAYS AS IDENTITY,
	Tipo_trabajo varchar(20) not null,
	primary key(Id_Trabajo)
);

create table PagDes
(
	Id_PagDes smallint GENERATED ALWAYS AS IDENTITY,
	Tipo_PagDes varchar(25) not null,
	Cantidad_PagDes float not null,
	Id_Sueld smallint,
	primary key(Id_PagDes),
	constraint fk_sueldo
		foreign key(Id_Sueld)
			references Sueldos(Id_Sueldo)
);

create table Trabajador
(
    Id_Trabajador smallint GENERATED ALWAYS AS IDENTITY,
    Nom_Trabajador varchar(20) not null,
    Apa_Trabajador varchar(15) not null,
    Ama_Trabajador varchar(15) not null,
    Sex_Trabajador varchar(1) not null,
    FechaNa_Trabajador date not null,
    Id_Barrios smallint,
	Id_Rubros smallint,
	Id_Trabajos smallint,
	Tiempo_trabajador int not null,
	primary key(Id_Trabajador),
	constraint fk_barrios
		foreign key(Id_Barrios)
			references Barrios(Id_Barrio),
	constraint fk_rubros
		foreign key(Id_Rubros)
			references Rubros(Id_Rubro),
	constraint fk_trabajos
		foreign key(Id_Trabajos)
			references Trabajos(Id_Trabajo)
);

alter table trabajador
	add Id_Sueldos SMALLINT

alter table trabajador
	add constraint fk_sueldos
		foreign key(Id_Sueldos)
			references Sueldos(Id_Sueldo)