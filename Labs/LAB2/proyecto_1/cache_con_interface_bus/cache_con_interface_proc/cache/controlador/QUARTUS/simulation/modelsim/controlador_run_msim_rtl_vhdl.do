transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Gian/Documents/FIB/MP/MP/Labs/lab2/LAB2/proyecto_1/tipos_constantes_pkg/acciones_pkg.vhd}
vcom -93 -work work {C:/Users/Gian/Documents/FIB/MP/MP/Labs/lab2/LAB2/proyecto_1/tipos_constantes_pkg/retardos_controlador_pkg.vhd}
vcom -93 -work work {C:/Users/Gian/Documents/FIB/MP/MP/Labs/lab2/LAB2/proyecto_1/tipos_constantes_pkg/param_disenyo_pkg.vhd}
vcom -93 -work work {C:/Users/Gian/Documents/FIB/MP/MP/Labs/lab2/LAB2/proyecto_1/tipos_constantes_pkg/controlador_pkg.vhd}
vcom -93 -work work {C:/Users/Gian/Documents/FIB/MP/MP/Labs/lab2/LAB2/proyecto_1/cache_con_interface_bus/cache_con_interface_proc/cache/controlador/CODIGO/procedimientos_controlador_pkg.vhd}
vcom -93 -work work {C:/Users/Gian/Documents/FIB/MP/MP/Labs/lab2/LAB2/proyecto_1/cache_con_interface_bus/cache_con_interface_proc/cache/controlador/CODIGO/controlador.vhd}

