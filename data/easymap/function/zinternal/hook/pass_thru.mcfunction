data modify storage easymap:data args.command set from storage easymap:hooks temp[-1]
data remove storage easymap:hooks temp[-1]

tellraw @a {"nbt":"args",storage:"easymap:data"}
execute store result score $error easymap run function easymap:zinternal/hook/run with storage easymap:data args
execute if score $error easymap matches 0 run tellraw @a [{"text":"[ERROR] Failed to run "},{nbt:"args.command",storage:"easymap:data"}]

execute if data storage easymap:hooks temp[-1] run function easymap:zinternal/hook/pass_thru
