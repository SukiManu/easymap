execute unless block ~ ~ ~ #minecraft:air align xyz positioned ~.5 ~.5 ~.5 run return run execute summon marker run function easymap:zinternal/get_corner_cords
scoreboard players add #raycast easymap 1

execute if score #raycast easymap matches ..60 positioned ^ ^ ^.1 run function easymap:zinternal/wand/raycast