$TARGET = "$env:USERPROFILE\Documents\python-stud"
$GIT    = "$env:LOCALAPPDATA\PortableGit\cmd\git.exe"

Set-Location "$env:USERPROFILE\Documents"

if (Test-Path $TARGET) {
    Remove-Item -Recurse -Force $TARGET
    Write-Host "Folder deleted."
} else {
    Write-Host "Folder does not exist."
}

Set-Location "$env:USERPROFILE\Documents"

if (Test-Path $GIT) {
    & $GIT clone https://github.com/TUMH0404/python-stud.git
} else {
    Write-Host "Git executable not found."
}

Set-Location "$env:USERPROFILE\Documents\python-stud"
