execute if score $run easymap matches 1 run scoreboard players add $watchdog_timer easymap 1
execute if score $run easymap matches 1 if score $watchdog_timer easymap matches 60.. run return run function easymap:zinternal/utilities/abort_execution
execute if score $wait_for_save easymap matches 1 run return run function easymap:zinternal/save/check_if_saved with storage easymap:data args
function easymap:zinternal/save/force_loading/run with storage easymap:data args
schedule function easymap:zinternal/save/schedule_run 2t
