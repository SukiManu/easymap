execute store result score $c0x temp run data get storage easymap:data selection.pos0.x 10
execute store result score $c0y temp run data get storage easymap:data selection.pos0.y 10
execute store result score $c0z temp run data get storage easymap:data selection.pos0.z 10

execute store result score $c1x temp run data get storage easymap:data selection.pos1.x 10
execute store result score $c1y temp run data get storage easymap:data selection.pos1.y 10
execute store result score $c1z temp run data get storage easymap:data selection.pos1.z 10

scoreboard players operation $c1x temp -= $c0x temp
scoreboard players operation $c1y temp -= $c0y temp
scoreboard players operation $c1z temp -= $c0z temp

scoreboard players operation $c1x temp /= #2 easymap
scoreboard players operation $c1y temp /= #2 easymap
scoreboard players operation $c1z temp /= #2 easymap

execute store result storage easymap:data selection.center.x double 0.1 run scoreboard players operation $c0x temp += $c1x temp
execute store result storage easymap:data selection.center.y double 0.1 run scoreboard players operation $c0y temp += $c1y temp
execute store result storage easymap:data selection.center.z double 0.1 run scoreboard players operation $c0z temp += $c1z temp

execute store result storage easymap:data selection.center.dx float 0.16666666666 run data get storage easymap:data selection.size.x
execute store result storage easymap:data selection.center.dy float 0.16666666666 run data get storage easymap:data selection.size.y
execute store result storage easymap:data selection.center.dz float 0.16666666666 run data get storage easymap:data selection.size.z

data modify storage easymap:data selection.center.dimension set from storage easymap:data selection.dimension