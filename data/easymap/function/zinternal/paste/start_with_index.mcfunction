##Provides the map data for pasting using an index to point within the maps array
execute if score $run easymap matches 1 run return 0
execute if score $paste easymap matches 1 run return 0
execute if score $save easymap matches 1 run return 0
execute if score $clear easymap matches 1 run return 0

data modify storage easymap:data map_data set value {}
$data modify storage easymap:data map_data set from storage easymap:maps list[$(i)]
execute \
    if data storage easymap:data map_data.x \
    if data storage easymap:data map_data.y \
    if data storage easymap:data map_data.z \
    if data storage easymap:data map_data.structure_name \
    run return run function easymap:zinternal/paste/start
tellraw @a[tag=is_admin] {"text":"Erroneous map DATA","color":"red"}
