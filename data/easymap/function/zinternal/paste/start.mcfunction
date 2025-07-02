#Check if an operation is already running
execute if score $run easymap matches 1 run return 0
execute if score $paste easymap matches 1 run return 0
execute if score $save easymap matches 1 run return 0
execute if score $clear easymap matches 1 run return 0
execute unless entity @p run return run tellraw server {"text":"One player is required to start pasting the map."}
data remove storage easymap:data args
forceload add ~ ~
execute unless entity @e[type=marker,tag=fuck_this,limit=1] run summon marker ~ ~ ~ {Tags:["fuck_this"]}
execute unless entity @e[type=marker,tag=fuck_this,limit=1] run return run schedule function easymap:zinternal/paste/try_after_forceload 5t
execute store result storage easymap:data args.start_pos_y int 1.0 run data get entity @n[type=marker,tag=fuck_this] Pos[1]
execute store result storage easymap:data args.start_pos_x int 1.0 run data get entity @n[type=marker,tag=fuck_this] Pos[0]
execute store result storage easymap:data args.start_pos_z int 1.0 run data get entity @n[type=marker,tag=fuck_this] Pos[2]
kill @e[type=marker,tag=fuck_this]
forceload remove ~ ~

execute unless data storage easymap:data map_data.structure_name run return run tellraw @a[tag=is_admin] {"text":"[ERRO] Eronated data>>map_data.structure_name not found","color":"red"}

#Initiate process type
scoreboard players set $paste easymap 1



data modify storage easymap:data map_data.start_pos_x set from storage easymap:data args.start_pos_x
data modify storage easymap:data map_data.start_pos_y set from storage easymap:data args.start_pos_y
data modify storage easymap:data map_data.start_pos_z set from storage easymap:data args.start_pos_z

data modify storage easymap:data args.name set from storage easymap:data map_data.name
data modify storage easymap:data args.structure_name set from storage easymap:data map_data.structure_name
data modify storage easymap:data args.x set from storage easymap:data map_data.x
data modify storage easymap:data args.y set from storage easymap:data map_data.y
data modify storage easymap:data args.z set from storage easymap:data map_data.z
scoreboard players set #id easymap 0
data modify storage easymap:data args.id set value 0

forceload add 22517732 22517732

summon marker 22517732 0 22517732 {Tags:["easymap.dimension_tracker"]}
execute as @p run function easymap:zinternal/get_dimension/run
data modify storage easymap:data args.dimension set from storage easymap:data map_data.dimension

function easymap:zinternal/paste/history/add


function easymap:zinternal/run_init

execute store result bossbar progress max run scoreboard players get $max temp
bossbar set progress players @a
bossbar set progress name {"text":"Pasting map","color":"gray"}
scoreboard players set $progress easymap 0