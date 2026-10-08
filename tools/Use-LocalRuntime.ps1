$taskProject = Split-Path $PSScriptRoot -Parent
$taskRuntime = Join-Path $taskProject '.runtime'
if (-not (Test-Path (Join-Path $taskRuntime 'php/php.exe'))) {
    $taskRuntime = Join-Path (Split-Path $taskProject -Parent) '.runtime'
}
if (-not (Test-Path (Join-Path $taskRuntime 'php/php.exe'))) { throw 'Install PHP/MySQL first, or add their executables to PATH.' }
$env:Path = "$(Join-Path $taskRuntime 'php');$(Join-Path $taskRuntime 'mysql-8.4.11-winx64/bin');$env:Path"
Write-Host 'Local PHP and MySQL are available in this terminal.'
