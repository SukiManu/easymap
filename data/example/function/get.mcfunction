data remove storage easymap:data map_data
$data modify storage easymap:data map_data set from storage easymap:maps list[$(map)]
execute unless data storage easymap:data map_data run return run tellraw @a[tag=is_admin] {"text":"[ERROR] Could not get map.","color":"red"}
execute store result storage kickmania map.start_pos.x int -0.05 run data get storage easymap:data map_data.x 10
execute store result storage kickmania map.start_pos.z int -0.05 run data get storage easymap:data map_data.z 10

execute store result score $y temp run data get storage easymap:data map_data.y
scoreboard players set $y_temp temp -64
execute store result storage kickmania game_data.y int 1.0 run scoreboard players operation $y_temp temp += $y temp

