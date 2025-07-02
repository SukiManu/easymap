#This function will run everytime a section of the map is cleared.
#It runs positioned at the corner of the cleared section starts.
#
##This function retrieves the next macros
#The starting position of execution process:
#                $(start_pos_x) $(start_pos_y) $(start_pos_z)
#
#The start corner of clear section:
#                $(current_pos_x) $(current_pos_y) $(current_pos_z) 
#
#Map size: x:$(x) y:$(y) z:$(z)


#examples:
#   fill ~ ~ ~ ~47 ~ ~47 bedrock
#   function my_datapack:set_floor