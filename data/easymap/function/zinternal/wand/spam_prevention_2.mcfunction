execute as @a[tag=!wand_spam_prevention] run advancement revoke @s only easymap:use_wand
execute as @a[tag=wand_spam_prevention] run schedule function easymap:zinternal/wand/spam_prevention_2 1t replace
tag @a[tag=wand_spam_prevention] remove wand_spam_prevention
