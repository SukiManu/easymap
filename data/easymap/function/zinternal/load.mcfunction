execute unless data storage easymap:maps list run data modify storage easymap:maps list set value []
scoreboard objectives add easymap dummy "easymap Data"
scoreboard objectives add easymap.copy_type dummy "easymap Copy Type[/clone,/place]"
scoreboard objectives add temp dummy
scoreboard players set #48 easymap 48
scoreboard players set #-1 easymap -1
scoreboard players set #2 easymap 2
scoreboard objectives add easymap.use_wand minecraft.used:carrot_on_a_stick
bossbar add progress "Progress"

tellraw @a "easymap Datapack loaded!"
give @a written_book[item_name={"text":"easymap Guide Book","color":"green"}]