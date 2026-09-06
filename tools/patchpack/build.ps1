# Builds src/ into moonlight-global-datapacks/packpatches.zip, then refreshes the packwiz index.
#
# It goes in Moonlight's global datapack folder rather than in mods/, and that is the whole trick.
# A datapack shipped as a mod jar is folded into NeoForge's bundled "mod_data" pack, which sits ABOVE
# every individual mod pack in the load order -- so a mod jar can never reliably override another mod's
# data file, whatever its dependency ordering or filename says. Moonlight registers its global folder
# through AddPackFindersEvent, which fires after the mod packs, so packs from it land after mod_data and
# win. Measured on both a fresh world and an existing one seeing the pack for the first time.
#
# Compress-Archive is not used on purpose: on Windows PowerShell it writes zip entries with backslash
# separators and Minecraft then finds none of the files. This writes the entry names itself.

$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$src  = Join-Path $here "src"
$pack = (Resolve-Path (Join-Path $here "..\..")).Path
$dir  = Join-Path $pack "moonlight-global-datapacks"
$out  = Join-Path $dir "packpatches.zip"

New-Item -ItemType Directory -Force -Path $dir | Out-Null
if (Test-Path $out) { Remove-Item $out -Force }

$zip = [System.IO.Compression.ZipFile]::Open($out, 'Create')
try {
    Get-ChildItem -Path $src -Recurse -File | ForEach-Object {
        $name = $_.FullName.Substring($src.Length + 1).Replace('\', '/')
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $_.FullName, $name) | Out-Null
    }
} finally {
    $zip.Dispose()
}
Write-Output "built $out"

Push-Location $pack
try { & "$env:USERPROFILE\bin\packwiz.exe" refresh } finally { Pop-Location }
