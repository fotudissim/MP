--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.interface_cache_bus_pkg.all;
use work.bus_multi_pkg.all;
use work.multis_pkg.all;

package componentes_bus_multi_pkg is

component red_multi is
port (arb_concesiones: in st_arb_concesiones;
	e_info: in tp_bus_info;
	e_cntl: in tp_bus_control;
	s_info: out tp_peticion_info;
	s_cntl: out tp_peticion_control);
end component;

end package componentes_bus_multi_pkg;
