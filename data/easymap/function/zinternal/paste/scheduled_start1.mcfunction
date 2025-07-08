execute at @e[type=marker,tag=fuck_this,limit=1] run return run function easymap:zinternal/paste/start1
execute unless entity @e[type=marker,tag=fuck_this,limit=1] run return run tellraw @a[tag=is_admin] {"text":"[ERROR] Unable to get starting position for pasting.","color":"red"}
schedule function easymap:zinternal/paste/scheduled_start1 2t