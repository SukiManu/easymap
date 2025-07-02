$execute store success score $has_deallocated_chunks easymap positioned $(old_pos_x) 0 $(old_pos_z) run forceload remove ~ ~ ~47 ~47
$execute if score $has_deallocated_chunks easymap matches 0 run tellraw @a[tag=is_admin] {"text":"[Warning] Failed to remove loaded chunks at $(old_pos_x) $(old_pos_z)","color":"yellow"}
$execute if score $has_deallocated_chunks easymap matches 1 run tellraw @a[tag=debug] {"text":"[INFO] Removed loaded chunks at $(old_pos_x) $(old_pos_z)","color":"yellow"}
