#This function will run when the pasting/clearing/saving it's completed.

##This function retrieves the next macros
#The starting position of execution process:
#                $(start_pos_x) $(start_pos_y) $(start_pos_z)
#
#Map size: x:$(x) y:$(y) z:$(z)
#Map name: $(name)
#Dimension: $(dimension)
#All macros are stored in >>easymap:data args<<

#example
#execute if score #paste easymap matches 1 run function my_datapack/teleport_players
#execute if score #paste easymap matches 1 positioned $(start_pos_x) $(start_pos_y)$(start_pos_z) run summon marker ~ ~ ~ {Tags:["map_tracker"]}
#execute if score #clear easymap matches 1 run function my_datapack/my_function with storage easymap:data args

function easymap:zinternal/hook/finish/start

execute if score #clear easymap matches 1 if score $generate_after_clear kickmania.global matches 1 run function kickmania:maps/generate_after_clear
#execute if score #paste easymap matches 1 run function kickmania:game/try_start with storage kickmania game_data

$tellraw @a {"text":"/tp @s $(start_pos_x) $(start_pos_y) $(start_pos_z)",click_event:{action:"run_command",command:"/execute in $(dimension) run tp @s $(start_pos_x) $(start_pos_y) $(start_pos_z)"}}