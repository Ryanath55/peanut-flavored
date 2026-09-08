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

None active. The pack is kept in place as the home for the next one, and because an empty datapack costs
nothing while re-establishing where it has to live would cost the afternoon documented above.

## Retired patches

**1. Linear Progression: item durability restored.** Disabled 2026-09-08, when Linear Progression was
removed from the pack. Kept intact under `disabled/1-linear-progression-durability/`, with its own README
explaining what it did and how to bring it back.

Removing it was not optional tidying. With LP gone the patch was still in force: 18 vanilla recipe ids
still carried LP's ingredients, and 4 stone tool recipes referenced an LP item tag that no longer exists,
which does not fail the recipe — it resolves to nothing, so they simply could never be crafted. Measured
at 1300 recipes with the patch shipping against 1296 without it.

Any patch that overrides a `minecraft:` id with another mod's content has this property: it must leave when
that mod leaves, and nothing in the game will say so. Check the disabled folder whenever a mod comes out of
the pack.
