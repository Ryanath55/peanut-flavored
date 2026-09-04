# Barren Skies test pack

The Modrinth profile used to test the [Barren Skies](https://github.com/) mod.
NeoForge, Minecraft 1.21.1.

This repository lives **inside** the live Modrinth profile
(`%APPDATA%\ModrinthApp\profiles\New instance (1)`), so the launcher and git
operate on the same files — edit a config in-game and it shows up in
`git status`.

## What is tracked

| Path | Why |
| --- | --- |
| `config/`, `defaultconfigs/` | The actual pack tuning. This is the point of the repo. |
| `datapacks/` | Pack-local datapacks. |
| `mods/modlist.md` | The mod manifest — exact jar versions, active and disabled. |
| `options.txt` | Client settings (keybinds, video, resource pack order). |
| `tools/` | Maintenance scripts. |

## What is not tracked, and why

- **`mods/*.jar`** — ~271 MB, all re-downloadable from Modrinth. `mods/modlist.md`
  records the exact versions instead.
- **`saves/`** (~342 MB), **`screenshots/`** (~362 MB), **`logs/`**,
  **`crash-reports/`**, **`debug/`**, **`.cache/`**, **`.mixin.out/`** — output,
  not input.
- **`shaderpacks/`** — third-party redistributables.
- **`config/sodium-fingerprint.json`** — a hardware fingerprint for this machine.
- **`config/resourceful-config-web.json`** — holds a generated password for the
  local config web panel.

The `.gitignore` works by **allowlist**: everything at the repo root is ignored,
and tracked paths are re-added one by one. A Minecraft instance grows new
directories on its own, and this way none of them get committed by accident.
Adding a new tracked path means adding a `!` line for it.

## Rebuilding this pack from scratch

1. Create a NeoForge 1.21.1 profile in the Modrinth app.
2. Download every jar in `mods/modlist.md` at the listed version. Rename the
   ones under "Disabled" to end in `.jar.disabled`.
3. Clone this repo over the profile directory.

## After changing mods

```bash
bash tools/update-modlist.sh
git add -A && git commit -m "Update mod list"
```

## Known gap

The manifest records filenames, not Modrinth project/version IDs, so step 2
above is a manual search rather than a scripted restore. The IDs live in the
launcher's `app.db`; extracting them is a future improvement if the pack ever
needs to be reproducible by someone else.
