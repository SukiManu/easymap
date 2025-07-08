#This function will run everytime a section of the map is cleared.
#It runs positioned at the corner of where the cleared section starts.
#
##This function retrieves the next macros
#The starting position of execution process:
#                $(start_pos_x) $(start_pos_y) $(start_pos_z)
#
#The start corner of clear section:
#                $(current_pos_x) $(current_pos_y) $(current_pos_z) 
#Selection Size: $(dx) $(dy) $(dz)
#Map size: x:$(x) y:$(y) z:$(z)
#Dimension: $(dimension)
#All macros are stored in >>easymap:data args<<



#examples:
#   fill ~ ~ ~ ~47 ~ ~47 bedrock
#   function my_datapack:set_floor

function easymap:zinternal/hook/clear/start
