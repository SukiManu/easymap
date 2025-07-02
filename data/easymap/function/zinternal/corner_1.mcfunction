execute store result storage easymap:data selection.pos1.x int 1.0 store result score #corner1_x easymap run data get entity @s Pos[0]
execute store result storage easymap:data selection.pos1.y int 1.0 store result score #corner1_y easymap run data get entity @s Pos[1]
execute store result storage easymap:data selection.pos1.z int 1.0 store result score #corner1_z easymap run data get entity @s Pos[2]

tellraw @a[tag=this] [{"text":"Pos2:[","color":"green"},{"score":{"name": "#corner1_x","objective": "easymap"},"color":"white"},{"text":", ","color":"gray"},{"score":{"name": "#corner1_y","objective": "easymap"},"color":"white"},{"text":", ","color":"gray"},{"score":{"name": "#corner1_z","objective": "easymap"},"color":"white"},{"text":"]","color":"green"}]
data modify storage easymap:data selection.dimension set from entity @p[tag=this] Dimension
scoreboard players operation #copy easymap = #corner1_x easymap
execute if score #corner1_x easymap < #corner0_x easymap run function easymap:zinternal/selection/swap_x_corner
scoreboard players operation #copy easymap = #corner1_y easymap
execute if score #corner1_y easymap < #corner0_y easymap run function easymap:zinternal/selection/swap_y_corner
scoreboard players operation #copy easymap = #corner1_z easymap
execute if score #corner1_z easymap < #corner0_z easymap run function easymap:zinternal/selection/swap_z_corner

scoreboard players operation #length_x easymap = #corner1_x easymap
scoreboard players operation #length_y easymap = #corner1_y easymap
scoreboard players operation #length_z easymap = #corner1_z easymap

scoreboard players operation #length_x easymap -= #corner0_x easymap
scoreboard players operation #length_y easymap -= #corner0_y easymap
scoreboard players operation #length_z easymap -= #corner0_z easymap
scoreboard players add #length_x easymap 1
scoreboard players add #length_y easymap 1
scoreboard players add #length_z easymap 1


execute store result storage easymap:data selection.size.x int 1.0 run scoreboard players get #length_x easymap
execute store result storage easymap:data selection.size.y int 1.0 run scoreboard players get #length_y easymap
execute store result storage easymap:data selection.size.z int 1.0 run scoreboard players get #length_z easymap

data modify storage easymap:data selection.args.pos0_x set from storage easymap:data selection.pos0.x
data modify storage easymap:data selection.args.pos0_y set from storage easymap:data selection.pos0.y
data modify storage easymap:data selection.args.pos0_z set from storage easymap:data selection.pos0.z
data modify storage easymap:data selection.args.pos1_x set from storage easymap:data selection.pos1.x
data modify storage easymap:data selection.args.pos1_y set from storage easymap:data selection.pos1.y
data modify storage easymap:data selection.args.pos1_z set from storage easymap:data selection.pos1.z
data modify storage easymap:data selection.args.size_x set from storage easymap:data selection.size.x
data modify storage easymap:data selection.args.size_y set from storage easymap:data selection.size.y
data modify storage easymap:data selection.args.size_z set from storage easymap:data selection.size.z


tellraw @a[tag=this] ["Map selection size:[",{"score":{"name": "#length_x","objective": "easymap"}},", ",{"score":{"name": "#length_y","objective": "easymap"}},", ",{"score":{"name": "#length_z","objective": "easymap"}},"] With Origin at: [",{"score":{"name": "#corner0_x","objective": "easymap"}},", ",{"score":{"name": "#corner0_y","objective": "easymap"}},", ",{"score":{"name": "#corner0_z","objective": "easymap"}},"]\nType /function easymap:save to start the saving process. Or click ",{"text":"here","color":"green","underlined":true,click_event:{action:"show_dialog",dialog:"easymap:start_save"}}]
scoreboard players set $can_save easymap 1
