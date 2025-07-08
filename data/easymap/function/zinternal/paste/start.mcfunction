#Check if an operation is already running

execute if score $run easymap matches 1 run return 0
execute if score $paste easymap matches 1 run return 0
execute if score $save easymap matches 1 run return 0
execute if score $clear easymap matches 1 run return 0
execute unless entity @p run return run tellraw server {"text":"One player is required to start pasting the map."}
data remove storage easymap:data args
forceload remove ~ ~
execute store success score $success easymap run forceload add ~ ~
execute if score $success easymap matches 0 run return run tellraw @a[tag=is_admin] {"text":"[ERROR] Unable to forceload specified position. Maybe outside world?","color":"red"}
kill @e[type=marker,tag=fuck_this]
summon marker ~ ~ ~ {Tags:["fuck_this"]}
schedule function easymap:zinternal/paste/scheduled_start1 2t
