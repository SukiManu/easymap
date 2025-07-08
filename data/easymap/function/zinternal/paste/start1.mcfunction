execute store result storage easymap:data args.start_pos_y int 1.0 run data get entity @n[type=marker,tag=fuck_this] Pos[1]
execute store result storage easymap:data args.start_pos_x int 1.0 run data get entity @n[type=marker,tag=fuck_this] Pos[0]
execute store result storage easymap:data args.start_pos_z int 1.0 run data get entity @n[type=marker,tag=fuck_this] Pos[2]

execute as @p run function easymap:zinternal/get_dimension/run
data modify storage easymap:data args.dimension set from storage easymap:data map_data.dimension

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

scoreboard players set $paste easymap 1


function easymap:zinternal/paste/history/add


function easymap:zinternal/run_init

execute store result bossbar easymap:progress max run scoreboard players get $max temp
bossbar set easymap:progress players @a
bossbar set easymap:progress name {"text":"Pasting map","color":"gray"}
scoreboard players set $progress easymap 0
