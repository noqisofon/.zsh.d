# -*- mode: shell-script; coding: utf-8; -*-
# 
# ~/.zsh.d/zshenv
#

## 言語的な意味で
# ----------------------------------------------------------

# 言語の設定を行います。
export LANG=ja_JP.utf8

## デフォルトコマンド的な意味で
# ----------------------------------------------------------

# デフォルトで使用するエディタを設定します。
export EDITOR=vim
if ! type vim > /dev/null 2>&1; then
    alias vim=vi
fi
