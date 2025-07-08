execute if score $save easymap matches 1 as @p[tag=saving] run return run function easymap:zinternal/try_run_save

execute if score $run easymap matches 1 run scoreboard players add $watchdog_timer easymap 1
execute if score $run easymap matches 1 if score $watchdog_timer easymap matches 60.. run function easymap:zinternal/utilities/abort_execution

$execute if score #step easymap matches 1 in $(dimension) run function easymap:zinternal/run with storage easymap:data args
$execute if score #step easymap matches 0 in $(dimension) run function easymap:zinternal/force_loading/run with storage easymap:data args

scoreboard players add #step easymap 1
execute if score #step easymap matches 2 run scoreboard players set #step easymap 0