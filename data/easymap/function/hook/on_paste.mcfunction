#This function will run everytime a section of the map is pasted.
#It runs positioned at the corner of the pasted section.

##This function retrieves the next macros
#The starting position of execution process:
#                $(start_pos_x) $(start_pos_y) $(start_pos_z)
#
#The start corner of pasted section:
#                $(current_pos_x) $(current_pos_y) $(current_pos_z) 
#
#Map size: x:$(x) y:$(y) z:$(z)

#example:
#   function my_datapack:spawn_enemies_on_map