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
--! @image html interface_cache_red_info.png 

entity interface_cache_red_info is
	port (reloj, pcero	: in  std_logic;
		mpet_info_e: in  tp_peticion_info;
		mpet_info_bus: out  tp_peticion_info;
		mresp_info_bus: in tp_respuesta_info;
		mresp_info_s: out tp_respuesta_info);
end interface_cache_red_info;

architecture estruc of interface_cache_red_info is
signal mpet_info_conc: tp_peticion_info;
begin

-- interface para emitir señal en la red: informacion
reg_pet_info: RD_pet_info port map(reloj => reloj, pcero => pcero, e => mpet_info_e, s => mpet_info_bus);

-- interface de respùesta: informacion
reg_resp_mdato: RD_resp_info port map(reloj => reloj, pcero => pcero, e => mresp_info_bus, s => mresp_info_s);

end;

