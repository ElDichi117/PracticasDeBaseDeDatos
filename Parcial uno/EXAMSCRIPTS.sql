select * from trabajador order by id_trabajador;
select * from barrios;
select * from pagdes;
select * from rubros;
select * from sueldos;
select * from trabajos;

--Esta primer consulta nos ayuda a calcular el sueldo bruto de cada uno de los trabajadores
--Si agregamos un where en donde verifiquemos el id del trabajador podemos hacer esta consulta
--de manera individual
select id_trabajador,nom_trabajador,tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos)) 
as Sueldo_bruto from trabajador order by id_trabajador;

--Esta segunda consulta nos permite calcular el descuento por faltas de cada trabajador
--De igual manera que el anterior podemos hacerlo individual si agregamos un where
select id_trabajador,nom_trabajador,faltas * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos)) 
as Descuento_Faltas from trabajador order by id_trabajador;

--Calculamos el ISR
select id_trabajador,nom_trabajador,tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))  
						 * (select cantidad_pagdes from pagdes where id_pagdes=3) 
as ISR from trabajador order by id_trabajador;

--Calculamos el IETU
select id_trabajador,nom_trabajador,tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))  
						 * (select cantidad_pagdes from pagdes where id_pagdes=4) 

as IETU from trabajador order by id_trabajador;

--Calculamos el IMSS
select id_trabajador,nom_trabajador,tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))  
						 * (select cantidad_pagdes from pagdes where id_pagdes=5) 
as IMSS from trabajador order by id_trabajador;


--Calculamos el sueldo neto
select id_trabajador,nom_trabajador,tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos)) - (select faltas * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))) - (select tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))  
						 * (select cantidad_pagdes from pagdes where id_pagdes=3)) - (select tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))  
						 * (select cantidad_pagdes from pagdes where id_pagdes=4)) - (select tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))  
						 * (select cantidad_pagdes from pagdes where id_pagdes=5))
Sueldo_neto from trabajador order by id_trabajador;

--Consultamos quien se va a jubilar y quien no
select id_trabajador,nom_trabajador as SeJubilan from trabajador
where (SELECT (CURRENT_DATE - fechana_trabajador)/365 >= 65 and sex_trabajador='M')
or (SELECT (CURRENT_DATE - fechana_trabajador)/365 >= 60 and sex_trabajador='F') 
order by id_trabajador;


--Juntando toda la consulta

select id_trabajador,nom_trabajador,tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos)) 
as Sueldo_bruto,faltas * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos)) 
as Descuento_Faltas,tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))  
						 * (select cantidad_pagdes from pagdes where id_pagdes=3) 
as ISR,tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))  
						 * (select cantidad_pagdes from pagdes where id_pagdes=4) 

as IETU,tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))  
						 * (select cantidad_pagdes from pagdes where id_pagdes=5) 
as IMSS,tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos)) - (select faltas * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))) - (select tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))  
						 * (select cantidad_pagdes from pagdes where id_pagdes=3)) - (select tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))  
						 * (select cantidad_pagdes from pagdes where id_pagdes=4)) - (select tiempo_trabajador * (select cantidad_pagdes from pagdes
						   where id_pagdes=(select id_trabajo from trabajos
										   where id_trabajo=id_trabajos))  
						 * (select cantidad_pagdes from pagdes where id_pagdes=5))
as Sueldo_neto from trabajador order by id_trabajador;