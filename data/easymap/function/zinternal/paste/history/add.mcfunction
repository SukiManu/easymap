execute unless data storage easymap:data map_data.dimension run return run tellraw @a[tag=is_admin] "Failed to get dimension. Unable to add this process to history data"
data modify storage easymap:temp history_data.start_pos_x set from storage easymap:data args.start_pos_x
data modify storage easymap:temp history_data.start_pos_y set from storage easymap:data args.start_pos_y
data modify storage easymap:temp history_data.start_pos_z set from storage easymap:data args.start_pos_z

data modify storage easymap:temp history_data.x set from storage easymap:data map_data.x
data modify storage easymap:temp history_data.y set from storage easymap:data map_data.y
data modify storage easymap:temp history_data.z set from storage easymap:data map_data.z

data modify storage easymap:temp history_data.dimension set from storage easymap:data map_data.dimension
data modify storage easymap:temp history_data.structure_name set from storage easymap:data map_data.structure_name
data modify storage easymap:temp history_data.name set from storage easymap:data map_data.name

data modify storage easymap:data history_data prepend from storage easymap:temp history_data
data remove storage easymap:temp history_data

execute store result score #length easymap run data get storage easymap:data history_data
execute if score #length temp matches 10.. run data remove storage easymap:data history_data[-1]