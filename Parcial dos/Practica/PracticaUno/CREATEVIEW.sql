create or replace view "LAEU_SC"."vis_SueldoBruto" as
select num_emp, nom_emp, apa_emp, ama_emp, sex_emp,fna_emp,barrio_emp,puesto_emp,tiptra_emp, (select canti_tra_nom * (select val_pago
	from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
	where num_emp = num_emp_nom) as sueldobruto, (select faltas_nom * (select val_pago
	from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
	where num_emp = num_emp_nom) as descfaltas, ((select canti_tra_nom * (select val_pago
	from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
	where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 1)) as isr, ((select canti_tra_nom * (select val_pago
	from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
	where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 2)) as ietu, ((select canti_tra_nom * (select val_pago
	from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
	where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 3)) as imss,
	
	(select canti_tra_nom * (select val_pago
	from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
	where num_emp = num_emp_nom) - (select faltas_nom * (select val_pago
	from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
	where num_emp = num_emp_nom) - ((select canti_tra_nom * (select val_pago
	from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
	where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 1)) - ((select canti_tra_nom * (select val_pago
	from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
	where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 2)) - ((select canti_tra_nom * (select val_pago
	from "LAEU_SC"."cat_pagos" where id_pago = tip_pag_nom) from "LAEU_SC"."nomina"
	where num_emp = num_emp_nom) * (select val_imp from "LAEU_SC"."cat_impuestos" where id_imp = 3))
	as SueldoNeto,
	case 
		when (sex_emp='F') and ((current_date - fna_emp)/365) >= 60 then 'Si'
		when (sex_emp='M') and ((current_date - fna_emp)/365) >= 65 then 'Si'
		else 'No'
		end
	as Jubilación
from "LAEU_SC"."cat_empleados" order by num_emp;

select * from "LAEU_SC"."vis_SueldoBruto"

select num_emp,nom_emp,sex_emp,((current_date -fna_emp)/365) as edad,sueldoneto,
	case 
		when (sex_emp='F') and ((current_date -fna_emp)/365) >= 40 and sueldoneto < (select avg(sueldoneto) from "LAEU_SC"."vis_SueldoBruto") then 'Si' 
		when (sex_emp='M') and ((current_date -fna_emp)/365) >= 45 and sueldoneto < (select avg(sueldoneto) from "LAEU_SC"."vis_SueldoBruto") then 'Si'
		else 'No'
		end	
	as TieneBono,	
	case 
		when (sex_emp='F') and ((current_date -fna_emp)/365) >= 40 and sueldoneto < (select avg(sueldoneto) from "LAEU_SC"."vis_SueldoBruto") 
		then sueldoneto * .15 
		when (sex_emp='M') and ((current_date -fna_emp)/365) >= 45 and sueldoneto < (select avg(sueldoneto) from "LAEU_SC"."vis_SueldoBruto") 
		then sueldoneto * .10
		else 0
		end	
	as CantidadBono	
from "LAEU_SC"."vis_SueldoBruto"

