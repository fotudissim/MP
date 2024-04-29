--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.controlador_pkg.all;
use work.retardos_controlador_pkg.all;
use work.acciones_pkg.all;
use work.procedimientos_controlador_pkg.all;
--! @image html controlador_procesador.png 

entity controlador is
port (reloj, pcero: in std_logic;
		arb_pet: out std_logic; -- peticion
		arb_conc: in std_logic; -- concesion
		trans_bus: out std_logic; -- utilizando el bus
		pet: in tp_contro_e;
		s_estado: in tp_contro_cam_estado;
		s_control: out tp_contro_cam_cntl;
		resp: out tp_contro_s;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s);
end;
  
architecture compor of controlador is

type tipoestado is (DES0, DES, CMPETIQ, INI, ESCINI, LEC, PML, PMEA, PMEF, ESPL, ESPEA, ESPEF, ESB, ESCP, HECHOL, HECHOE);
signal estado, prxestado: tipoestado;

signal derechos_acceso: std_logic;

begin
-- determinacion de los derechos de acceso al bloque
derechos_acceso <= '1' when (s_estado.AF and s_estado.EST) = '1' else '0';

-- registro de estado
reg_estado: process (reloj, pcero)
begin
	if pcero = '1' then
		estado <= DES after retardo_estado;
	elsif rising_edge(reloj) then
		estado <= prxestado after retardo_estado;
	end if;
-- asignacion de variables a las señales, indicando el retardo, retardo_estado
end process;    
   
-- logica de proximo estado
prx_esta: process(estado, pet, derechos_acceso, arb_conc, resp_m, pcero)
begin
	case estado is
		DES => 
			if hay_peticion_ini_procesador(pet) then 
				prxestado <= INI after retardo_logica_prx_estado;
			elsif hay_peticion_procesador(pet) then
				prxestado <= CMPETIQ after retardo_logica_prx_estado;
			else
				prxestado <= DES after retardo_logica_prx_estado;
			end if;
		INI => 
			prxestado <= ESCINI after retardo_logica_prx_estado;
		ESCINI => 
			prxestado <= HECHOE after retardo_logica_prx_estado;
		DES => 
			if hay_peticion_procesador(pet) then
				prxestado <= CMPETIQ after retardo_logica_prx_estado;
			else
				prxestado <= DES after retardo_logica_prx_estado;
			end if;
		CMPETIQ =>
			if es_acierto_lectura(pet) then 
				prxestado <= LEC after retardo_logica_prx_estado;
			elsif es_fallo_lectura(pet) then 
				prxestado <= PML after retardo_logica_prx_estado;
			elsif es_acierto_escritura(pet) then 
				prxestado <= PMEA after retardo_logica_prx_estado;
			elsif es_fallo_escritura(pet) then 
				prxestado <= PMEF after retardo_logica_prx_estado;
			end if;
		LEC => 
			prxestado <= HECHOL after retardo_logica_prx_estado;
		HECHOL => 
			prxestado <= DES after retardo_logica_prx_estado;
		PML => 
			if hay_concesion(arb_conc) then 
				prxestado <= ESPL after retardo_logica_prx_estado;
			else 
				prxestado <= PML after retardo_logica_prx_estado;
			end if;
		ESPL => 
			if hay_respuesta_memoria(resp_m) then 
				prxestado <= ESB after retardo_logica_prx_estado;
			else 
				prxestado <= ESPL after retardo_logica_prx_estado;
			end if;
		ESB => 
			prxestado <= LEC after retardo_logica_prx_estado;
		PMEA => 
			if hay_concesion(arb_conc) then
				prxestado <= ESPEF after retardo_logica_prx_estado;
			else 
				prxestado <= PMEF after retardo_logica_prx_estado;
			end if;
		ESPEF => 
			if hay_respuesta_memoria(resp_m) then 
				prxestado <= HECHOE after retardo_logica_prx_estado;
			else 
				prxestado <= ESPEF after retardo_logica_prx_estado;
			end if;
		HECHOE => 
			prxestado <= DES after retardo_logica_prx_estado;
	end case;
			
			


-- asignacion de variables a las señales, indicando el retardo, retardo_logica_prx_estado
end process;
   
-- logica de salida
logi_sal: process(estado, pet, derechos_acceso, arb_conc, resp_m, pcero)
begin
--
-- asignacion de variables a las señales, indicando el retardo, retardo_logica_salida
end process;

	
end;
