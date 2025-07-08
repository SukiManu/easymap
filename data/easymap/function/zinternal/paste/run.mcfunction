scoreboard players set $has_deallocated_chunks easymap 0

fill ~-1 ~-1 ~-1 ~-1 ~-1 ~-1 air replace structure_block

scoreboard players set $success easymap -1
$execute if loaded $(current_pos_x) $(current_pos_y) $(current_pos_z) store success score $success easymap run place template $(structure_name)/$(id) $(current_pos_x) $(current_pos_y) $(current_pos_z) none none 1 0 strict

execute unless score $skip_all easymap matches 1 unless score $success easymap matches 1 run return run function easymap:zinternal/paste/error with storage easymap:data args

bossbar set easymap:progress name [{"text":"Pasting map ","color":"gray"},{"score":{"name":"$progress","objective": "easymap"}},"/",{"score":{"name":"$max","objective": "temp"}}]
execute store result storage easymap:data args.id int 1.0 run scoreboard players add #id easymap 1




return -3572135