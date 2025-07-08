execute store result storage easymap:loaded_chunks cords.x int 1.0 run data get storage easymap:loaded_chunks list[-1].x
execute store result storage easymap:loaded_chunks cords.z int 1.0 run data get storage easymap:loaded_chunks list[-1].z
#data modify storage easymap:loaded_chunks cords.dimension set from storage easymap:data args.dimension
function easymap:zinternal/force_loading/deallocate/run with storage easymap:loaded_chunks cords
data remove storage easymap:loaded_chunks list[-1]
execute if data storage easymap:loaded_chunks list[-1] run function easymap:zinternal/force_loading/deallocate/for_loop