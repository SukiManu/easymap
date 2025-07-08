data modify storage easymap:hooks temp set from storage easymap:hooks on_paste
execute if data storage easymap:hooks temp[-1] run function easymap:zinternal/hook/pass_thru