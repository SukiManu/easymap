execute store result storage easymap:temp force_load.x int 1.0 run data get storage easymap:data args.current_pos_x
execute store result storage easymap:temp force_load.z int 1.0 run data get storage easymap:data args.current_pos_z
data modify storage easymap:loaded_chunks list append from storage easymap:temp force_load
data remove storage easymap:temp force_load
