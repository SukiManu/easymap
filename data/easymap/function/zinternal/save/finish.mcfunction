scoreboard players reset $run easymap

function easymap:hook/on_finish

execute if score $save easymap matches 1 run function easymap:zinternal/save_to_storage with storage easymap:data args
execute if score $save easymap matches 1 run tellraw @a[tag=is_admin] {"text":"Finished saving!","color":"green"}

data remove storage easymap:data args

scoreboard players reset $save easymap
scoreboard players reset $progress
scoreboard players reset $skip_all
bossbar set easymap:progress players