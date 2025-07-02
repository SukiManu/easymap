execute if score $run easymap matches 1 run return 0
execute if score $paste easymap matches 1 run return 0
execute if score $save easymap matches 1 run return 0
execute if score $clear easymap matches 1 run return 0
execute unless entity @s[type=player] run return 0
data remove storage easymap:data args

$data modify storage easymap:data args.structure_name set value "$(structure_name)"
execute if data storage easymap:data args{structure_name:""} run return run tellraw @s {"text":"[ERROR] Structure name not provided.","color":"red"}
$data modify storage easymap:data args.name set value "$(structure_name)"
execute if data storage easymap:data args{name:""} run tellraw @s {"text":"[Warning] Map name not provided.","color":"yellow"}
execute unless data storage easymap:data selection run return 0
data modify storage easymap:data args.dimension set from storage easymap:data selection.dimension

tag @s add saving
item replace entity @s weapon.mainhand with minecraft:heart_of_the_sea[custom_data={save:true}]
scoreboard players set $watchdog_timer easymap -100

scoreboard players set $save easymap 1
scoreboard players set $run easymap 1



scoreboard players set #id easymap 0
execute store result score #size.x easymap run data get storage easymap:data selection.size.x
execute store result score #size.y easymap run data get storage easymap:data selection.size.y
execute store result score #size.z easymap run data get storage easymap:data selection.size.z



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

execute store result bossbar progress max run scoreboard players get $max temp
bossbar set progress players @a
bossbar set progress name {"text":"Saving Map. . .","color":"gray"}
scoreboard players set $progress easymap 0

$data modify storage easymap:data args.structure_name set value "$(structure_name)"
$data modify storage easymap:data args.name set value "$(structure_name)"

data modify storage easymap:data args.id set value 0
scoreboard players set #id easymap 0
execute store result storage easymap:data length int 1.0 run data get storage easymap:maps list
scoreboard players operation #xtemp easymap = #size.x easymap
scoreboard players operation #ytemp easymap = #size.y easymap
scoreboard players operation #ztemp easymap = #size.z easymap



execute store result score $x temp run data get storage easymap:data selection.pos0.x
execute store result score $y temp run data get storage easymap:data selection.pos0.y
execute store result score $z temp run data get storage easymap:data selection.pos0.z

execute store result storage easymap:data args.start_pos_x int 1.0 run scoreboard players remove $x temp 1
execute store result storage easymap:data args.start_pos_y int 1.0 run scoreboard players remove $y temp 1
execute store result storage easymap:data args.start_pos_z int 1.0 run scoreboard players remove $z temp 1

execute store result storage easymap:data args.current_pos_x int 1.0 run scoreboard players get $x temp
execute store result storage easymap:data args.current_pos_y int 1.0 run scoreboard players get $y temp
execute store result storage easymap:data args.current_pos_z int 1.0 run scoreboard players get $z temp


#tellraw @a {"nbt":"args","storage":"easymap:data"}