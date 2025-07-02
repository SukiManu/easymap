# easymap
 An easy way to save and paste relatively small maps in a world.

# 📘 EasyMap Guide

## This guide explains how to use the easymap datapack to select, save, and paste map structures within Minecraft worlds.

## Useful for minigames where there's a lot of destruction and the map needs reset.

---

## 📍 1. Making a Map Selection

1. Give yourself the selection wand:  
/function easymap:give__wand

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

You can also use a more advanced save command:
/function easymap:zinternal/save/start {name:"map__name",structure__name:"your__structure__name"}

---

## 🌍 3. Pasting the Saved Map

EasyMap allows pasting maps **anywhere**, including unloaded chunks and **non-vanilla dimensions**.

- To paste at your feet:
/function easymap:paste

- To paste at a specific location and dimension:
/execute positioned <x> <y> <z> in <dimension> run function easymap:paste

**Example:**
/execute positioned 420 40 420 in the__end run function easymap:paste

---

## 🧩 4. Hook Functions

Located in:  
`/data/easymap/functions/hook/`

### 🔄 `on__clear.mcfunction`

Runs when a section is **cleared** at the start of the process.

#### Available Macros:
- `$(current__pos__x)`  
- `$(current__pos__y)`  
- `$(current__pos__z)`
- `$(dx)` `$(dy)` `$(dz)` (section size)

#### Example:
execute positioned `$(current__pos__x) $(current__pos__y) $(current__pos__z)` run fill ~ ~ ~ ~`$(dx)` ~ ~`$(dz)` stone

---

### 📦 `on__paste.mcfunction`

Runs when a section is **pasted**.  
Use to:
- Spawn mobs
- Prepare loot
- Trigger redstone, etc.

Uses the same macros as `on__clear`.

---

### ✅ `on__finish.mcfunction`

Runs **after** the entire pasting or clearing process completes.  
Use it for cleanup or final setup logic.

