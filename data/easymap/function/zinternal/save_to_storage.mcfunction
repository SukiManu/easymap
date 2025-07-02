$data remove storage easymap:maps list[{structure_name:"$(structure_name)"}]
$data modify storage easymap:maps list append value {x:-1,y:-1,z:-1,name:"$(name)",structure_name:"$(structure_name)",place:true}
data modify storage easymap:maps list[-1].x set from storage easymap:data selection.size.x
data modify storage easymap:maps list[-1].y set from storage easymap:data selection.size.y
data modify storage easymap:maps list[-1].z set from storage easymap:data selection.size.z