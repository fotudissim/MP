onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /prueba_ensamblado_multi/ciclo
add wave -noupdate /prueba_ensamblado_multi/reloj
add wave -noupdate /prueba_ensamblado_multi/pcero
add wave -noupdate /prueba_ensamblado_multi/arb_control
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado_multi/peticiones(0) -radix unsigned -childformat {{/prueba_ensamblado_multi/peticiones(0).acc -radix unsigned} {/prueba_ensamblado_multi/peticiones(0).dir -radix unsigned} {/prueba_ensamblado_multi/peticiones(0).esc -radix unsigned} {/prueba_ensamblado_multi/peticiones(0).ini -radix unsigned} {/prueba_ensamblado_multi/peticiones(0).DE -radix unsigned}}} {/prueba_ensamblado_multi/peticiones(1) -radix unsigned}} -subitemconfig {/prueba_ensamblado_multi/peticiones(0) {-height 16 -radix unsigned -childformat {{/prueba_ensamblado_multi/peticiones(0).acc -radix unsigned} {/prueba_ensamblado_multi/peticiones(0).dir -radix unsigned} {/prueba_ensamblado_multi/peticiones(0).esc -radix unsigned} {/prueba_ensamblado_multi/peticiones(0).ini -radix unsigned} {/prueba_ensamblado_multi/peticiones(0).DE -radix unsigned}}} /prueba_ensamblado_multi/peticiones(0).acc {-height 16 -radix unsigned} /prueba_ensamblado_multi/peticiones(0).dir {-height 16 -radix unsigned} /prueba_ensamblado_multi/peticiones(0).esc {-height 16 -radix unsigned} /prueba_ensamblado_multi/peticiones(0).ini {-height 16 -radix unsigned} /prueba_ensamblado_multi/peticiones(0).DE {-height 16 -radix unsigned} /prueba_ensamblado_multi/peticiones(1) {-height 16 -radix unsigned}} /prueba_ensamblado_multi/peticiones
add wave -noupdate /prueba_ensamblado_multi/pet_listos
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado_multi/respuestas(0) -radix unsigned -childformat {{/prueba_ensamblado_multi/respuestas(0).DL -radix unsigned} {/prueba_ensamblado_multi/respuestas(0).val -radix unsigned}}} {/prueba_ensamblado_multi/respuestas(1) -radix unsigned -childformat {{/prueba_ensamblado_multi/respuestas(1).DL -radix unsigned} {/prueba_ensamblado_multi/respuestas(1).val -radix unsigned}}}} -subitemconfig {/prueba_ensamblado_multi/respuestas(0) {-height 16 -radix unsigned -childformat {{/prueba_ensamblado_multi/respuestas(0).DL -radix unsigned} {/prueba_ensamblado_multi/respuestas(0).val -radix unsigned}}} /prueba_ensamblado_multi/respuestas(0).DL {-height 16 -radix unsigned} /prueba_ensamblado_multi/respuestas(0).val {-height 16 -radix unsigned} /prueba_ensamblado_multi/respuestas(1) {-height 16 -radix unsigned -childformat {{/prueba_ensamblado_multi/respuestas(1).DL -radix unsigned} {/prueba_ensamblado_multi/respuestas(1).val -radix unsigned}}} /prueba_ensamblado_multi/respuestas(1).DL {-height 16 -radix unsigned} /prueba_ensamblado_multi/respuestas(1).val {-height 16 -radix unsigned}} /prueba_ensamblado_multi/respuestas
add wave -noupdate -divider ARBITRAJE
add wave -noupdate -divider {CONTRO MEMORIA}
add wave -noupdate -divider ACCESO
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/acc_dir/dir
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/acc_dir/MPET
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/acc_dir/s_dir
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/acc_dir/s_pet
add wave -noupdate -divider MODIFICACION
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/mod_dir/LD_dir
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/mod_dir/les
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/mexp
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/mod_dir/mod_lec_dir
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/mod_dir/mod_esc_dir
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/mod_dir/mod_exp_dir
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/mod_dir/ED_dir
add wave -noupdate -divider Directorio_mem
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/dir_mem/dir
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/dir_mem/LD
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/dir_mem/ED
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/dir_mem/pe
add wave -noupdate -divider {DETALLE Memo y DIR}
add wave -noupdate -childformat {{/prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/dir_mem/mem(1)(1) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/dir_mem/mem(1)(0) -radix unsigned}} -subitemconfig {/prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/dir_mem/mem(1)(1) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/dir_mem/mem(1)(0) {-height 16 -radix unsigned}} /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/dir_mem/mem(1)
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/mem(1)
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/direc/dir_mem/mem(9)
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/mem(9)
add wave -noupdate -divider {CACHE 0}
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/mresp_cntl_bus
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/mresp_info_bus
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/obs_bus
add wave -noupdate -divider Campos
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(0) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(1) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(2) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(3) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(4) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(5) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(6) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(7) -radix unsigned}} -subitemconfig {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(0) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(1) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(2) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(3) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(4) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(5) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(6) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem(7) {-height 16 -radix unsigned}} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/estado/EST_mem
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(1) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(2) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(3) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(4) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(5) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(6) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(7) -radix unsigned}} -subitemconfig {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(1) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(2) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(3) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(4) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(5) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(6) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(7) {-height 16 -radix unsigned}} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/s_control
add wave -noupdate -divider {Estado CC_proc}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/contro_proc/estado
add wave -noupdate -divider {Estados CC_Obser}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(0)/cache/cach/cache_sin/contro/contro_obser/estado
add wave -noupdate -divider {CACHE 1}
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/mresp_cntl_bus
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/mresp_info_bus
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/obs_bus
add wave -noupdate -divider Campos
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/etiq/ET_Mem/ET_mem
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/estado/EST_mem
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(1) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(2) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(3) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(4) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(5) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(6) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(7) -radix unsigned}} -subitemconfig {/prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(0) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(1) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(2) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(3) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(4) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(5) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(6) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem(7) {-height 16 -radix unsigned}} /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/camino/datos_ca/DAT_Mem/DAT_mem
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/s_control
add wave -noupdate -divider {Estado CC_proc}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_proc/estado
add wave -noupdate -divider {Estado CC_obser}
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/proc_multi(1)/cache/cach/cache_sin/contro/contro_obser/estado
add wave -noupdate -divider BUS
add wave -noupdate -divider MEMORIA
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/MPET
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/ED
add wave -noupdate -radix unsigned /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/dir
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/pe
add wave -noupdate -radix unsigned -childformat {{/prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(7) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(6) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(5) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(4) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(3) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(2) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(1) -radix unsigned} {/prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(0) -radix unsigned}} -subitemconfig {/prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(7) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(6) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(5) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(4) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(3) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(2) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(1) {-height 16 -radix unsigned} /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD(0) {-height 16 -radix unsigned}} /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/LD
add wave -noupdate /prueba_ensamblado_multi/ensa_ca_mem/memoria/memoria/mem/t_indice
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 174
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 40000
configure wave -gridperiod 80000
configure wave -griddelta 20
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {15792 ns}
