#execute if score #corner easymap matches 1 run function easymap:zinternal/selection/show_init
execute unless score #tick easymap matches 5.. run return run scoreboard players add #tick easymap 1
scoreboard players set #tick easymap 0

execute if score $run easymap matches 1 run function easymap:zinternal/try_run
execute if score $run easymap matches 1 run scoreboard players add $watchdog_timer easymap 1
execute if score $run easymap matches 1 if score $watchdog_timer easymap matches 60.. run function easymap:zinternal/utilities/abort_execution