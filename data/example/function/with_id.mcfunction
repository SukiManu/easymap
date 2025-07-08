execute if score $paste easymap matches 1 run return run tellraw @a[tag=is_admin] {"text":"Wait for the map to finish pasting.","color":"yellow"}
execute if score $clear easymap matches 1 run return run tellraw @a[tag=is_admin] {"text":"Wait to clear the old map.","color":"yellow"}
execute if score $run easymap matches 1 run return run tellraw @a[tag=is_admin] {"text":"$run easymap = 1. Fix","color":"yellow"}


execute store result score $map_id temp run data get storage kickmania data.selected_map
data modify storage kickmania data.map set from storage kickmania data.selected_map
execute unless score $map_id temp = $old_map_id temp run scoreboard players set $generate_after_clear kickmania.global 1
execute unless score $map_id temp = $old_map_id temp run return run function easymap:zinternal/clear/from_history_recent

function kickmania:maps/get with storage kickmania data

execute if score $map_id temp = $old_map_id temp run function kickmania:maps/paste with storage kickmania map.start_pos

scoreboard players operation $old_map_id temp = $map_id temp
