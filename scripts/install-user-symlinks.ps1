# install-user-symlinks.ps1
# Links ~/.claude/ assets to this repo's standalone/user/ files.
# Covers: skills/, agents/, CLAUDE.md, settings.json
#
# No admin or Developer Mode required:
#   - Skill folders  → Junction      (directory mount point, no elevation needed)
#   - Files          → HardLink      (no elevation needed; both paths must be on the same drive)

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path | Split-Path -Parent
$claudeDir = "$env:USERPROFILE\.claude"
$userSrc   = Join-Path $repoRoot "standalone\user"
$skillsSrc = Join-Path $userSrc "skills"
$agentsSrc = Join-Path $userSrc "agents"
$skillsDst = Join-Path $claudeDir "skills"
$agentsDst = Join-Path $claudeDir "agents"

function Ensure-Dir($path) {
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Path $path | Out-Null
        Write-Host "Created: $path"
    }
}

# For directories (skill folders). Junction requires no elevation on Windows.
function Link-Dir($src, $dst) {
    if (Test-Path $dst) {
        Write-Host "Already exists, skipping: $dst"
    } else {
        New-Item -ItemType Junction -Path $dst -Target $src | Out-Null
        Write-Host "Linked (junction): $dst -> $src"
    }
}

# For individual files (agents, CLAUDE.md, settings.json).
# HardLink requires no elevation and both paths must be on the same NTFS volume.
function Link-File($src, $dst) {
    if (Test-Path $dst) {
        Write-Host "Already exists, skipping: $dst"
    } else {
        New-Item -ItemType HardLink -Path $dst -Target $src | Out-Null
        Write-Host "Linked (hardlink): $dst -> $src"
    }
}

Ensure-Dir $claudeDir

Write-Host "Installing CLAUDE.md..."
Link-File (Join-Path $userSrc "CLAUDE.md") (Join-Path $claudeDir "CLAUDE.md")

Write-Host "Installing settings.json..."
Link-File (Join-Path $userSrc "settings.example.json") (Join-Path $claudeDir "settings.json")

Write-Host "Installing skills..."
Ensure-Dir $skillsDst
Get-ChildItem -Directory $skillsSrc | ForEach-Object {
    Link-Dir $_.FullName (Join-Path $skillsDst $_.Name)
}

Write-Host "Installing agents..."
Ensure-Dir $agentsDst
Get-ChildItem -Filter "*.md" $agentsSrc | ForEach-Object {
    Link-File $_.FullName (Join-Path $agentsDst $_.Name)
}

Write-Host "Done."
