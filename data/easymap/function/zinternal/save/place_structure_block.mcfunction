summon marker ~ ~ ~ {UUID:[I;9,75218,-2614113,5]}
tellraw @a {"nbt": "Pos","entity": "00000009-0001-25d2-ffd8-1c9f00000005"}
kill 00000009-0001-25d2-ffd8-1c9f00000005

setblock ~ ~ ~ minecraft:structure_block[mode=save]{posX:1,posY:1,posZ:1,sizeX:48,sizeY:48,sizeZ:48,mode:"SAVE"} destroy

execute if score #xtemp easymap matches ..47 store result block ~ ~ ~ sizeX int 1.0 run scoreboard players get #xtemp easymap
execute if score #ytemp easymap matches ..47 store result block ~ ~ ~ sizeY int 1.0 run scoreboard players get #ytemp easymap
execute if score #ztemp easymap matches ..47 store result block ~ ~ ~ sizeZ int 1.0 run scoreboard players get #ztemp easymap
$data modify block ~ ~ ~ name set value "$(structure_name)/$(id)"

execute store result storage easymap:data args.id int 1.0 run scoreboard players add #id easymap 1

execute store result bossbar progress value run scoreboard players add $progress easymap 1
bossbar set progress name [\
    {"text":"Saving Map. . .","color":"gray"},\
    {"score":\
        {"name":"$progress","objective": "easymap"}\
    },"/",\
    {"score":\
        {"name":"$max","objective": "temp"}\
    }\
]