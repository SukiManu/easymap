bossbar set progress players @s

function easymap:zinternal/save/run with storage easymap:data args

scoreboard players remove #xtemp easymap 48
execute store result score $temp temp run data get storage easymap:data args.current_pos_x 10
scoreboard players add $temp temp 480

execute store result storage easymap:data args.current_pos_x int 0.1 run scoreboard players get $temp temp


execute unless score #xtemp easymap matches 1.. run function easymap:zinternal/limit_x

execute unless score #ztemp easymap matches 1.. run function easymap:zinternal/limit_z

execute unless score #ytemp easymap matches 1.. run function easymap:zinternal/limit_y

execute if score #ytemp easymap matches ..0 run scoreboard players set $run easymap 0

scoreboard players set $watchdog_timer easymap -100