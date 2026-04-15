@echo off
chcp 65001 > nul
setlocal

set "BASE_DIR=%~dp0"
set "VENV_DIR=%BASE_DIR%env"
set "REQ_FILE=%BASE_DIR%requirements.txt"
set "PYTHON_CMD=python"

where py > nul 2>&1
if %errorlevel%==0 (
    set "PYTHON_CMD=py"
) else (
    where python > nul 2>&1
    if %errorlevel%==0 (
        set "PYTHON_CMD=python"
    )
)

if "%PYTHON_CMD%"=="" (
    echo Python が見つかりませんでした。
    echo 先に Python をインストールしてください。
    pause
    exit /b 1
)

echo 使用する Python:
%PYTHON_CMD% --version



if not exist "%VENV_DIR%\Scripts\python.exe" (
    echo 仮想環境を作成しています...
    %PYTHON_CMD% -m venv "%VENV_DIR%"
)

echo 仮想環境を有効化しています...
call "%VENV_DIR%\Scripts\activate.bat"

echo 必要なライブラリを確認しています...
python -m pip install --upgrade pip
python -m pip install -r "%REQ_FILE%"

echo VS Code のターミナル内で専用 Python を起動します...
python "%BASE_DIR%history_repl.py"

echo Pythonを終了しました。
pause
endlocal
exit