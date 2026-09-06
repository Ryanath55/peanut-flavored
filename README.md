# Peanut Flavored

A NeoForge 1.21.1 modpack, managed with [packwiz](https://packwiz.infra.link/)
and kept in git. This repository lives **inside** the live Modrinth profile
(`%APPDATA%\ModrinthApp\profiles\<your instance folder>`), so the launcher and git
operate on the same files — change a config in-game and it shows up in
`git status`.

- Minecraft **1.21.1**, NeoForge **21.1.248**
- 66 mods, every one pinned to an exact version by project id and hash

## Layout

| Path | What it is |
| --- | --- |
| `pack.toml` | The pack's ID card — name, author, version, MC/loader versions. |
| `index.toml` | packwiz bookkeeping: every tracked file and its hash. |
| `mods/*.pw.toml` | One small text file per mod: project id, version id, download URL, hash. No jars. |
| `config/`, `defaultconfigs/` | The pack tuning. Ships with the pack. |
| `packreg.py`, `REGISTER.md` | The mod register — why each mod is here. See [PACKREG.md](PACKREG.md). |

## Everyday use

**packwiz does not download jars.** It only writes the record. Your game loads
whatever `.jar` files are physically in `mods/`, and those are still the Modrinth
launcher's job. So every mod change is two steps: change the jar, then tell
packwiz.

Add a mod:

1. Install it in the Modrinth app as usual, so the jar lands in `mods/`.
2. Record it: `packwiz modrinth add <slug-or-url>`
3. `packwiz refresh`

Remove a mod: delete it in the Modrinth app, then `packwiz remove <slug>`,
then `packwiz refresh`.

Update everything, or one mod:

```
packwiz update --all
packwiz update <mod>
```

This rewrites the `.pw.toml` records only — the launcher still has the old jars
until you update them there too.

After any mod change, re-sync the register:

```
py -3.12 packreg.py sync
```

Hand the pack to someone:

```
packwiz modrinth export
```

That writes a `.mrpack` they can import into the Modrinth launcher. It contains
the metadata and configs — their launcher downloads the jars.

## Environment notes

`packwiz.exe` lives in `~/bin`, which is already on PATH.

Use **`py`**, not `python` or `python3` — the bare names hit a Microsoft Store
stub on this machine. Note that `PACKREG.md` and its pre-commit hook were
written assuming `python3`; substitute `py`.

`packreg.py` needs **Python 3.11+** for `tomllib`. This machine has 3.10.7, so
it will not run yet.

## What is not tracked, and why

- **`mods/*.jar`** — ~271 MB, all re-downloadable. The `.pw.toml` files record
  exactly which version each one was, so nothing is lost.
- **`saves/`**, **`screenshots/`**, **`logs/`**, **`crash-reports/`**,
  **`debug/`**, **`.cache/`**, **`.mixin.out/`** — output, not input.
- **`shaderpacks/`**, **`resourcepacks/`** — third-party redistributables.
- **`config/sodium-fingerprint.json`** — a hardware fingerprint for this machine.
- **`config/resourceful-config-web.json`** — holds a generated password for the
  local config web panel.

`.gitignore` works by **allowlist**: everything at the root is ignored and
tracked paths are re-added one by one, because a Minecraft instance grows new
directories on its own. Adding a new tracked path means adding a `!` line.

`.packwizignore` is the separate question of what ships in an exported pack —
configs yes, personal state and raw jars no.

## Barren Skies itself

The mod this pack exists to test is tracked like any other mod, pulled from its
GitHub release rather than Modrinth:

```
packwiz github add Ryanath55/BarrenSkies
```

`packwiz update barrenskies` picks up new releases. Publish a release on
[Ryanath55/BarrenSkies](https://github.com/Ryanath55/BarrenSkies) first — a
pushed commit is not a release, and packwiz can only see releases.
