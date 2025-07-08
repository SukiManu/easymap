$data modify storage easymap:temp macro_check set value "$(on_paste)"
data modify storage easymap:temp macro_check set string storage easymap:temp macro_check 0 1
execute if data storage easymap:temp {macro_check:"$"} run return run tellraw @s {"text":"[ERROR] Macros are not allowed",color:"red"}
$execute in minecraft:overworld positioned 29800000 0 29800000 store result score $error easymap run function easymap:zinternal/hook/check {command:"$(on_paste)"}
$execute if score $error easymap matches 0 run return run tellraw @s {"text":"[ERROR] Failed to add on_paste hook. Erroneous commmand orfunction","color":"red",hover_event:{action:"show_text","value":"[ERROR]->$(on_paste)"}}
data modify storage easymap:hooks on_paste append value "$(on_paste)"