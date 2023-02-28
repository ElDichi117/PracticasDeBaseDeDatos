insert into "IPN_SC"."cat_Escuelas" values (1, 'ESIME CULHUACAN');
insert into "IPN_SC"."cat_Escuelas" values (2, 'ESCOM');
insert into "IPN_SC"."cat_Escuelas" values (3, 'FACULTAD DE DISEÑO GRAFICO');
insert into "IPN_SC"."cat_Escuelas" values (4, 'UPIICSA');

insert into "IPN_SC"."cat_Materias" values (1, 'Programación Orientada a Objetos');
insert into "IPN_SC"."cat_Materias" values (2, 'Teoría del Color');
insert into "IPN_SC"."cat_Materias" values (3, 'Manejo de estructuras');
insert into "IPN_SC"."cat_Materias" values (4, 'Costos y Presupuestos');
insert into "IPN_SC"."cat_Materias" values (5, 'Compiladores');
insert into "IPN_SC"."cat_Materias" values (6, 'Bases de Datos');
insert into "IPN_SC"."cat_Materias" values (7, 'Diseño Web');
insert into "IPN_SC"."cat_Materias" values (8, 'Simulación');

insert into "IPN_SC"."cat_Areas" values (1, 'FÍSICO MATEMÁTICO');
insert into "IPN_SC"."cat_Areas" values (2, 'HUMANISTICA');
insert into "IPN_SC"."cat_Areas" values (3, 'ADMINISTRATIVA');

insert into "IPN_SC"."cat_Carreras" values (1, 'Ingeniería en Computación', 1);
insert into "IPN_SC"."cat_Carreras" values (2, 'Ingeniería en Sistemas Computacionales', 1);
insert into "IPN_SC"."cat_Carreras" values (3, 'Informática', 1);
insert into "IPN_SC"."cat_Carreras" values (4, 'Mercadotecnia', 2);
insert into "IPN_SC"."cat_Carreras" values (5, 'Diseño Industrial', 3);
insert into "IPN_SC"."cat_Carreras" values (6, 'Administración Industrial', 3);

insert into "IPN_SC"."carrera_escuela" values (1, 1);
insert into "IPN_SC"."carrera_escuela" values (2, 2);
insert into "IPN_SC"."carrera_escuela" values (3, 4);
insert into "IPN_SC"."carrera_escuela" values (4, 3);
insert into "IPN_SC"."carrera_escuela" values (5, 4);
insert into "IPN_SC"."carrera_escuela" values (6, 4);

insert into "IPN_SC"."carrera_materia" values (2, 1);
insert into "IPN_SC"."carrera_materia" values (4, 2);
insert into "IPN_SC"."carrera_materia" values (5, 3);
insert into "IPN_SC"."carrera_materia" values (6, 4);
insert into "IPN_SC"."carrera_materia" values (1, 5);
insert into "IPN_SC"."carrera_materia" values (1, 6);
insert into "IPN_SC"."carrera_materia" values (2, 7);
insert into "IPN_SC"."carrera_materia" values (3, 8);

insert into "IPN_SC"."cat_Alumnos" values (12345, 'José Juan', 'Arreola', 'Lopez ', 'Sur 115A, Sector Popular, Iztapalapa', 12312312, 2, 2);
insert into "IPN_SC"."cat_Alumnos" values (12346, 'Laura', 'Bustamante', 'Ruiz ', 'Havre 52, Roma Norte, Cuauhtemoc', 12312313, 4, 3);
insert into "IPN_SC"."cat_Alumnos" values (12347, 'Carlos', 'Arteaga', 'Sanchez ', 'Insurgentes 1023, Roma Sur, Cuauhtemoc', 12312314, 5, 4);
insert into "IPN_SC"."cat_Alumnos" values (12348, 'Angel', 'Gonzales', 'Pérez ', 'Radames Gaxiola 15, Sector Popular, Iztapalapa', 12312315, 4, 3);
insert into "IPN_SC"."cat_Alumnos" values (12349, 'Mireya', 'Martinez', 'Rosas ', 'Avena 14, Granjas México, Iztacalco', 12312316, 6, 4);
insert into "IPN_SC"."cat_Alumnos" values (12350, 'Jazmin', 'Gómes', 'Rosas ', 'Londes 25, Roma Norte, Cuauhtemoc', 12312317, 1, 1);
insert into "IPN_SC"."cat_Alumnos" values (12351, 'Fernando', 'Garza', 'Montes ', 'Loma Bonita 18, Nopala, Milpalta', 12312318, 1, 1);
insert into "IPN_SC"."cat_Alumnos" values (12352, 'Raque', 'Juarez', 'Olmedo ', 'Av. The 18, Granjas México, Iztacalco', 12312319, 1, 1);
insert into "IPN_SC"."cat_Alumnos" values (12353, 'Estela', 'Leyva', 'Moreno ', 'La Viga 1421, El Sifón, Iztapalapa', 12312320, 2, 2);
insert into "IPN_SC"."cat_Alumnos" values (12354, 'Norma', 'De la O', 'Mondragon ', 'Av. 13, Rosario, Milpa Alta', 12312321, 3, 4);

insert into "IPN_SC"."alumno_materia" values (12345, 1);
insert into "IPN_SC"."alumno_materia" values (12346, 2);
insert into "IPN_SC"."alumno_materia" values (12347, 3);
insert into "IPN_SC"."alumno_materia" values (12348, 2);
insert into "IPN_SC"."alumno_materia" values (12349, 4);
insert into "IPN_SC"."alumno_materia" values (12350, 5);
insert into "IPN_SC"."alumno_materia" values (12351, 6);
insert into "IPN_SC"."alumno_materia" values (12352, 5);
insert into "IPN_SC"."alumno_materia" values (12353, 7);
insert into "IPN_SC"."alumno_materia" values (12354, 8);