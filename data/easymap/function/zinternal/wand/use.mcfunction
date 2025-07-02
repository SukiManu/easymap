tag @s add wand_spam_prevention
advancement revoke @s only easymap:use_wand_spam

scoreboard players reset @s easymap.use_wand
scoreboard players set #raycast easymap 0
tag @s add this
execute at @s anchored eyes positioned ^ ^ ^ run function easymap:zinternal/wand/raycast
tag @s remove this
