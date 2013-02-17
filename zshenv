# -*- mode: shell-script; coding: utf-8; -*-
# 
# ~/.zsh.d/zshenv
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

# FreeBSD 用。
export PREFIX=/usr

# ローカルのプログラムを置いておくところです。
export LOCAL_BIN=~/bin

# PSP の開発環境へのパスです。
export PSPSDK=/opt/pspsdk

# Addon SDK 用コマンドへのパスです。
export ADDON_SDK=/opt/addon-sdk/bin

# Clojurescript へのパスです。
export CLOJURESCRIPT=/opt/clojurescript/bin/

# jar ファイルが置いてあるパスです。
export JARLIB=/usr/share/java


# java 用のクラスパスです。
#export CLASSPATH='.:$JARLIB/*:$JARLIB/apache-ant/lib/*:$JARLIB/commons-collections/*:$JARLIB/jna/*:$JARLIB/junit/*:$JARLIB/logback/*:$JARLIB/slf4j/*:$JARLIB/thrift/*:$JARLIB/twitter4j/*'
export CLASSPATH='.:/usr/share/java/*:/usr/share/java/apache-ant/lib/*:/usr/share/java/commons-collections/*:/usr/share/java/jna/*:/usr/share/java/junit/*:/usr/share/java/logback/*:/usr/share/java/slf4j/*:/usr/share/java/thrift/*:/usr/share/java/twitter4j/*'

#export NODE_PATH=/usr/lib/node_modules/:.
export NODE_PATH=.:/usr/lib/node_modules/

export PATH=$PATH:$LOCAL_BIN:$PSPSDK/bin:$CLOJURESCRIPT
