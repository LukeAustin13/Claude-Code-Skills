# validate-skills.ps1
# Checks that every skill folder under standalone/user/skills/ contains a SKILL.md.
# Exits with code 1 if any skill is missing its SKILL.md.

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path | Split-Path -Parent
$skillsDir = Join-Path $repoRoot "standalone\user\skills"

$failed = @()

Get-ChildItem -Directory $skillsDir | ForEach-Object {
    $skillMd = Join-Path $_.FullName "SKILL.md"
    if (-not (Test-Path $skillMd)) {
        $failed += $_.Name
        Write-Host "MISSING SKILL.md: $($_.Name)" -ForegroundColor Red
    } else {
        Write-Host "OK: $($_.Name)" -ForegroundColor Green
    }
}

if ($failed.Count -gt 0) {
    Write-Host "`nValidation failed. $($failed.Count) skill(s) missing SKILL.md." -ForegroundColor Red
    exit 1
} else {
    Write-Host "`nAll skills valid." -ForegroundColor Green
    exit 0
}
