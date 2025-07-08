$data modify storage easymap:temp macro_check set value "$(on_clear)"
data modify storage easymap:temp macro_check set string storage easymap:temp macro_check 0 1
execute if data storage easymap:temp {macro_check:"$"} run return run tellraw @s {"text":"[ERROR] Macros are not allowed",color:"red"}
$execute in minecraft:overworld positioned 29800000 0 29800000 store result score $error easymap run function easymap:zinternal/hook/check {command:"$(on_clear)"}
$execute if score $error easymap matches 0 run tellraw @s {"text":"[ERROR] Failed to add on_clear hook. Erroneous commmand orfunction","color":"red",hover_event:{action:"show_text","value":"[ERROR]->$(on_clear)"}}
$execute if score $error easymap matches -1 run data modify storage easymap:hooks on_clear append value "$(on_clear)"