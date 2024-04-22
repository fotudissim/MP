transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/dades/gianfranco.saenz.berrocal/Documents/MP/lab2/LAB2/proyecto_1/tipos_constantes_pkg/retardos_memorias_pkg.vhd}
vcom -93 -work work {/dades/gianfranco.saenz.berrocal/Documents/MP/lab2/LAB2/proyecto_1/tipos_constantes_pkg/param_disenyo_pkg.vhd}
vcom -93 -work work {/dades/gianfranco.saenz.berrocal/Documents/MP/lab2/LAB2/proyecto_1/tipos_constantes_pkg/param_memorias_pkg.vhd}
vcom -93 -work work {/dades/gianfranco.saenz.berrocal/Documents/MP/lab2/LAB2/proyecto_1/tipos_constantes_pkg/campo_DAT_pkg.vhd}
vcom -93 -work work {/dades/gianfranco.saenz.berrocal/Documents/MP/lab2/LAB2/proyecto_1/cache_con_interface_bus/cache_con_interface_proc/cache/camino_de_datos/componentes/campo_datos/componentes/m_datos/CODIGO/m_DAT.vhd}

vcom -93 -work work {/dades/gianfranco.saenz.berrocal/Documents/MP/lab2/LAB2/proyecto_1/cache_con_interface_bus/cache_con_interface_proc/cache/camino_de_datos/componentes/campo_datos/componentes/m_datos/QUARTUS/../PRUEBAS/prueba_m_DAT.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc"  prueba_m_DAT

do /dades/gianfranco.saenz.berrocal/Documents/MP/lab2/LAB2/proyecto_1/cache_con_interface_bus/cache_con_interface_proc/cache/camino_de_datos/componentes/campo_datos/componentes/m_datos/QUARTUS/../PRUEBAS/formato_ventanas.do
