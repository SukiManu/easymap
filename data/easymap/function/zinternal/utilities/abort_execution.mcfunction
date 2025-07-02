bossbar set minecraft:progress players
scoreboard players reset $run easymap
scoreboard players reset $paste easymap
scoreboard players reset $clear easymap
scoreboard players reset $save easymap
scoreboard players reset $finished easymap
scoreboard players reset $watchdog_timer easymap
kill @e[type=marker,tag=easymap.dimension_tracker]
forceload remove 22517732 22517732
execute if data storage easymap:data map_data.dimension run function easymap:zinternal/remove_dimension_tracker with storage easymap:data map_data
tellraw @a[tag=is_admin] {"text":"Process aborted!","color":"gold"}