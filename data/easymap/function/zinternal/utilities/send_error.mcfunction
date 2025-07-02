$data modify storage easymap:temp abort set value $(abort)
$tellraw @a {"text":"[ERROR] $(error_msg)","color":"red"}

execute if data storage easymap:temp {abort:1} run function easymap:zinternal/utilities/abort_execution