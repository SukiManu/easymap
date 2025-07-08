$data modify storage easymap:data map.structure_name set from storage easymap:maps list[$(i)].structure_name
function easymap:zinternal/utilities/list_maps/output with storage easymap:data map
execute store result storage easymap:data map.i int 1.0 run scoreboard players add #i easymap 1
execute if score #i easymap < #length easymap run function easymap:zinternal/utilities/list_maps/for_loop with storage easymap:data map