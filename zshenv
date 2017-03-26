# -*- mode: shell-script; coding: utf-8; -*-
# 
# ~/.zsh.d/zshenv
#
#
## 言語的な意味で
# ----------------------------------------------------------
#
# 言語の設定を行います。
export LANG=ja_JP.utf8
#
## デフォルトコマンド的な意味で
# ----------------------------------------------------------
#
# デフォルトで使用するエディタを設定します。
export EDITOR=vim
export VISUAL=vim
if ! type vim > /dev/null 2>&1; then
    alias vim=vi
fi

export LESS='-R'
if [ -f ~/.source-highlight/src-hilite-lesspipe.sh ]; then
   export LESSOPEN='| ~/.source-highlight/src-hilite-lesspipe.sh %s'
fi

if [ "$TERM" = "" -o "$TERM" = "unknown" ]; then
    TERM=linux
fi

if [ "$TERM" = "linux" ]; then
    export LC_TIME=C
    export LC_MESSAGES=C
fi

if [ ! -f $HOME/.dir_colors ]; then
    dircolors -p > ~/.dir_colors
fi
