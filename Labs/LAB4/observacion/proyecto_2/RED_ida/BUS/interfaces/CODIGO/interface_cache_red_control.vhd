--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.interface_cache_bus_pkg.all;
use work.componentes_interfaces_bus_pkg.all;
use work.componentes_interfaces_bus_multi_pkg.all;
--! @image html interface_cache_red_control.png 

entity interface_cache_red_control is
	port (reloj, pcero: in  std_logic;
		mpet_cntl_e: in  tp_peticion_control;
		mpet_cntl_bus: out  tp_peticion_control;
		mresp_cntl_bus: in tp_respuesta_control;
		mresp_cntl_s: out tp_respuesta_control);
end interface_cache_red_control;

architecture estruc of interface_cache_red_control is
signal mpet_cntl_conc: tp_peticion_control;
begin

-- interface para emitir señal en la red: control
reg_pet_cntl: RC_pet port map(reloj => reloj, pcero => pcero, e => mpet_cntl_e, s => mpet_cntl_bus);

-- interface de respuesta: control
reg_resp_cntl: RC_resp port map(reloj => reloj, pcero => pcero, e => mresp_cntl_bus, s => mresp_cntl_s);

end;

