$TARGET = "$env:USERPROFILE\Documents\python-stud"

# Gitを探す（PATH優先）
$GIT = (Get-Command git -ErrorAction SilentlyContinue)?.Source

# 見つからなければ代表的な場所を探す
if (-not $GIT) {
    $candidates = @(
        "$env:ProgramFiles\Git\bin\git.exe",
        "$env:LOCALAPPDATA\Programs\Git\bin\git.exe",
        "$env:USERPROFILE\tools\git\cmd\git.exe"
    )

    foreach ($path in $candidates) {
        if (Test-Path $path) {
            $GIT = $path
            break
        }
    }
}

# フォルダ削除
if (Test-Path $TARGET) {
    Remove-Item -Recurse -Force $TARGET
    Write-Host "Folder deleted."
} else {
    Write-Host "Folder does not exist."
}

# Documentsへ移動
Set-Location "$env:USERPROFILE\Documents"

# Git実行
if ($GIT) {
    & $GIT clone https://github.com/TUMH0404/python-stud.git
} else {
    Write-Host "Git executable not found."
    exit 1
}

# フォルダ移動
Set-Location $TARGET
