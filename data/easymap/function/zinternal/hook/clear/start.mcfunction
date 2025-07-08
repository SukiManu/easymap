data modify storage easymap:hooks temp set from storage easymap:hooks on_clear
execute if data storage easymap:hooks temp[-1] run function easymap:zinternal/hook/pass_thru