scoreboard players reset $run easymap

function easymap:zinternal/force_loading/remove_last with storage easymap:data args


execute if entity @p[tag=saving] store result storage easymap:data args.id int 1.0 run scoreboard players remove #id easymap 1
execute if entity @p[tag=saving] run return run schedule function easymap:zinternal/save/check_last_structure 10t


kill @e[type=marker,tag=easymap.dimension_tracker]
forceload remove 22517732 22517732

execute if score $save easymap matches 1 run tellraw @a[tag=is_admin] {"text":"Finished saving!","color":"green"}
execute if score $paste easymap matches 1 run tellraw @a[tag=is_admin] {"text":"Finished pasting!","color":"green"}
execute if score $clear easymap matches 1 run tellraw @a[tag=is_admin] {"text":"Finished clearing!","color":"green"}

scoreboard players reset #save easymap
scoreboard players reset #paste easymap
scoreboard players reset #clear easymap

scoreboard players operation #save easymap = $save easymap
scoreboard players operation #paste easymap = $paste easymap
scoreboard players operation #clear easymap = $clear easymap

scoreboard players set $finished easymap 1

scoreboard players reset $save easymap
scoreboard players reset $paste easymap
scoreboard players reset $clear easymap
scoreboard players reset $progress easymap
scoreboard players reset $skip_all easymap

bossbar set easymap:progress players

execute unless score #save easymap matches 1 run function easymap:zinternal/force_loading/deallocate/for_loop with storage easymap:data args
function easymap:hook/on_finish with storage easymap:data args
data remove storage easymap:data args