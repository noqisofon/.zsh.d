# -*- mode: shell-script; coding: utf-8; -*-
# 
# zshrc
# 
# 
# 環境変数
# ==========================================================
#
## 言語的な意味で
# ----------------------------------------------------------
#
# KNODE に UTF-8 を設定します。
export KCODE=u
#
## プロンプト的な意味で
# ----------------------------------------------------------
#
# 保管リストが多い時に尋ねる数です。
#  -1 : 尋ねません。
#   0 : 窓からあふれる場合は尋ねます。
export LISTMAX=0
#
## パス
# ----------------------------------------------------------
#
# Ports 用の設定。
# 
case ${OSTYPE} in
    freebsd*|darwin*)
        export PREFIX=/usr
        ;;
esac
#
if [[ -d $HOME/bin ]]; then
    # ローカルのプログラムを置いておくところです。
    export LOCAL_BIN=$HOME/bin
fi
#

if [[ -f $HOME/.zsh.d/perlenv ]]; then
    source $HOME/.zsh.d/perlenv
fi

#
if [[ -d $HOME/.gem/ruby/2.6.0/bin/ ]]; then
    export RUBYGEMS_BIN=$HOME/.gem/ruby/2.6.0/bin
fi
#
if [[ -d /opt/android-ndk/ ]]; then
    export ANDROID_NDK=/opt/android-ndk
fi
#
if [[ -d /opt/android-sdk/ ]]; then
    export ANDROID_SDK=/opt/android-sdk/tools
fi
#
if [[ -d /opt/pspsdk/ ]]; then
    # PSP の開発環境へのパスです。
    export PSP_SDK=/opt/pspsdk
fi
#
if [[ -d /opt/addon-sdk/ ]]; then
    # Addon SDK 用コマンドへのパスです。
    export ADDON_SDK=/opt/addon-sdk
fi
#
if [[ -d /opt/clojurescript/bin/ ]]; then
    # Clojurescript へのパスです。
    export CLOJURESCRIPT=/opt/clojurescript/bin
fi
#
if [[ -f $HOME/.zsh.d/pythonenv ]]; then
    source $HOME/.zsh.d/pythonenv
fi

if [[ -f $HOME/.zsh.d/classpath ]]; then
    source $HOME/.zsh.d/classpath
fi

#
if [[ -d /usr/share/clojure/ ]]; then
    export CLOJURE_CLASSPATH="${CLASSPATH}"
fi
#
if [[ -d /usr/lib/node_modules/ ]]; then
    #export NODE_PATH=/usr/lib/node_modules/:.
    export NODE_PATH=.:/usr/lib/node_modules
fi
#
if [[ -d /usr/lib/go/ ]]; then
    export GOPATH=$HOME/.golang
fi
#
if [[ -d ~/.yarn/bin/ ]]; then
    export YARN_BIN=~/.yarn/bin
fi
#
typeset -U path
#
path=(/sbin
      /bin
      /usr/sbin
      /usr/bin
      /usr/local/bin
      /usr/local/sbin
      ${LOCAL_BIN}(N)
      ${CORE_PERL_BIN}(N)
      ${SITE_PERL_BIN}(N)
      ${VENDOR_PERL_BIN}(N)
      ${PERL_LOCAL_BIN}(N)
      ${PERL6_BIN}(N)
      ${RUBYGEMS_BIN}(N)
      ${ANDROID_NDK}(N)
      ${ANDROID_SDK}(N)
      ${PSP_SDK}(N)
      ${ADDON_SDK}(N)
      ${CLOJURESCRIPT}(N)
      ${YARN_BIN}(N))
#
# プロンプト関係
# ==============================================================================
autoload -U promptinit && promptinit
autoload -U colors && colors
#
setopt prompt_subst
#
case ${UID} in
  0)
    # root 用のプロンプトです。
    PROMPT="%B%M%b %~ %# "
    ;;
  *)
    # 通常のプロンプトです。
    PROMPT="%B%n@%m%b %~ %# "
    ;;
