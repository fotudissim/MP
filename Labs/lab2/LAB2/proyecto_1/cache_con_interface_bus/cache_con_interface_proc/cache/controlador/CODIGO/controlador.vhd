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


process(pcero, reloj)
variable v_prxestado: tipoestado;
begin 
	if pcero = '1' then 
		v_prxestado := DES0;
	elsif rising_edge(reloj) then 
    case estado is
        when DES0 =>
            if hay_peticion_procesador(pet) then
                if hay_peticion_ini_procesador(pet) then
                    v_prxestado := INI;
                else
                    v_prxestado := CMPETIQ;
                end if;
            else
                v_prxestado := DES0;
            end if;
        when INI =>
            v_prxestado := ESCINI;
        when ESCINI =>
            v_prxestado := HECHOE;
        when DES =>
            if hay_peticion_procesador(pet) then
                v_prxestado := CMPETIQ;
            else
                v_prxestado := DES;
            end if;
        when CMPETIQ =>
            if es_fallo_lectura(pet, derechos_acceso) then
                v_prxestado := PML;
            elsif es_acierto_lectura(pet, derechos_acceso) then
                v_prxestado := LEC;
            elsif es_fallo_escritura(pet, derechos_acceso) then
                v_prxestado := PMEF;
            elsif es_acierto_escritura(pet, derechos_acceso) then
                v_prxestado := PMEA;
            end if;
        when LEC =>
            v_prxestado := HECHOL;
        when HECHOL =>
            v_prxestado := DES;
        when PML =>
            v_prxestado := ESPL;
        when ESPL =>
            if hay_respuesta_memoria(resp_m) then
                v_prxestado := ESB;
            else
                v_prxestado := ESPL;
            end if;
        when ESB =>
            v_prxestado := LEC;
        when PMEA =>
            v_prxestado := ESPEA;
        when ESPEA =>
            if hay_respuesta_memoria(resp_m) then
                v_prxestado := ESCP;
            else
                v_prxestado := ESPEA;
            end if;
        when ESCP =>
            v_prxestado := HECHOE;
        when PMEF =>
            v_prxestado := ESPEF;
        when ESPEF =>
            if hay_respuesta_memoria(resp_m) then
                v_prxestado := HECHOE;
            else
                v_prxestado := ESPEF;
            end if;
        when HECHOE =>
            v_prxestado := DES;
    end case;
	end if;
    prxestado <= v_prxestado after retardo_logica_prx_estado;
end process;

	estado <= prxestado;

	-- Toca acabar // Obviament està xungo però només cal llegir procedimientos_control_sador_pkg.vhd
	logi_sal: process(estado, pet, derechos_acceso, resp_m)
	variable v_s_control: tp_contro_cam_cntl;
	variable v_pet_m: tp_cntl_memoria_s;
	variable v_resp: tp_contro_s;
	begin
		 por_defecto(v_s_control, v_pet_m, v_resp);
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
					if hay_peticion_procesador(pet) then
						 lectura_etiq_estado(v_s_control);
					end if;
			  when CMPETIQ =>
					interfaces_en_CURSO(v_resp);
					if es_acierto_lectura(pet, derechos_acceso) then
						 lectura_datos(v_s_control);
					elsif es_fallo_lectura(pet, derechos_acceso) then
						 peticion_memoria_lectura(v_pet_m);
					elsif es_acierto_escritura(pet, derechos_acceso) then
						 peticion_memoria_escritura(v_pet_m);
					elsif es_fallo_escritura(pet, derechos_acceso) then
						 peticion_memoria_escritura(v_pet_m);
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
					interfaces_en_CURSO(v_resp);
					peticion_memoria_escritura(v_pet_m);
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
					interfaces_HECHOE(v_resp);
		 end case;
		 s_control <= v_s_control after retardo_logica_salida;
		 pet_m <= v_pet_m after retardo_logica_salida;
		 resp <= v_resp after retardo_logica_salida;
	end process;

end;