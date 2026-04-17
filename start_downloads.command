#!/usr/bin/env bash

echo "古いフォルダを削除します..."
rm -rf python-stud-main

echo "ダウンロード..."
curl -L -O https://github.com/TUMH0404/python-stud/archive/refs/heads/main.zip

echo "解凍..."
unzip main.zip

cd python-stud-main

chmod +x start_python_history.command
./start_python_history.command
