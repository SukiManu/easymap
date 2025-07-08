#execute if score #corner easymap matches 1 run function easymap:zinternal/selection/show_init
execute unless score #tick easymap matches 1.. run return run scoreboard players add #tick easymap 1
scoreboard players set #tick easymap 0

execute if score $run easymap matches 1 run function easymap:zinternal/try_run with storage easymap:data args