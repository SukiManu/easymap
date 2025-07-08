title @s times 0t 3t 0t
title @s title {"text":"Right Click on structure block","color":"green"}
title @s subtitle {"text":"and press SAVE","color":"green"}
$execute unless dimension $(dimension) run return 0
$execute store success score $success easymap positioned $(current_pos_x) $(current_pos_y) $(current_pos_z) run place template $(structure_name)/$(id) ~1 ~1 ~1 none none 0 0 strict
execute if score $success easymap matches 0 run return 0

scoreboard players set $wait_for_save easymap 0
$execute positioned $(current_pos_x) $(current_pos_y) $(current_pos_z) run setblock ~ ~ ~ air replace

data modify storage easymap:data args.old_pos_x set from storage easymap:data args.current_pos_x
data modify storage easymap:data args.old_pos_z set from storage easymap:data args.current_pos_z

scoreboard players remove #xtemp easymap 48
execute store result score $temp temp run data get storage easymap:data args.current_pos_x 10
scoreboard players add $temp temp 480

execute store result storage easymap:data args.current_pos_x int 0.1 run scoreboard players get $temp temp


execute unless score #xtemp easymap matches 1.. run function easymap:zinternal/limit_x

execute unless score #ztemp easymap matches 1.. run function easymap:zinternal/limit_z

execute unless score #ytemp easymap matches 1.. run function easymap:zinternal/limit_y

execute if score #ytemp easymap matches ..0 run scoreboard players set $run easymap 0

execute store result storage easymap:data args.id int 1.0 run scoreboard players add #id easymap 1

scoreboard players set $watchdog_timer easymap -500