scoreboard players add $watchdog_timer easymap 1
execute if score $watchdog_timer easymap matches 60.. run return run function easymap:zinternal/utilities/send_error {abort:true,error_msg:"Player took too long to try and save."}
execute at @p[tag=saving] run function easymap:zinternal/save/check_last_structure_run with storage easymap:data args
execute if entity @p[tag=saving] run schedule function easymap:zinternal/save/check_last_structure 10t