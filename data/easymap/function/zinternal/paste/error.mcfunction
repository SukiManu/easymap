scoreboard players set $paste easymap 0

$execute if score $success easymap matches 0 run tellraw @a[tag=is_admin] {"text":"[ERROR] Structure $(structure_name)/$(id) not found!","color":"red"}
execute if score $success easymap matches 0 run return run function easymap:zinternal/utilities/abort_execution

$tellraw @a [{"text":"[ERROR]Failed to load $(current_pos_x), $(current_pos_y), $(current_pos_z). ","color":"red"},{"text":"Will try again after 2 gameticks.","color":"green"}]


execute if score $watchdog_timer easymap matches ..10 run return run scoreboard players set $paste easymap 1

tellraw @a [{"text":"Try loading the chunks and click ","color":"yellow"},\
            {"text":"this","color":"green","underlined": true,"bold":true,"click_event": {"action": "run_command","command": "/scoreboard players set $paste easymap 1"}},\
            {"text":" to resume.","color":"yellow"},\
            {"text":"\nAlternatively click ","color":"yellow"},\
            {"text":"this","color":"green","underlined": true,"bold":true,"click_event": {"action": "run_command","command": "/function easymap:zinternal/paste/skip_all_errors"}},\
            {"text":" to skip all errors.","color":"yellow"},\
            {"text":"\nClick ","color":"red"},\
            {"text":"here","color":"gold","underlined": true,"bold":true,"click_event": {"action": "run_command","command": "/function easymap:zinternal/utilities/abort_execution"}},\
            {"text":" to abort all.","color":"red"}\
            ]