# -*- mode: shell-script; coding: utf-8; -*-
# 
# zshrc
#

# 環境変数
# ==========================================================

## 言語的な意味で
# ----------------------------------------------------------

# 言語の設定を行います。
export LANG=ja_JP.UTF-8

# KNODE に UTF-8 を設定します。
export KCODE=u

## プロンプト的な意味で
# ----------------------------------------------------------

# 保管リストが多い時に尋ねる数です。
#  -1 : 尋ねません。
#   0 : 窓からあふれる場合は尋ねます。
export LISTMAX=0

## デフォルトコマンド的な意味で
# ----------------------------------------------------------

# デフォルトで使用するエディタを設定します。
export EDITOR=vim
if ! type vim > /dev/null 2>&1; then
    alias vim=vi
fi

## パス
# ----------------------------------------------------------

if [[ `uname` = 'FreeBSD' ]]; then
    # FreeBSD 用。
    export PREFIX=/usr
fi

if [[ -d ~/bin ]]; then
    # ローカルのプログラムを置いておくところです。
    export LOCAL_BIN=~/bin
fi

if [[ -d /opt/pspsdk ]]; then
    # PSP の開発環境へのパスです。
    export PSP_SDK=/opt/pspsdk
fi

if [[ -d /opt/addon-sdk ]]; then
    # Addon SDK 用コマンドへのパスです。
    export ADDON_SDK=/opt/addon-sdk
fi

if [[ -d /opt/clojurescript/bin/ ]]; then
    # Clojurescript へのパスです。
    export CLOJURESCRIPT=/opt/clojurescript/bin/
fi

if [[ -d /usr/share/java ]]; then
    # jar ファイルが置いてあるパスです。
    export JARLIB=/usr/share/java
    # java 用のクラスパスです。
    #export CLASSPATH='.:$JARLIB/*:$JARLIB/apache-ant/lib/*:$JARLIB/commons-collections/*:$JARLIB/jna/*:$JARLIB/junit/*:$JARLIB/logback/*:$JARLIB/slf4j/*:$JARLIB/thrift/*:$JARLIB/twitter4j/*'
    export CLASSPATH='.:/usr/share/java/*:/usr/share/java/apache-ant/lib/*:/usr/share/java/commons-collections/*:/usr/share/java/jna/*:/usr/share/java/junit/*:/usr/share/java/logback/*:/usr/share/java/slf4j/*:/usr/share/java/thrift/*:/usr/share/java/twitter4j/*'
fi

if [[ -d /usr/lib/node_modules/ ]]; then
    #export NODE_PATH=/usr/lib/node_modules/:.
    export NODE_PATH=.:/usr/lib/node_modules/
fi

typeset -U path

path=($path ${LOCAL_BIN}(N) ${PSP_SDK}(N) ${ADDON_SDK}(N) ${CLOJURESCRIPT}(N))


# ==============================================================================
# 
# プロンプト関係
# 
# ==============================================================================
# 通常のプロンプトです。
PROMPT="%B%n@%m%b %c %# "
# for や while 、複数行入力時等に表示されるプロンプトです。
PROMPT2="%_>%_b"
# 入力ミスを確認する場合に表示されるプロンプトです。
SPROMPT="'%r' is correct? [n,y,a,e]: "
# 右に表示したいプロンプトです。
RPROMPT="%T"

# 右プロンプトまで入力が来たら消すようにします。
setopt transient_rprompt


# ==============================================================================
# 
# キーバインド
# 
# ==============================================================================
# vi ライクなキーバインドにします…がコメントアウトされています。
#bindkey -v
# Emacs ライクなキーバインドにします。
bindkey -e


# ==============================================================================
# 
# 補完関係
# 
# ==============================================================================
# 標準の保管設定を行います。
autoload -U compinit; compinit

# ディレクトリ名を入力するだけでカレントディレクトリを変更します。
setopt auto_cd

# タブキー連打で保管候補を順に表示します。
setopt auto_menu

# 自動修正機能(候補を表示)を使いません。
#setopt correct

# 保管候補を詰めて表示します。
setopt list_packed

# 保管候補一覧でファイルの種別を表す識別マークを表示(ls -F の記号)します。
setopt list_types

# パスの最後につくスラッシュを自動的に削除しないようにします。
setopt noautoremoveslash

# = 以降でも保管できるようにします(--prefix=/usr のような場合)。
setopt magic_equal_subst

# 保管候補リストの日本語を正しく表示するようにします。
setopt print_eight_bit

# 補完時に大文字小文字を区別しないようにします(但し、大文字を打った場合は小文字に変換しません)。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ls コマンドの保管候補にも色つき表示を行います。
eval `dircolors`
zstyle ':completion:*:default' list-colors ${LS_COLORS}

# kill の候補にも色つき表示を行います。
zstyle ':completion:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'


# ==============================================================================
# 
# 履歴関係
# 
# ==============================================================================
# ヒストリーファイルのパスを設定します。
HISTFILE=~/.zsh_history

# ヒストリに保存するコマンド数です。
HISTSIZE=10000

# ヒストリファイルに保存するコマンド数です。
SAVEHIST=10000

# 重複するコマンド行は古い方を削除します。
setopt hist_ignore_all_dups

# 直前と同じコマンドラインはヒストリに追加しないようにします。
setopt hist_ignore_dups

# コマンド履歴ファイルを共有します。
setopt share_history

# 履歴をインクリメンタルに追加します。
setopt inc_append_history

# history コマンドは履歴に登録しません。
setopt hist_no_store

# 余分な空白は詰めて記録します。
setopt hist_reduce_blanks

# 先頭がスペースの場合、ヒストリに追加しません。
setopt hist_ignore_space

# cd - と入力して Tab キーで今までに移動したディレクトリを一覧表示します。
setopt auto_pushd

# ディレクトリスタックで重複する古い方を削除することにします。
setopt pushd_ignore_dups


# ==============================================================================
# 
# エイリアス
# 
# ==============================================================================
# 保管される前にオリジナルのコマンドまで展開してチェックします。
setopt complete_aliases