esac
# for や while 、複数行入力時等に表示されるプロンプトです。
PROMPT2="%_ >%_b"
# 入力ミスを確認する場合に表示されるプロンプトです。
SPROMPT="'%r' is correct? [n,y,a,e]: "
# 右に表示したいプロンプトです。
RPROMPT="%T"
#
# 右プロンプトまで入力が来たら消すようにします。
setopt transient_rprompt
#
# キーバインド
# ==============================================================================
# vi ライクなキーバインドにします…がコメントアウトされています。
#bindkey -v
# Emacs ライクなキーバインドにします。
bindkey -e
#
# 補完関係
# ==============================================================================
# 標準の保管設定を行います。
autoload -U compinit && compinit
## 先行予測機能がとても糞いので無効にしておきます。
# autoload predict-on && predict-on
# zstyle ' :predict' toggle true
#
# ディレクトリ名を入力するだけでカレントディレクトリを変更します。
setopt auto_cd
#
# タブキー連打で保管候補を順に表示します。
setopt auto_menu
#
# 自動修正機能(候補を表示)を使いません。
#setopt correct
#
# 保管候補を詰めて表示します。
setopt list_packed
#
# 保管候補一覧でファイルの種別を表す識別マークを表示(ls -F の記号)します。
setopt list_types
#
# パスの最後につくスラッシュを自動的に削除しないようにします。
setopt noautoremoveslash
#
# = 以降でも保管できるようにします(--prefix=/usr のような場合)。
setopt magic_equal_subst
#
# 保管候補リストの日本語を正しく表示するようにします。
setopt print_eight_bit
#
# 補完時に大文字小文字を区別しないようにします(但し、大文字を打った場合は小文字に変換しません)。
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#
if [ -f $HOME/.dir_colors ]; then
    # ls コマンドの保管候補にも色つき表示を行います。
    eval `dircolors ~/.dir_colors`
fi
zstyle ':completion:*:default' list-colors ${LS_COLORS}
#
# kill の候補にも色つき表示を行います。
zstyle ':completion:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
#
# コマンドの先頭に sudo をつけてもきちんと保管できるようにします。
zstyle ' :completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
  /usr/sbin /sbin /bin /usr/X11R6/bin
#
# 履歴関係
# ==============================================================================
# root は履歴を保存しないようにします。
if [ $UID = 0 ]; then
    unset HISTFILE
    SAVEHIST=0
else
    # それ以外のユーザーでは履歴を保存するようにします。
    #
    # ヒストリーファイルのパスを設定します。
    HISTFILE=~/.zsh_history
    # ヒストリに保存するコマンド数です。
    HISTSIZE=10000
    # ヒストリファイルに保存するコマンド数です。
    SAVEHIST=10000
fi
#
# 履歴を複数端末間で共有します。
setopt share_history
#
# コマンド履歴ファイルを共有します。
setopt share_history
#
# 履歴をインクリメンタルに追加します。
setopt inc_append_history
#
# history コマンドは履歴に登録しません。
setopt hist_no_store
#
# cd - と入力して Tab キーで今までに移動したディレクトリを一覧表示します。
setopt auto_pushd
#
# ディレクトリスタックで重複する古い方を削除することにします。
setopt pushd_ignore_dups
#
# 先頭がスペースの場合、ヒストリに追加しません。
setopt hist_ignore_space
#
# 重複するコマンド行は古い方を削除します。
setopt hist_ignore_all_dups
#
# 直前と同じコマンドラインはヒストリに追加しないようにします。
setopt hist_ignore_dups
#
# 余分な空白は詰めて記録します。
setopt hist_reduce_blanks
#
# エイリアス
# ==============================================================================
# 保管される前にオリジナルのコマンドまで展開してチェックします。
setopt complete_aliases
