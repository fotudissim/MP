--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.retardos_controlador_pkg.all;
use work.acciones_pkg.all;
use work.procedimientos_controlador_pkg.all;
--! @image html controlador_iden.png 

entity controlador is
port (reloj, pcero: in std_logic;
		arb_pet: out std_logic; -- peticion de acceso a la red
		arb_conc: in std_logic; -- concesion de acceso a la red
		pet: in tp_contro_e;
		s_estado: in tp_contro_cam_estado;
		s_control: out tp_contro_cam_cntl;
		resp: out tp_contro_s;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s;
		identificador: in natural); -- identificador del CC
end;
  
architecture compor of controlador is

--type tipoestado is (DES0, DES, CMPETIQ, INI, ESCINI, LEC, PML, PMEA, PMEF, ESPL, ESPEA, ESPEF, ESB, ESCP, HECHOL, HECHOE);
signal estado, prxestado: tipoestado;

signal derechos_acceso: std_logic;

signal propia: std_logic;

begin
-- identificacion del CC
propia <= '1' when resp_m.iden = std_logic_vector(to_unsigned(identificador, resp_m.iden'length)) else '0';

-- determinacion de los derechos de acceso al bloque
derechos_acceso <= '1' when (s_estado.AF and s_estado.EST) = '1' else '0';

-- registro de estado
reg_estado: process (reloj, pcero)
variable v_estado: tipoestado;
begin
	if pcero = '1' then
		v_estado := DES0;
	elsif rising_edge(reloj) then
		v_estado := prxestado;										
	end if;
-- asignacion de la variable a la señal, indicando el retardo
	estado <= v_estado after retardo_estado;
end process;    
   
-- logica de proximo estado
prx_esta: process(estado, pet, derechos_acceso, arb_conc, resp_m, pcero)
begin
	case estado is
		when DES0 => 
			if hay_peticion_ini_procesador(pet) then 
				prxestado <= INI after retardo_logica_prx_estado;
			elsif hay_peticion_procesador(pet) then
				prxestado <= CMPETIQ after retardo_logica_prx_estado;
			else
				prxestado <= DES0 after retardo_logica_prx_estado;
			end if;
		when INI => 
			prxestado <= ESCINI after retardo_logica_prx_estado;
		when ESCINI => 
			prxestado <= HECHOE after retardo_logica_prx_estado;
		when DES => 
			if hay_peticion_procesador(pet) then
				prxestado <= CMPETIQ after retardo_logica_prx_estado;
			else
				prxestado <= DES after retardo_logica_prx_estado;
			end if;
		when CMPETIQ =>
			if es_acierto_lectura(pet, derechos_acceso) then 
				prxestado <= LEC after retardo_logica_prx_estado;
			elsif es_fallo_lectura(pet, derechos_acceso) then 
				prxestado <= PML after retardo_logica_prx_estado;
			elsif es_acierto_escritura(pet, derechos_acceso) then 
				prxestado <= PMEA after retardo_logica_prx_estado;
			elsif es_fallo_escritura(pet, derechos_acceso) then 
				prxestado <= PMEF after retardo_logica_prx_estado;
			end if;
		when LEC => 
			prxestado <= HECHOL after retardo_logica_prx_estado;
		when HECHOL => 
			prxestado <= DES after retardo_logica_prx_estado;
		when PML => 
			if hay_concesion(arb_conc) then 
				prxestado <= ESPL after retardo_logica_prx_estado;
			else 
				prxestado <= PML after retardo_logica_prx_estado;
			end if;
		when ESPL => 
			if hay_respuesta_memoria(resp_m) then 
				prxestado <= ESB after retardo_logica_prx_estado;
			else 
				prxestado <= ESPL after retardo_logica_prx_estado;
			end if;
		when ESB => 
			prxestado <= LEC after retardo_logica_prx_estado;
		when PMEA => 
			if hay_concesion(arb_conc) then
				prxestado <= ESPEF after retardo_logica_prx_estado;
			else 
				prxestado <= PMEF after retardo_logica_prx_estado;
			end if;
		when ESPEF => 
			if hay_respuesta_memoria(resp_m) then 
				prxestado <= HECHOE after retardo_logica_prx_estado;
			else 
				prxestado <= ESPEF after retardo_logica_prx_estado;
			end if;
		when HECHOE => 
			prxestado <= DES after retardo_logica_prx_estado;
	end case;
-- asignacion de variables a las señales, indicando el retardo, retardo_logica_prx_estado
end process;
   
-- logica de salida
logi_sal: process(estado, pet, derechos_acceso, arb_conc, resp_m, pcero)
	variable v_s_control: tp_contro_cam_cntl;
	variable v_pet_m: tp_cntl_memoria_s;
	variable v_resp: tp_contro_s;
begin
	case estado is
		when DES0 => 
			if not hay_peticion_procesador(pet) then
				interfaces_DES(v_resp);
			end if;
		when INI => 
			interfaces_en_CURSO(v_resp);
			actualizar_etiqueta(v_s_control);
			actualizar_estado(v_s_control, '1');
			actualizar_dato(v_s_control);
		when ESCINI => 
			interfaces_en_CURSO(v_resp);
		when DES => 
			interfaces_DES(v_resp);
			if hay_peticion_procesador(v_resp) then 
				lectura_etiq_estado(v_s_control);
			end if;
		when CMPETIQ => 
			interfaces_en_CURSO(v_resp);
			if es_acierto_lectura(pet, derechos_acceso) then 
				lectura_datos(v_s_control);
			elsif es_fallo_lectura(pet, derechos_acceso) then 
				peticion_arbitraje(arb_pet);
			elsif es_acierto_escritura(pet, derechos_acceso) then 
				peticion_arbitraje(arb_pet);
			elsif es_fallo_escritura(pet, derechos_acceso) then 
				peticion_arbitraje(arb_pet);
			end if;
		when LEC =>
			interfaces_en_CURSO(v_resp);
		when HECHOL =>
			interfaces_HECHOL(v_resp);
		when PML => 
			interfaces_en_CURSO(v_resp);
		when ESPL => 
			interfaces_en_CURSO(v_resp);
			if hay_respuesta_memoria(resp_m) then 
				actu_datos_desde_bus(v_s_control);
				actualizar_etiqueta(v_s_control);
				actualizar_estado(v_s_control, '1');
				actualizar_dato(v_s_control);
			end if;
		when ESB => 
			interfaces_en_CURSO(v_resp);
			lectura_datos(v_s_control);
		when PMEA => 
			interfaces_en_CURSO(v_s_control);
			if hay_concesion(arb_conc) then 
				peticion_memoria_lectura(v_pet_m);
			else
				peticion_arbitraje(arb_pet);
			end if; 
		when ESPEA => 
			interfaces_en_CURSO(v_resp);
			if hay_respuesta_memoria(resp_m) then 
				actualizar_dato(v_s_control);
			end if;
		when ESCP => 
			interfaces_en_CURSO(v_resp);
		when PMEF => 
			interfaces_en_CURSO(v_resp);
		when ESPEF =>
			interfaces_en_CURSO(v_resp);
		when HECHOE =>
			interfaces_en_CURSO(v_resp);
	end case;

	s_control <= v_s_control after retardo_logica_salida;
	pet_m <= v_pet_m after retardo_logica_salida;
	resp <= v_resp after retardo_logica_salida;

end process;
	
	
end;
