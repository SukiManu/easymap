execute store result score #length easymap run data get storage easymap:maps list
scoreboard players set #i easymap 0
data modify storage easymap:data map set value {}
execute store result storage easymap:data map.i int 1.0 run scoreboard players get #i easymap
function easymap:zinternal/utilities/list_maps/for_loop with storage easymap:data map