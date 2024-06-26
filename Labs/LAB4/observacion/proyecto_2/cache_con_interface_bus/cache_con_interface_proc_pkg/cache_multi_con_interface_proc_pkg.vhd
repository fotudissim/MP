--
-- Copyright (c) 2017 XXXX, UPC
-- All rights reserved.
-- 

library ieee;
use ieee.std_logic_1164.all;

use work.param_disenyo_pkg.all;
use work.camino_dat_pkg.all;
use work.controlador_pkg.all;
use work.controlador_Obs_pkg.all;
use work.interface_observador_pkg.all;
use work.cache_pkg.all;
use work.interface_cache_bus_pkg.all; 

package cache_multi_con_interface_proc_pkg is

component cache_multi_con_inter_proc is
port (reloj, pcero: in std_logic;
		arb_peticion: out std_logic;
		arb_concesion: in std_logic;
		pet_proc: in tp_peticion;
		pet_listo: out st_cache_listo;
		resp_O: out tp_contro_Obs_s;
		mdato: in st_elem_dat;
		obs_bus: in tp_observacion;
		resp_cache: out tp_respuesta;
		resp_m: in tp_cntl_memoria_e;
		pet_m: out tp_peticion_mem;
		identificador: in natural);
end component;

end package cache_multi_con_interface_proc_pkg;

