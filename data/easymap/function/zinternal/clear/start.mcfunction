execute if score $run easymap matches 1 run return 0
execute if score $paste easymap matches 1 run return 0
execute if score $save easymap matches 1 run return 0
execute if score $clear easymap matches 1 run return 0

bossbar set progress players @a

scoreboard players set $clear easymap 1

function easymap:zinternal/run_init

execute store result bossbar progress max run scoreboard players get $max temp
bossbar set progress players @a
bossbar set progress name {"text":"Clearing map","color":"gray"}
scoreboard players set $progress easymap 0