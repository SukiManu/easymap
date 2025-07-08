scoreboard players remove #ztemp easymap 48

data modify storage easymap:data args.current_pos_x set from storage easymap:data args.start_pos_x

execute store result score $temp temp run data get storage easymap:data args.current_pos_z 10
scoreboard players add $temp temp 480

execute store result storage easymap:data args.current_pos_z int 0.1 run scoreboard players get $temp temp

execute run scoreboard players operation #xtemp easymap = #size.x easymap