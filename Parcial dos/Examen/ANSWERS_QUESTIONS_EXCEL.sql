SELECT * FROM "Alianza_SC"."vis_InfoGeneral"


--1.-¿Quién es el vendedor que más vendio, a qué equipo pertenece y cuál es el monto vendido?
select "vis_InfoGeneral".numero_equipo,"vis_InfoGeneral".vendedor,"vis_InfoGeneral".a_paterno,"vis_InfoGeneral".a_materno,
"vis_InfoGeneral".totalvendido
from "Alianza_SC"."vis_InfoGeneral"
where "vis_InfoGeneral".totalvendido = (select max("vis_InfoGeneral".totalvendido) from "Alianza_SC"."vis_InfoGeneral")

--2.-¿cuál fue el producto más vendido y con cuántas unidades?
select "vis_InfoGeneral".descripcion,"vis_InfoGeneral".bebida,"vis_InfoGeneral".unidades_vendidas
from "Alianza_SC"."vis_InfoGeneral"
where "vis_InfoGeneral".unidades_vendidas = (select max("vis_InfoGeneral".unidades_vendidas) from "Alianza_SC"."vis_InfoGeneral")

--3.-¿Cuál es el monto de ventas por parte de las trabajadoras?
select sum("vis_InfoGeneral".totalvendido) as VentasMujeres
from "Alianza_SC"."vis_InfoGeneral"
where "vis_InfoGeneral".sexo = 'F'

--4.-¿Cuál fue el monto total de ventas por parte de los trabajadores?
select sum("vis_InfoGeneral".totalvendido) as VentasHombres
from "Alianza_SC"."vis_InfoGeneral"
where "vis_InfoGeneral".sexo = 'M'