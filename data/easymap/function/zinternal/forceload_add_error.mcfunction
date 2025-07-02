$tellraw @a[tag=is_admin] {"text":"[Error] Failed to forceload at $(current_pos_x) $(current_pos_z).\nWill try to remove them from forceloading and try again.","color":"red"}
$execute store success score $has_deallocated_chunks easymap positioned $(current_pos_x) 0 $(current_pos_z) run forceload remove ~ ~ ~47 ~47
$execute if score $has_deallocated_chunks easymap matches 0 run tellraw @a[tag=debug] {"text":"[Warning] Failed to remove loaded chunks at $(current_pos_x) $(current_pos_z)","color":"yellow"}
