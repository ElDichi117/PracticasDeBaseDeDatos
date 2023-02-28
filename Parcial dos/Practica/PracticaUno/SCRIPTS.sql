--Cálculo para la consulta del sueldo bruto, donde mostrará una tabla con el id del
--empleado, su nombre y el sueldo bruto correspondiente.
select num_emp, nom_emp, (select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) as sueldobruto from "LAEU_SC"."cat_empleados"
order by num_emp;

--Cálculo para la consulta del descuento por faltas, donde mostrará una tabla con el id del
--empleado, su nombre, apellidos y el descuento por faltas correspondiente.
select num_emp, nom_emp, (select faltas_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) as descfaltas from "LAEU_SC"."cat_empleados"
order by num_emp;

--Cálculo para la consulta del ISR, donde mostrará una tabla con el id del
--empleado, su nombre y el ISR correspondiente.
select num_emp, nom_emp, ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 1)) as isr from "LAEU_SC"."cat_empleados"
order by num_emp;

--Cálculo para la consulta del IETU, donde mostrará una tabla con el id del
--empleado, su nombre y el IETU correspondiente.
select num_emp, nom_emp, ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 2)) as ietu from "LAEU_SC"."cat_empleados"
order by num_emp;

--Cálculo para la consulta del IMSS, donde mostrará una tabla con el id del
--empleado, su nombre y el IMSS correspondiente.
select num_emp, nom_emp, ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 3)) as imss from "LAEU_SC"."cat_empleados"
order by num_emp;

--Cálculo para la consulta del sueldo neto, donde mostrará una tabla con el id del
--empleado, su nombre y el sueldo neto correspondiente.
select num_emp, nom_emp, ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) - ((select faltas_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) + ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 1)) + ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 2)) + ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 3)))) as sueldoneto from "LAEU_SC"."cat_empleados"
order by num_emp;

--Cálculo para la consulta de jubilación de los empleados, donde mostrará
--una tabla con el id del empleado y nombre de jubilado.
select num_emp, nom_emp as nombrejubilado from "LAEU_SC"."cat_empleados"
where (select (current_date - fna_emp)/365 >= 65 and sex_emp = 'M')
or (select (current_date - fna_emp)/365 >= 60 and sex_emp = 'F') 
order by num_emp;

--Cálculo para la consulta de sueldo bruto y neto, descuento por faltas e impuestos de los empleados, donde mostrará
--una tabla con el id del empleado, sueldo bruto y neto, descuento por faltas e impuestos.
select num_emp, nom_emp, (select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) as sueldobruto, (select faltas_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) as descfaltas, ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 1)) as isr, ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 2)) as ietu, ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 3)) as imss, ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) - ((select faltas_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) + ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 1)) + ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 2)) + ((select canti_tra_nom * (select val_pago
from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 3)))) as sueldoneto from "LAEU_SC"."cat_empleados"
order by num_emp;