#This function will run when the pasting/clearing/saving it's completed.

##This function retrieves the next macros
#The starting position of execution process:
#                $(start_pos_x) $(start_pos_y) $(start_pos_z)
#
#Map size: x:$(x) y:$(y) z:$(z)
#Map name: $(name)
#example
#execute if score $paste easymap matches 1 run function my_datapack/teleport_players