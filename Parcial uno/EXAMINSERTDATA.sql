INSERT INTO trabajador
(
	nom_trabajador,
	ama_trabajador,
	apa_trabajador,
	sex_trabajador,
	fechana_trabajador,
	tiempo_trabajador
)
VALUES
	(
		'EMA',
		'PEREZ',
		'ALFONSO',
		'F',
		'09/04/1961',
		22
	),
	(
		'EMA',
		'PEREZ',
		'ALFONSO',
		'F',
		'09/04/1961',
		22
	),
	(
		'ANA',
		'PEREIRA',
		'ANGELUCCI',
		'F',
		'04/06/1979',
		21
	),
	(
		'ALDOLFO',
		'GUTIERREZ',
		'BACCIO',
		'M',
		'17/07/1965',
		128
	),
	(
		'SOFIA',
		'LOPEZ',
		'BARCIA',
		'F',
		'21/12/1966',
		490
	),
	(
		'RODRIGO',
		'ALFONSO',
		'BRESIA',
		'M',
		'11/08/1982',
		22
	),
	(
		'BEATRIZ',
		'PEÑA',
		'COSTA',
		'F',
		'07/10/1974',
		22
	),
	(
		'PEDRO',
		'ACOSTA',
		'COSTELA',
		'M',
		'30/07/1978',
		18
	),
	(
		'MARTHA',
		'COSTELA',
		'DE LOS SANTOS',
		'F',
		'05/05/1959',
		260
	),
	(
		'LEONCIO',
		'PERERA',
		'FERREIRA',
		'M',
		'18/09/1970',
		22
	),
	(
		'DANIEL',
		'BACCIO',
		'GALO',
		'M',
		'13/08/1976',
		168
	),
	(
		'LORENA',
		'LOPEZ',
		'GARCIA',
		'F',
		'08/12/1962',
		22
	),
	(
		'JULIO',
		'HERNANDEZ',
		'GARCIA',
		'M',
		'19/07/1969',
		16
	),
	(
		'PEDRO',
		'GARCIA',
		'GIMENEZ',
		'M',
		'05/08/1949',
		185
	),
	(
		'JULIAN',
		'COSTA',
		'GUTIERREZ',
		'M',
		'29/01/1959',
		450
	),
	(
        'SONIA',
        'MARTINEZ',
        'HERNANDEZ',
        'F',
        '28/02/1969',
        26
    ),
    (
        'PABLO',
        'GARCIA',
        'HERRERA',
        'M',
        '20/01/1977',
        15
    ),
    (
        'FEDERICO',
        'FERREIRA',
        'LOPEZ',
        'M',
        '05/09/1968',
        20
    ),
    (
        'MARIA',
        'VICENTE',
        'LOPEZ',
        'F',
        '09/05/1973',
        120
    ),
    (
        'IRMA',
        'PEÑA',
        'MARTINEZ',
        'F',
        '03/09/1980',
        22
    ),
    (
        'RODOLFO',
        'GALO',
        'PALACIOS',
        'M',
        '10/11/1968',
        22
    ),
    (
        'SANTIAGO',
        'HERRERA',
        'PEÑA',
        'M',
        '06/08/1960',
        176
    ),
    (
        'ELBIO',
        'GIMENEZ',
        'PEÑA',
        'M',
        '27/12/1978',
        168
    ),
    (
        'JULIO',
        'BRESIA',
        'PEREIRA',
        'M',
        '06/01/1982',
        19
    ),
    (
        'JOUAQUIN',
        'BARCIA',
        'PERERA',
        'M',
        '04/06/1976',
        10
    ),
    (
        'ESTELA',
        'PALACIOS',
        'PEREZ',
        'F',
        '25/05/1969',
        21
    ),
    (
        'LEONARDO',
        'RODAS',
        'RODAS',
        'M',
        '18/04/1975',
        265
    ),
    (
        'FABRICIO',
        'ANGELUCCI',
        'SUAREZ',
        'M',
        '30/12/1981',
        22
    ),
    (
        'JACINTO',
        'DE LOS SANTOS',
        'VICENTE',
        'M',
        '16/04/1945',
        22
    );

