gamerule commandModificationBlockLimit 120592

$execute store success score $success easymap positioned $(current_pos_x) $(current_pos_y) $(current_pos_z) run fill ~ ~ ~ ~47 ~47 ~47 air strict
$execute if score $success temp matches 0 run return run tellraw @a[] {"text":"Failed to clear at $(current_pos_x) $(current_pos_y) $(current_pos_z)"}

#$tellraw @a[tag=is_admin] {"text":"Cleared $(current_pos_x) $(current_pos_y) $(current_pos_z)","color":"yellow"}



bossbar set easymap:progress name [{"text":"Clearing old map ","color":"gray"},{"score":{"name":"$progress","objective": "easymap"}},"/",{"score":{"name":"$max","objective": "temp"}}]



return -3572135