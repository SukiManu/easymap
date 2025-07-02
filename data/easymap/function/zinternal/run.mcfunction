bossbar set progress players @a
data modify storage easymap:data args.old_pos_x set from storage easymap:data args.current_pos_x
data modify storage easymap:data args.old_pos_z set from storage easymap:data args.current_pos_z

execute if score $paste easymap matches 1 store result score $error easymap run function easymap:zinternal/paste/run with storage easymap:data args
execute if score $clear easymap matches 1 store result score $error easymap run function easymap:zinternal/clear/run with storage easymap:data args

execute unless score $error easymap matches -3572135 run return 0

execute if score $save easymap matches 1 as @p[tag=saving] unless items entity @s weapon.offhand heart_of_the_sea[minecraft:custom_data~{save:true}] run return 0
execute if score $save easymap matches 1 as @p[tag=saving] at @s run function easymap:zinternal/save/run with storage easymap:data args

execute unless score $paste easymap matches 1 unless score $clear easymap matches 1 run return 0

#execute if score #xtemp easymap matches ..47 run scoreboard players set #xtemp easymap 0
#execute if score #xtemp easymap matches 48.. run scoreboard players remove #xtemp easymap 48
scoreboard players remove #xtemp easymap 48
execute store result score $temp temp run data get storage easymap:data args.current_pos_x 10
scoreboard players add $temp temp 480

execute store result storage easymap:data args.current_pos_x int 0.1 run scoreboard players get $temp temp


execute unless score #xtemp easymap matches 1.. run function easymap:zinternal/limit_x

execute unless score #ztemp easymap matches 1.. run function easymap:zinternal/limit_z

execute unless score #ytemp easymap matches 1.. run function easymap:zinternal/limit_y

execute store result bossbar progress value run scoreboard players add $progress easymap 1
execute if score #ytemp easymap matches ..0 run scoreboard players set $run easymap 0

scoreboard players set $watchdog_timer easymap 0