UPDATE trabajador SET id_barrios = 4, id_trabajos = 2,id_rubros=3,id_sueldos=1 WHERE ID_TRABAJADOR = 1;
UPDATE trabajador SET id_barrios = 1, id_trabajos = 1,id_rubros=2,id_sueldos=2 WHERE ID_TRABAJADOR = 2;
UPDATE trabajador SET id_barrios = 1, id_trabajos = 1,id_rubros=1,id_sueldos=3 WHERE ID_TRABAJADOR = 3;
UPDATE trabajador SET id_barrios = 1, id_trabajos = 2,id_rubros=3,id_sueldos=4 WHERE ID_TRABAJADOR = 4;
UPDATE trabajador SET id_barrios = 5, id_trabajos = 2,id_rubros=2,id_sueldos=5 WHERE ID_TRABAJADOR = 5;
UPDATE trabajador SET id_barrios = 4, id_trabajos = 1,id_rubros=3,id_sueldos=6 WHERE ID_TRABAJADOR = 6;
UPDATE trabajador SET id_barrios = 5, id_trabajos = 1,id_rubros=5,id_sueldos=7 WHERE ID_TRABAJADOR = 7;
UPDATE trabajador SET id_barrios = 5, id_trabajos = 1,id_rubros=3,id_sueldos=8 WHERE ID_TRABAJADOR = 8;
UPDATE trabajador SET id_barrios = 4, id_trabajos = 2,id_rubros=2,id_sueldos=9 WHERE ID_TRABAJADOR = 9;
UPDATE trabajador SET id_barrios = 5, id_trabajos = 1,id_rubros=1,id_sueldos=10 WHERE ID_TRABAJADOR = 10;
UPDATE trabajador SET id_barrios = 2, id_trabajos = 2,id_rubros=3,id_sueldos=11 WHERE ID_TRABAJADOR = 11;
UPDATE trabajador SET id_barrios = 5, id_trabajos = 1,id_rubros=3,id_sueldos=12 WHERE ID_TRABAJADOR = 12;
UPDATE trabajador SET id_barrios = 2, id_trabajos = 1,id_rubros=5,id_sueldos=13 WHERE ID_TRABAJADOR = 13;
UPDATE trabajador SET id_barrios = 2, id_trabajos = 2,id_rubros=4,id_sueldos=14 WHERE ID_TRABAJADOR = 14;
UPDATE trabajador SET id_barrios = 2, id_trabajos = 2,id_rubros=3,id_sueldos=15 WHERE ID_TRABAJADOR = 15;
UPDATE trabajador SET id_barrios = 1, id_trabajos = 1,id_rubros=1,id_sueldos=16 WHERE ID_TRABAJADOR = 16;
UPDATE trabajador SET id_barrios = 5, id_trabajos = 1,id_rubros=4,id_sueldos=17 WHERE ID_TRABAJADOR = 17;
UPDATE trabajador SET id_barrios = 1, id_trabajos = 1,id_rubros=3,id_sueldos=18 WHERE ID_TRABAJADOR = 18;
UPDATE trabajador SET id_barrios = 2, id_trabajos = 2,id_rubros=2,id_sueldos=19 WHERE ID_TRABAJADOR = 19;
UPDATE trabajador SET id_barrios = 5, id_trabajos = 1,id_rubros=5,id_sueldos=20 WHERE ID_TRABAJADOR = 20;
UPDATE trabajador SET id_barrios = 5, id_trabajos = 1,id_rubros=3,id_sueldos=21 WHERE ID_TRABAJADOR = 21;
UPDATE trabajador SET id_barrios = 3, id_trabajos = 2,id_rubros=3,id_sueldos=22 WHERE ID_TRABAJADOR = 22;
UPDATE trabajador SET id_barrios = 5, id_trabajos = 2,id_rubros=3,id_sueldos=23 WHERE ID_TRABAJADOR = 23;
UPDATE trabajador SET id_barrios = 2, id_trabajos = 1,id_rubros=1,id_sueldos=24 WHERE ID_TRABAJADOR = 24;
UPDATE trabajador SET id_barrios = 2, id_trabajos = 1,id_rubros=3,id_sueldos=25 WHERE ID_TRABAJADOR = 25;
UPDATE trabajador SET id_barrios = 5, id_trabajos = 1,id_rubros=2,id_sueldos=26 WHERE ID_TRABAJADOR = 26;
UPDATE trabajador SET id_barrios = 3, id_trabajos = 2,id_rubros=3,id_sueldos=27 WHERE ID_TRABAJADOR = 27;
UPDATE trabajador SET id_barrios = 2, id_trabajos = 1,id_rubros=1,id_sueldos=28 WHERE ID_TRABAJADOR = 28;
UPDATE trabajador SET id_barrios = 1, id_trabajos = 1,id_rubros=3,id_sueldos=29 WHERE ID_TRABAJADOR = 29;

