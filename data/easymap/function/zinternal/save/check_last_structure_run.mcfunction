$execute unless dimension $(dimension) run return 0
$execute store success score $success easymap positioned $(old_pos_x) $(old_pos_y) $(old_pos_z) run place template $(structure_name)/$(id) ~1 ~1 ~1 none none 0 0 strict
execute if score $success easymap matches 0 run return 0

$execute positioned $(old_pos_x) $(old_pos_y) $(old_pos_z) run setblock ~ ~ ~ air replace


clear @p[tag=saving] heart_of_the_sea[custom_data~{save:true}]
playsound minecraft:block.note_block.pling master @p[tag=saving] ~ ~ ~ 1.5 1.54
tag @p[tag=saving] remove saving
function easymap:zinternal/save/finish
