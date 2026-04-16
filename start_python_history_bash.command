#!/usr/bin/env bash
set -e

BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
VENV_DIR="$BASE_DIR/env"
PYTHON_CMD=python3

if [ ! -x "$VENV_DIR/bin/python" ]; then
  echo "仮想環境を作成しています..."
  $PYTHON_CMD -m venv "$VENV_DIR"
fi

echo "仮想環境を有効化しています..."
source "$VENV_DIR/bin/activate"

echo "必要なライブラリを確認しています..."
"$VENV_DIR/bin/python" -m pip install --upgrade pip
"$VENV_DIR/bin/python" -m pip install -r "$BASE_DIR/requirements.txt"

export PYTHONSTARTUP="$BASE_DIR/startup.py"

echo "Pythonを起動します..."
python