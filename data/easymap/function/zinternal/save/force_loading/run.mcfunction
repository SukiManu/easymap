$execute in $(dimension) positioned $(old_pos_x) $(old_pos_y) $(old_pos_z) run setblock ~ ~ ~ air replace
$execute unless score $has_deallocated_chunks easymap matches 1 store success score $has_deallocated_chunks easymap in $(dimension) positioned $(old_pos_x) 0 $(old_pos_z) run forceload remove ~ ~ ~47 ~47
$execute if score $has_deallocated_chunks easymap matches 0 run tellraw @a[tag=is_admin] {"text":"[Warning] Failed to remove loaded chunks at $(old_pos_x) $(old_pos_z)","color":"yellow"}
$execute if score $has_deallocated_chunks easymap matches 1 run tellraw @a[tag=debug] {"text":"[INFO] Removed loaded chunks at $(old_pos_x) $(old_pos_z)","color":"yellow"}
$execute store success score $has_allocated_chunks easymap in $(dimension) positioned $(current_pos_x) 0 $(current_pos_z) run forceload add ~ ~
function easymap:zinternal/force_loading/append_to_storage
$execute if score $has_allocated_chunks easymap matches 1 run tellraw @a[tag=debug] {"text":"[INFO] Added loaded chunks at $(current_pos_x) $(current_pos_z)","color":"yellow"}
