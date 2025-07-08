execute unless data storage easymap:data args run return run tellraw @a[tag=is_admin] {"text":"[ERROR] No args data in easymap:data storage","color":"red"}
#Check if an operation is already running
execute if score $run easymap matches 1 run return 0
execute if score $paste easymap matches 1 run return 0
execute if score $save easymap matches 1 run return 0
execute if score $clear easymap matches 1 run return 0

#Initiate process type
scoreboard players set $paste easymap 1

scoreboard players set #id easymap 0
data modify storage easymap:data args.id set value 0

function easymap:zinternal/paste/history/add

function easymap:zinternal/run_init

execute store result bossbar easymap:progress max run scoreboard players get $max temp
bossbar set easymap:progress players @a
bossbar set easymap:progress name {"text":"Pasting map","color":"gray"}
scoreboard players set $progress easymap 0