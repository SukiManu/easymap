execute store result score #length easymap run data get storage easymap:data history_data
scoreboard players set #i easymap -1
data modify storage easymap:data map set value {}

execute store result storage easymap:data map.i int 1.0 run scoreboard players get #i easymap
function easymap:zinternal/utilities/list_history/for_loop with storage easymap:data map