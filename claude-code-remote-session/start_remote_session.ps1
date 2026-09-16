<#
Ensures a live, Remote-Control-enabled Claude Code session exists for THIS
project, so it can be picked up from claude.ai/code or the Claude mobile app
without touching this PC. Idempotent: if a session (interactive or
background) is already running for this project, it does nothing rather
than piling up duplicates - safe to run repeatedly, e.g. from a scheduled
task.

Fully portable, copy-paste reusable across projects, unmodified:
- The project root is wherever THIS script itself is placed (its own
  folder) - drop it in a new project's root and it just works there too.
- The session name is derived from that folder's name, so running this in
  several different projects' folders (even in parallel) never collides -
  each gets its own independently named, independently tracked session.
- Extra directories/drives outside the project root that a session needs
  tool access to (e.g. a venv on another drive) go in an optional sibling
  file, remote_session.extra_dirs.txt, one path per line, '#' for comments -
  read at launch and passed as --add-dir so a background session doesn't
  stall on a permission prompt nobody's there to answer. Not required; if
  the file doesn't exist, nothing extra is added.

Called by the sibling start_remote_session.bat.
#>

$ErrorActionPreference = "Stop"

$claudeExe   = Join-Path $env:USERPROFILE ".local\bin\claude.exe"
$project     = $PSScriptRoot
$sessionName = (Split-Path $project -Leaf) + "-recovery"

Set-Location $project

$existing = & $claudeExe agents --json --cwd $project 2>$null | ConvertFrom-Json
$alive = $existing | Where-Object { $_.status -notin @("exited", "stopped") }

if ($alive) {
    Write-Host "A Claude Code session is already running for '$project' (pid $($alive[0].pid), status $($alive[0].status)) - not starting another."
    exit 0
}

$addDirArgs = @()
$extraDirsFile = Join-Path $project "remote_session.extra_dirs.txt"
if (Test-Path $extraDirsFile) {
    $extraDirs = Get-Content $extraDirsFile | ForEach-Object { $_.Trim() } |
        Where-Object { $_ -ne "" -and -not $_.StartsWith("#") }
    foreach ($dir in $extraDirs) {
        $addDirArgs += "--add-dir"
        $addDirArgs += $dir
    }
    if ($extraDirs) {
        Write-Host "Pre-authorizing extra director$(if ($extraDirs.Count -eq 1) { 'y' } else { 'ies' }): $($extraDirs -join ', ')"
    }
}

Write-Host "No live session found for '$project' - starting a new background, remote-controlled session named '$sessionName'..."

$prompt = "Read handover_prompt.md fully first, then resume the work from exactly where its Current Status / Not started yet section leaves off. Keep handover_prompt.md updated as you work, per its own instructions at the top of that file."

& $claudeExe --background --remote-control $sessionName --name $sessionName --permission-mode auto @addDirArgs $prompt
