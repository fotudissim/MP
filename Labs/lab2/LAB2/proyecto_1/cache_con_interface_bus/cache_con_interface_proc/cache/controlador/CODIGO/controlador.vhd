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
--! @image html controlador.png 

entity controlador is
port (reloj, pcero: in std_logic;
		pet: in tp_contro_e;
		s_estado: in tp_contro_cam_estado;
		s_control: out tp_contro_cam_cntl;
		resp: out tp_contro_s;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_cntl_memoria_s);
end;
  
architecture compor of controlador is

--type tipoestado is (DES0, DES, CMPETIQ, INI, ESCINI, LEC, PML, PMEA, PMEF, ESPL, ESPEA, ESPEF, ESB, ESCP, HECHOL, HECHOE);
signal estado, prxestado: tipoestado;

signal derechos_acceso: std_logic;
      
begin
-- determinacion de los derechos de acceso al bloque
derechos_acceso <= '1' when (s_estado.AF and s_estado.EST) = '1' else '0';

	process (reloj, pcero)
	begin
		if pcero = '1' then
			estado <= DES0;
		elsif (rising_edge(reloj)) then
			case estado is
				when DES0		=>
					if (hay_peticion_ini_procesador(pet)) then
						prxestado <= INI;
					elsif (hay_peticion_procesador(pet)) then
						prxestado <= CMPETIQ;
					else
						prxestado <= DES0;
					end if;

				when INI 		=>
					prxestado <= ESCINI;

				when ESCINI		=>
					prxestado <= HECHOE;

				when DES		=>
					if (hay_peticion_procesador(pet)) then
						prxestado <= CMPETIQ;
					else
						prxestado <= DES;
					end if;

				when COMPETIQ	=>
					if (es_acierto_lectura(pet)) then
						prxestado <= LEC;
					elsif (es_fallo_lectura(pet)) then
						prxestado <= PML;
					elsif (es_acierto_escritura(pet)) then
						prxestado <= PMEA;
					elsif (es_fallo_escritura(pet)) then
						prxestado <= PMEF;
					end if;

				when LEC 		=>
					prxestado <= HECHOL;

				when HECHOL		=>
					prxestado <= DES;

				when PML  		=>
					prxestado <= ESPL;
				when ESPL		=>
					if(hay_respuesta_memoria(resp_m)) then
						prxestado <= ESB;
					else
						prxestado <= ESPL;
					end if;
				when ESB		=>
					prxestado <= LEC;

				when PMEA		=>
					prxestado <= ESPEA;

				when ESPEA		=>
					if(hay_respuesta_memoria(resp_m)) then
						prxestado <= ESCP;
					else
						prxestado <= ESPEA;
					end if;

				when ESCP		=>
					prxestado <= HECHOE;
				when PMEF		=>
					prxestado <= ESPEF;

				when ESPEF		=>
					if(hay_respuesta_memoria(resp_m)) then
						prxestado <= HECHOE;
					else
						prxestado <= ESPEF;
					end if;
				when HECHOE		=>
					prxestado <= DES;

			end case;
		end if;
	end process;

	-- Toca acabar // Obviament està xungo però només cal llegir procedimientos_controlador_pkg.vhd
	process (estado)
	begin
			case estado is
				when DES0		=>
					--nada
				when INI 		=>
					--nada
				when ESCINI		=>
					actualizar_dato(s_control);
					actualizar_etiqueta(s_control);
					actualizar_estado(s_control);
				when DES		=>
					interfaces_DES(s_control);
				when COMPETIQ	=>
					lectura_etiq_estado(s_control);
				when LEC 		=>
					lectura_datos(s_control);
				when HECHOL		=>
					interfaces_HECHOL(s_control);
				when PML  		=>
					peticion_memoria_lectura();
				when ESPL		=>
					-- espera
				when ESB		=>
					actualizar_dato(s_control);
					actualizar_etiqueta(s_control);
					actualizar_estado(s_control);
				when PMEA		=>
					peticion_memoria_escritura();

				when ESPEA		=>
					--espera
				when ESCP		=>
					actualizar_dato(s_control);
				when PMEF		=>
					peticion_memoria_escritura();
				when ESPEF		=>
					-- espera
				when HECHOE		=>
					--nada
			end case;
	end process;
	
end;
