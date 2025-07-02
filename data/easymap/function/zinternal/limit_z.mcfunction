execute if score #ytemp easymap matches ..47 run scoreboard players set #ytemp easymap 0
execute if score #ytemp easymap matches 48.. run scoreboard players remove #ytemp easymap 48


#data modify storage easymap:data args.old_pos_x set from storage easymap:data args.current_pos_x
data modify storage easymap:data args.current_pos_x set from storage easymap:data args.start_pos_x

data modify storage easymap:data args.current_pos_z set from storage easymap:data args.start_pos_z

execute store result score $temp temp run data get storage easymap:data args.current_pos_y 10
scoreboard players add $temp temp 480

data modify storage easymap:data args.old_pos_y set from storage easymap:data args.current_pos_y
execute if score $ytemp easymap matches 1.. store result storage easymap:data args.current_pos_y int 0.1 run scoreboard players get $temp temp

scoreboard players operation #ztemp easymap = #size.z easymap
scoreboard players operation #xtemp easymap = #size.x easymap
