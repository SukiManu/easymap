$data modify storage easymap:data map set from storage easymap:data history_data[$(i)]
execute store result storage easymap:data map.i int 1.0 run scoreboard players add #i easymap 1
function easymap:zinternal/utilities/list_history/output with storage easymap:data map
execute if score #i easymap < #length easymap run function easymap:zinternal/utilities/list_history/for_loop with storage easymap:data map
