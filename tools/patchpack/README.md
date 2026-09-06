# Pack Patches

This pack's local data fixes, as one datapack. It exists so a fix lives somewhere that survives updates,
instead of being an edit inside somebody else's jar that the next version silently reverts.

## Build

```
powershell -ExecutionPolicy Bypass -File tools\patchpack\build.ps1
```

Writes `moonlight-global-datapacks/packpatches.zip` and runs `packwiz refresh`. Both ignore files carry an
exception for that one path, so packwiz indexes it as a plain file with a hash and git tracks it — no
`.pw.toml` and no upstream repo needed. It is invisible to `packreg.py`, which only walks `mods/*.pw.toml`;
do not hand-write a `REGISTER.md` section for it, because `sync` marks any section with no matching
metafile as STALE and `audit` then fails forever.

## Why it lives in the global datapack folder

This is the part that is easy to get wrong, and I got it wrong first.

A datapack shipped as a mod jar is folded into NeoForge's single bundled `mod_data` pack, and `mod_data`
sits **above** every individually-listed mod pack in the load order. So a mod jar can never reliably
override another mod's data file. None of the obvious levers change that: `dependencies … ordering =
"AFTER"` does nothing to data precedence, renaming the jar to sort first or last does nothing, and
`showAsDataPack = true` actively makes it worse — it lists the pack separately, which puts it *below*
`mod_data` rather than above.

Moonlight registers its global datapack folder through `AddPackFindersEvent`, which fires after the mod
packs are added, so a pack from that folder lands after `mod_data` and wins. Measured both ways: on a
fresh world, and on an existing world seeing the pack for the first time. In both, the world's enabled
list came out as `[vanilla, mod_data, file/packpatches.zip]`.

That does mean this depends on Moonlight staying in the pack. If it ever goes, the fallback with no mod
behind it is `saves/<world>/datapacks/packpatches.zip`, which is per-world but always wins.

Per world, it can be switched off:

```
/datapack disable "file/packpatches.zip"
```

## Proving an override actually wins

Do not reason about it — measure it. Break one of the overriding files on purpose and start the game. If
the log says `Couldn't parse data file <that id>` and the recipe count drops by one, this pack is the one
being read. If it loads silently, it is not, and no argument about load order will change that.

## Adding a patch

1. Put the overriding file at the same namespaced path the original uses — a file overriding
   `linear_progression:advancement/detect/foo` goes at
   `src/data/linear_progression/advancement/detect/foo.json`.
2. Anything of our own goes under `src/data/packpatches/`.
3. Note it in `src/pack.mcmeta`'s description and in the list below.
4. Rebuild, then run the break-one-file check above.

## Current patches

**1. Linear Progression: item durability restored.** LP takes durability away in two places. A hidden
advancement, `linear_progression:detect/breakable_item_in_inventory`, fires on every inventory change and
runs an item modifier over all your slots that strips `minecraft:damage` and adds `minecraft:unbreakable`.
Separately, 22 recipes craft their result with `minecraft:unbreakable` already in its components.

The advancement is overridden with a `minecraft:impossible` trigger, and the 22 recipes are reshipped
unchanged apart from the removed component — LP's own ingredients and smithing chains are kept. Gear made
before the patch keeps the component; `/function packpatches:restore_durability` takes it off everything
you are carrying, including your ender chest.

This patch assumes Linear Progression is present: its recipe overrides use LP's ingredients, so with LP
gone they would shadow the vanilla recipes with ones referencing a tag that no longer exists. Remove this
pack if you ever remove LP.

Not touched: LP's eyes of ender that survive being thrown. That reads as an intended feature rather than
part of the durability removal.
