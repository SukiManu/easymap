# easymap
 An easy way to save and paste relatively small maps in a world.
 ## Useful for minigames where there's a lot of destruction and the map needs reset.  
   I made this datapack for one of my minigames where I needed to load many maps every time a new game was started.  
   This datapack will forceload 16 chunks while it's pasting/saving/clearing map and is required that there are no other datapacks that do /forceload remove all. All forceload chunks will be removed after process is completed.
   
# 📘 EasyMap Guide

## This guide explains how to use the easymap datapack to select, save, and paste map structures within Minecraft worlds.


---

## 📍 1. Making a Map Selection

1. Give yourself the selection wand:  
/function easymap:give_wand

2. Right-click on a block to set the **first corner** of the selection.  
✅ You should see chat: Pos1 [x, y, z]

3. Move to the **opposite corner** and right-click again.  
✅ You should see in chat: Pos2 [x, y, z]

---

## 💾 2. Saving a Selection

Once the corners are selected, run:
/function easymap:save

- The selection data is saved in:  
  `easymap:data selection`

You can also use this save command to skip the dialog:
/function easymap:zinternal/save/start {name:"map_name",structure_name:"your_structure_name"}

---

## 🌍 3. Pasting the Saved Map

EasyMap allows pasting maps **anywhere**, including unloaded chunks and **non-vanilla dimensions**.

- To paste at your feet:
/function easymap:paste

- To paste at a specific location and dimension:
/execute positioned <x> <y> <z> in <dimension> run function easymap:paste

**Example:**
/execute positioned 420 40 420 in the_end run function easymap:paste

---

## 🧩 4. Hook Functions

Located in:  
`/data/easymap/functions/hook/`
or in storage: `easymap:hooks` as lists.  
List names: `on_finish` `on_clear` `on_paste`  
example: on_finish: ["execute if score #paste easymap matches 1 run function my_datapack/my_function","tellraw @a \"Finished Process\""]  
Note: If your hook command includes macros it will fail to run.

### 🔄 `on_clear.mcfunction`

Runs when a section is **cleared** at the start of the process.
#### Available Macros:
#Macros are stored in easymap:data args

- `$(current_pos_x)`  
- `$(current_pos_y)`  
- `$(current_pos_z)`  
- `$(dx)` `$(dy)` `$(dz)` (section size)

#### Example:
execute positioned `$(current_pos_x) $(current_pos_y) $(current_pos_z)` run fill ~ ~ ~ ~`$(dx)` ~ ~`$(dz)` stone

---

### 📦 `on_paste.mcfunction`
#Macros are stored in easymap:data args

Runs when a section is **pasted**.  

Uses the same macros as `on_clear`.

---

### ✅ `on_finish.mcfunction`

Runs **after** the entire pasting or clearing process completes.  
Use it for cleanup or final setup logic. Like teleporting players at the map
#Macros are stored in easymap:data args
#Macros provided:

- `$(start_pos_x)`  `$(start_pos_y)`  `$(start_pos_z)`
- `$(x)` `$(y)` `$(z)` (map size)  
    You can use this formula to get the center of the map  
    `map_center_x`=`$(start_pos_x)`+ `$(x)/2`  
    `map_center_y`=`$(start_pos_y)`+ `$(y)/2`  
    `map_center_z`=`$(start_pos_z)`+ `$(z)/2`  
- `$(dimension)` (the dimension where the map was pasted in)
- `$(name)` (map name)

### Debugging
If you want to see the errors, warnings, and what the datapack is doing make sure to give yourself `is_admin` tag.
For other messages give yourself `debug` tag.
