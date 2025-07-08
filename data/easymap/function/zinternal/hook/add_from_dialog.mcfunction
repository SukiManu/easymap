forceload add 29800000 29800000

tellraw @s "Running a quick check"

$function easymap:zinternal/hook/finish/check {command:"$(on_finish)"}
$function easymap:zinternal/hook/paste/check {command:"$(on_finish)"}
$function easymap:zinternal/hook/clear/check {command:"$(on_finish)"}
