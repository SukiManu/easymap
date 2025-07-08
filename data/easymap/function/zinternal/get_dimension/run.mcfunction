data modify storage easymap:data player.x set from entity @s Pos[0] 
data modify storage easymap:data player.y set from entity @s Pos[1] 
data modify storage easymap:data player.z set from entity @s Pos[2]
data modify storage easymap:data player.dimension set from entity @s Dimension

execute at @e[type=marker,tag=fuck_this,limit=1] run tp @s ~ ~ ~
data modify storage easymap:data map_data.dimension set from entity @s Dimension

tellraw @a {"nbt":"map_data.dimension","storage":"easymap:data"}
function easymap:zinternal/get_dimension/tp_back with storage easymap:data player