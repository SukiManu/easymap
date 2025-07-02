execute if score $run easymap matches 1 run return 0
execute if score $paste easymap matches 1 run return 0
execute if score $save easymap matches 1 run return 0
execute if score $clear easymap matches 1 run return 0

execute store result score #length easymap run data get storage easymap:data history_data
execute if score #length easymap matches 0 run return run tellraw @a[tag=is_admin] {"text":"There are no placements to clear","color":"gray"}
data modify storage easymap:data args set from storage easymap:data history_data[0]

execute unless data storage easymap:data map_data.dimension run return run tellraw @a[tag=is_admin] {"text":"[ERROR] No dimension data provided",color:"red"}
function easymap:zinternal/spawn_dimension_tracker with storage easymap:data args

function easymap:zinternal/clear/start
data remove storage easymap:data history_data[0]