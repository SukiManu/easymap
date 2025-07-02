# easymap
 An easy way to save and paste relatively small maps in a world.

# 📘 EasyMap Guide

This guide explains how to use the [EasyMap](http://minecraft.tools/) datapack to select, save, and paste map structures within Minecraft worlds.

---

## 📍 1. Making a Map Selection

1. Give yourself the selection wand:  
/function easymap:give_wand

sql
Copy
Edit

2. Right-click on a block to set the **first corner** of the selection.  
✅ You should see chat feedback like:
Pos1 [x, y, z]

css
Copy
Edit

3. Move to the **opposite corner** and right-click again.  
✅ You should see:
Pos2 [x, y, z]

yaml
Copy
Edit

---

## 💾 2. Saving a Selection

Once the corners are selected, run:
/function easymap:save

kotlin
Copy
Edit

- The selection data is saved in:  
  `easymap:data selection`

You can also use a more advanced save command:
/function easymap:zinternal/save/start {name:"map_name",structure_name:"your_structure_name"}

yaml
Copy
Edit

---

## 🌍 3. Pasting the Saved Map

EasyMap allows pasting maps **anywhere**, including unloaded chunks and **non-vanilla dimensions**.

- To paste at your feet:
/function easymap:paste

css
Copy
Edit

- To paste at a specific location and dimension:
/execute positioned <x> <y> <z> in <dimension> run function easymap:paste

makefile
Copy
Edit

**Example:**
/execute positioned 420 40 420 in the_end run function easymap:paste

yaml
Copy
Edit

---

## 🧩 4. Hook Functions

Located in:  
`/data/easymap/functions/hook/`

### 🔄 `on_clear.mcfunction`

Runs when a section is **cleared** at the start of the process.

#### Available Macros:
- `$(current_pos_x)`  
- `$(current_pos_y)`  
- `$(current_pos_z)`
- `$(dx)` `$(dy)` `$(dz)` (section size)

#### Example:
execute positioned $(current_pos_x) $(current_pos_y) $(current_pos_z) run fill ~ ~ ~ ~$(dx) ~ ~$(dz) stone

yaml
Copy
Edit

---

### 📦 `on_paste.mcfunction`

Runs when a section is **pasted**.  
Use to:
- Spawn mobs
- Prepare loot
- Trigger redstone, etc.

Uses the same macros as `on_clear`.

---

### ✅ `on_finish.mcfunction`

Runs **after** the entire pasting or clearing process completes.  
Use it for cleanup or final setup logic.

