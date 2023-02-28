CREATE OR REPLACE VIEW "Alianza_SC"."vis_InfoGeneral"
 AS
 SELECT ( SELECT "cat_TiposBebidas".nom_tiposbebidas
           FROM "Alianza_SC"."cat_TiposBebidas"
          WHERE "cat_TiposBebidas".id_tiposbebidas = (( SELECT "cat_Bebidas".id_tipbebida
                   FROM "Alianza_SC"."cat_Bebidas"
                  WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven))) AS descripcion,
    ( SELECT "cat_TiposBebidas".id_tiposbebidas
           FROM "Alianza_SC"."cat_TiposBebidas"
          WHERE "cat_TiposBebidas".id_tiposbebidas = (( SELECT "cat_Bebidas".id_tipbebida
                   FROM "Alianza_SC"."cat_Bebidas"
                  WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven))) AS tipo_de_bebida,
    ( SELECT "cat_Bebidas".id_bebida
           FROM "Alianza_SC"."cat_Bebidas"
          WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven) AS id_bebida,
    ( SELECT "cat_Bebidas".nom_bebida
           FROM "Alianza_SC"."cat_Bebidas"
          WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven) AS bebida,
    ( SELECT "cat_Bebidas".precio_bebida
           FROM "Alianza_SC"."cat_Bebidas"
          WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven) AS precio_unitario,
    (( SELECT "cat_Bebidas".precio_bebida
           FROM "Alianza_SC"."cat_Bebidas"
          WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven)) * (( SELECT "Detalle_Ventas".cantunidades
           FROM "Alianza_SC"."Detalle_Ventas"
          WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven)) AS totalvendido,
    "cat_Vendedor".id_equipo AS numero_equipo,
    "cat_Vendedor".id_ven AS id_vendedor,
    "cat_Vendedor".nom_ven AS vendedor,
    "cat_Vendedor".apa_ven AS a_paterno,
    "cat_Vendedor".ama_ven AS a_materno,
    "cat_Vendedor".fechaingreso_ven AS fecha_de_ingreso,
    "cat_Vendedor".sex_ven AS sexo,
    "cat_Vendedor".rfc_ven AS rfc,
    ( SELECT "Detalle_Ventas".cantunidades
           FROM "Alianza_SC"."Detalle_Ventas"
          WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven) AS unidades_vendidas,
    ( SELECT "Ventas".fecha_venta
           FROM "Alianza_SC"."Ventas"
          WHERE "Ventas".id_venta = "cat_Vendedor".id_ven) AS fecha_venta,
    ( SELECT "Ventas".hora_venta
           FROM "Alianza_SC"."Ventas"
          WHERE "Ventas".id_venta = "cat_Vendedor".id_ven) AS hora_venta,
    (( SELECT "cat_Bebidas".precio_bebida
           FROM "Alianza_SC"."cat_Bebidas"
          WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven)) * (( SELECT "Detalle_Ventas".cantunidades
           FROM "Alianza_SC"."Detalle_Ventas"
          WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven)) * 0.10 AS comision,
    (( SELECT "cat_Bebidas".precio_bebida
           FROM "Alianza_SC"."cat_Bebidas"
          WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven)) * (( SELECT "Detalle_Ventas".cantunidades
           FROM "Alianza_SC"."Detalle_Ventas"
          WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven)) * 0.10 * 0.16 AS iva,
    (( SELECT "cat_Bebidas".precio_bebida
           FROM "Alianza_SC"."cat_Bebidas"
          WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven)) * (( SELECT "Detalle_Ventas".cantunidades
           FROM "Alianza_SC"."Detalle_Ventas"
          WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven)) * 0.10 - (( SELECT "cat_Bebidas".precio_bebida
           FROM "Alianza_SC"."cat_Bebidas"
          WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven)) * (( SELECT "Detalle_Ventas".cantunidades
           FROM "Alianza_SC"."Detalle_Ventas"
          WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven)) * 0.10 * 0.16 AS sueldobase,
        CASE
            WHEN ((( SELECT "cat_Bebidas".precio_bebida
               FROM "Alianza_SC"."cat_Bebidas"
              WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven)) * (( SELECT "Detalle_Ventas".cantunidades
               FROM "Alianza_SC"."Detalle_Ventas"
              WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven))) > 40000 THEN (( SELECT "cat_Bebidas".precio_bebida
               FROM "Alianza_SC"."cat_Bebidas"
              WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven)) * (( SELECT "Detalle_Ventas".cantunidades
               FROM "Alianza_SC"."Detalle_Ventas"
              WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven)) * 0.05
            ELSE 0
        END AS bono,
        CASE
            WHEN ((( SELECT "cat_Bebidas".precio_bebida
               FROM "Alianza_SC"."cat_Bebidas"
              WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven)) * (( SELECT "Detalle_Ventas".cantunidades
               FROM "Alianza_SC"."Detalle_Ventas"
              WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven))) > 40000 THEN (( SELECT "cat_Bebidas".precio_bebida
               FROM "Alianza_SC"."cat_Bebidas"
              WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven)) * (( SELECT "Detalle_Ventas".cantunidades
               FROM "Alianza_SC"."Detalle_Ventas"
              WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven)) * 0.05 + (( SELECT "cat_Bebidas".precio_bebida
               FROM "Alianza_SC"."cat_Bebidas"
              WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven)) * (( SELECT "Detalle_Ventas".cantunidades
               FROM "Alianza_SC"."Detalle_Ventas"
              WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven)) * 0.10 - (( SELECT "cat_Bebidas".precio_bebida
               FROM "Alianza_SC"."cat_Bebidas"
              WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven)) * (( SELECT "Detalle_Ventas".cantunidades
               FROM "Alianza_SC"."Detalle_Ventas"
              WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven)) * 0.10 * 0.16
            ELSE 0 + (( SELECT "cat_Bebidas".precio_bebida
               FROM "Alianza_SC"."cat_Bebidas"
              WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven)) * (( SELECT "Detalle_Ventas".cantunidades
               FROM "Alianza_SC"."Detalle_Ventas"
              WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven)) * 0.10 - (( SELECT "cat_Bebidas".precio_bebida
               FROM "Alianza_SC"."cat_Bebidas"
              WHERE "cat_Bebidas".id_bebida = "cat_Vendedor".id_ven)) * (( SELECT "Detalle_Ventas".cantunidades
               FROM "Alianza_SC"."Detalle_Ventas"
              WHERE "Detalle_Ventas".num_venta = "cat_Vendedor".id_ven)) * 0.10 * 0.16
        END AS sueldoneto,
    (CURRENT_DATE - "cat_Vendedor".fechaingreso_ven) / 365 AS tiemposervicio,
        CASE
            WHEN "cat_Vendedor".sex_ven = 'F' AND ((CURRENT_DATE - "cat_Vendedor".fechaingreso_ven) / 365) >= 30 THEN 'Si'
            WHEN "cat_Vendedor".sex_ven = 'M' AND ((CURRENT_DATE - "cat_Vendedor".fechaingreso_ven) / 365) >= 35 THEN 'Si'
            ELSE 'No'
        END AS "jubilación"
   FROM "Alianza_SC"."cat_Vendedor";
   
select * from "Alianza_SC"."vis_InfoGeneral"