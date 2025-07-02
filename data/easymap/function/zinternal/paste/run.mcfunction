$execute unless score $has_deallocated_chunks easymap matches 1 store success score $has_deallocated_chunks easymap positioned $(old_pos_x) 0 $(old_pos_z) run forceload remove ~ ~ ~47 ~47
execute unless score $paste easymap matches 1 unless score $clear easymap matches 1 unless score $save easymap matches 1 run return 0
$execute if score $has_deallocated_chunks easymap matches 0 run tellraw @a[tag=is_admin] {"text":"[Warning] Failed to remove loaded chunks at $(old_pos_x) $(old_pos_z)","color":"yellow"}
$execute if score $has_deallocated_chunks easymap matches 1 run tellraw @a[tag=debug] {"text":"[INFO] Removed loaded chunks at $(old_pos_x) $(old_pos_z)","color":"yellow"}

$execute store success score $has_allocated_chunks easymap positioned $(current_pos_x) 0 $(current_pos_z) run forceload add ~ ~ ~47 ~47
function easymap:zinternal/force_loading/append_to_storage
execute if score $has_allocated_chunks easymap matches 0 run return run function easymap:zinternal/forceload_add_error with storage easymap:data args
$execute if score $has_allocated_chunks easymap matches 1 run tellraw @a[tag=debug] {"text":"[INFO] Added loaded chunks at $(current_pos_x) $(current_pos_z)","color":"yellow"}

scoreboard players set $has_deallocated_chunks easymap 0

fill ~-1 ~-1 ~-1 ~-1 ~-1 ~-1 air replace structure_block
$execute store success score $success easymap run place template $(structure_name)/$(id) $(current_pos_x) $(current_pos_y) $(current_pos_z) none none
$execute store success score $section_loaded easymap if loaded $(current_pos_x) $(current_pos_y) $(current_pos_z)

execute unless score $skip_all easymap matches 1 if score $section_loaded easymap matches 0 run return run function easymap:zinternal/paste/error with storage easymap:data args
execute unless score $skip_all easymap matches 1 if score $success easymap matches 0 run return run function easymap:zinternal/paste/error with storage easymap:data args

bossbar set progress name [{"text":"Pasting map ","color":"gray"},{"score":{"name":"$progress","objective": "easymap"}},"/",{"score":{"name":"$max","objective": "temp"}}]
execute store result storage easymap:data args.id int 1.0 run scoreboard players add #id easymap 1


return -3572135