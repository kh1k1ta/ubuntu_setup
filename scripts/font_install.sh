#!/bin/bash
set -e

# 引数チェック（0個または1個のみ許容）
if [ "$#" -gt 1 ]; then
  echo "Usage: $0 [fonts_directory]"
  exit 1
fi

# 引数がなければデフォルトのディレクトリを使用
SRC_DIR=${1:-./fonts}

# 指定されたディレクトリが存在するか確認
if [ ! -d "$SRC_DIR" ]; then
  echo "Error: '$SRC_DIR' is not a valid directory."
  exit 1
fi

# フォントファイルを /usr/share/fonts/ に再帰的にコピー
sudo cp -r "$SRC_DIR"/* /usr/share/fonts/

# コピーしたフォントに対してパーミッションを再帰的に変更
sudo chmod -R 755 /usr/share/fonts/*

# フォントキャッシュの更新
sudo fc-cache -fv