alter TABLE trabajador
add faltas int

UPDATE trabajador SET faltas = 1 WHERE ID_TRABAJADOR = 1;
UPDATE trabajador SET faltas = 0 WHERE ID_TRABAJADOR = 2;
UPDATE trabajador SET faltas = 0 WHERE ID_TRABAJADOR = 3;
UPDATE trabajador SET faltas = 0 WHERE ID_TRABAJADOR = 4;
UPDATE trabajador SET faltas = 0 WHERE ID_TRABAJADOR = 5;
UPDATE trabajador SET faltas = 3 WHERE ID_TRABAJADOR = 6;
UPDATE trabajador SET faltas = 2 WHERE ID_TRABAJADOR = 7;
UPDATE trabajador SET faltas = 4 WHERE ID_TRABAJADOR = 8;
UPDATE trabajador SET faltas = 1 WHERE ID_TRABAJADOR = 9;
UPDATE trabajador SET faltas = 1 WHERE ID_TRABAJADOR = 10;
UPDATE trabajador SET faltas = 1 WHERE ID_TRABAJADOR = 11;
UPDATE trabajador SET faltas = 1 WHERE ID_TRABAJADOR = 12;
UPDATE trabajador SET faltas = 0 WHERE ID_TRABAJADOR = 13;
UPDATE trabajador SET faltas = 0 WHERE ID_TRABAJADOR = 14;
UPDATE trabajador SET faltas = 0 WHERE ID_TRABAJADOR = 15;
UPDATE trabajador SET faltas = 5 WHERE ID_TRABAJADOR = 16;
UPDATE trabajador SET faltas = 2 WHERE ID_TRABAJADOR = 17;
UPDATE trabajador SET faltas = 4 WHERE ID_TRABAJADOR = 18;
UPDATE trabajador SET faltas = 3 WHERE ID_TRABAJADOR = 19;
UPDATE trabajador SET faltas = 7 WHERE ID_TRABAJADOR = 20;
UPDATE trabajador SET faltas = 8 WHERE ID_TRABAJADOR = 21;
UPDATE trabajador SET faltas = 0 WHERE ID_TRABAJADOR = 22;
UPDATE trabajador SET faltas = 0 WHERE ID_TRABAJADOR = 23;
UPDATE trabajador SET faltas = 0 WHERE ID_TRABAJADOR = 24;
UPDATE trabajador SET faltas = 0 WHERE ID_TRABAJADOR = 25;
UPDATE trabajador SET faltas = 0 WHERE ID_TRABAJADOR = 26;
UPDATE trabajador SET faltas = 1 WHERE ID_TRABAJADOR = 27;
UPDATE trabajador SET faltas = 1 WHERE ID_TRABAJADOR = 28;
UPDATE trabajador SET faltas = 2 WHERE ID_TRABAJADOR = 29;
