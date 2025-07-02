execute if score $save easymap matches 1 as @p[tag=saving] if items entity @s weapon.offhand heart_of_the_sea[minecraft:custom_data~{save:true}] run return run function easymap:zinternal/run_save
execute unless data storage easymap:data args run return run function easymap:zinternal/utilities/abort_execution
execute unless entity @e[type=marker,tag=easymap.dimension_tracker,limit=1] run return run schedule function easymap:zinternal/try_run 5t
execute at @e[type=marker,tag=easymap.dimension_tracker,limit=1] run function easymap:zinternal/run with storage easymap:data args