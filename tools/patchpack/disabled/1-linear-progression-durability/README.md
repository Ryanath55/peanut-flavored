# Disabled: Linear Progression — item durability restored

Switched off on 2026-09-08 when Linear Progression was removed from the pack. Kept rather than deleted,
because re-deriving it took a while and LP may come back.

JSON has no comment syntax, so "commented out" means moved out of `src/`. Nothing here is in the build.

## Why it had to go, not merely could

Measured on a server with LP removed and this patch still shipping: 1300 recipes loaded, against 1296 with
the patch disabled. The patch was still fully in force, and it breaks down as:

- **18 files overriding vanilla recipe ids with LP's ingredients.** They load and craft fine, they are just
  LP's design — a diamond pickaxe wanting three diamonds and two amethyst shards, iron tools coming from a
  smithing transform on stone ones. LP was gone; its recipes were not.
- **4 stone tool recipes** (axe, hoe, pickaxe, sword) referencing the item tag `linear_progression:stone_tools`.
  An unknown tag does not fail the recipe, it resolves to nothing, so these loaded and could never be
  crafted. That is the worst of the three cases, because it is silent.
- **4 chainmail recipes**, which are additions rather than overrides — vanilla has no chainmail crafting
  recipe at all. They are the whole 1300-vs-1296 difference.

Any patch overriding a `minecraft:` id with another mod's content has this shape: it has to leave when that
mod leaves, and nothing in the game will tell you it did not.

## What it did

LP took durability away in two places:

- A hidden advancement, `linear_progression:detect/breakable_item_in_inventory`, firing on every inventory
  change and running an item modifier over every slot that stripped `minecraft:damage` and added
  `minecraft:unbreakable`. Overridden here with a `minecraft:impossible` trigger.
- 22 recipes crafting their result with `minecraft:unbreakable` already in its components. Reshipped here
  unchanged apart from the removed component, so LP's ingredients and smithing chains were kept.

`packpatches/function/restore_durability.mcfunction` took the component off gear made before the patch,
across armour, both hands, hotbar, inventory and ender chest.

## To re-enable

Copy `linear_progression/`, `minecraft/` and `packpatches/` back under `src/data/`, restore the mention in
`src/pack.mcmeta`, rebuild, and re-run the break-one-file check in the parent README. Check first that
LP still ships the same 22 recipes and the same advancement id — that is exactly what would drift.
