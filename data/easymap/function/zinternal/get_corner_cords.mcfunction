execute if score #corner easymap matches 0 run function easymap:zinternal/corner_0
execute if score #corner easymap matches 1 run function easymap:zinternal/corner_1

scoreboard players add #corner easymap 1
execute if score #corner easymap matches 2.. run scoreboard players set #corner easymap 0

kill @s