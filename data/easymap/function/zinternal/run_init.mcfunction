scoreboard players reset $finished easymap

execute store result score #size.x easymap run data get storage easymap:data args.x
execute store result score #size.y easymap run data get storage easymap:data args.y
execute store result score #size.z easymap run data get storage easymap:data args.z

scoreboard players set $max temp 1
scoreboard players operation $temp0 temp = #size.x easymap
scoreboard players operation $temp1 temp = #size.x easymap
scoreboard players operation $temp0 temp %= #48 easymap
execute unless score $temp0 temp matches 0 run scoreboard players add $temp1 temp 48
scoreboard players operation $temp1 temp /= #48 easymap
scoreboard players operation $max temp *= $temp1 temp
scoreboard players operation $temp0 temp = #size.y easymap
scoreboard players operation $temp1 temp = #size.y easymap
scoreboard players operation $temp0 temp %= #48 easymap
execute unless score $temp0 temp matches 0 run scoreboard players add $temp1 temp 48
scoreboard players operation $temp1 temp /= #48 easymap
scoreboard players operation $max temp *= $temp1 temp
scoreboard players operation $temp0 temp = #size.z easymap
scoreboard players operation $temp1 temp = #size.z easymap
scoreboard players operation $temp0 temp %= #48 easymap
execute unless score $temp0 temp matches 0 run scoreboard players add $temp1 temp 48
scoreboard players operation $temp1 temp /= #48 easymap
scoreboard players operation $max temp *= $temp1 temp
execute store result bossbar progress max run scoreboard players get $max temp

scoreboard players operation #xtemp easymap = #size.x easymap
scoreboard players operation #ytemp easymap = #size.y easymap
scoreboard players operation #ztemp easymap = #size.z easymap

data modify storage easymap:data args.current_pos_x set from storage easymap:data args.start_pos_x
data modify storage easymap:data args.current_pos_y set from storage easymap:data args.start_pos_y
data modify storage easymap:data args.current_pos_z set from storage easymap:data args.start_pos_z

data modify storage easymap:data args.old_pos_x set from storage easymap:data args.start_pos_x
data modify storage easymap:data args.old_pos_y set from storage easymap:data args.start_pos_y
data modify storage easymap:data args.old_pos_z set from storage easymap:data args.start_pos_z

execute if score $paste easymap matches 1 run tellraw @a[tag=is_admin] [{text:"[INFO]",extra:[{text:"Started pasting ",color:"white"}],color:"#48c79c"},{nbt:"args.name",storage:"easymap:data",color:"green",bold:1b},{text:" in ",color:"white",bold:0b},{nbt:"args.dimension",storage:"easymap:data","color":"green"},{text:" at x: ",color:"white"},{nbt:"args.start_pos_x",storage:"easymap:data",color:"green"},{text:", y: ",color:"white"},{nbt:"args.start_pos_y",storage:"easymap:data",color:"green"},{text:", z: ",color:"white"},{nbt:"args.start_pos_z",storage:"easymap:data",color:"green"}]

scoreboard players set $run easymap 1
scoreboard players set $watchdog_timer easymap 0