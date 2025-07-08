#{posX: -52, mode: "SAVE", posY: -53, sizeX: 52, posZ: -49, integrity: 1.0f, name: "minecraft:a", x: -228, y: 53, z: 792, id: "minecraft:structure_block", sizeY: 53, sizeZ: 49, showboundingbox: 1b}
$execute in $(dimension) positioned $(current_pos_x) $(current_pos_y) $(current_pos_z) run function easymap:zinternal/save/place_structure_block with storage easymap:data args
$execute in $(dimension) positioned $(current_pos_x) $(current_pos_y) $(current_pos_z) run tp @s ~ ~-1 ~
scoreboard players set $wait_for_save easymap 1
