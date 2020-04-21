case ${OSTYPE} in
    freebsd*|darwin*)
        export PREFIX=/usr
        ;;
esac

export LANG=ja_JP.utf8

export KCODE=u

export EDITOR=vim

export VISUAL=vim

if ! type vim > /dev/null 2>&1; then
    alias vim=vi
fi

export LISTMAX=0

export LESS='-R'

if [ -f $HOME/.source-highlight/src-hilite-lesspipe.sh ]; then
   export LESSOPEN="| $HOME/.source-highlight/src-hilite-lesspipe.sh %s"
fi

if [ "$TERM" = "" -o "$TERM" = "unknown" ]; then
    TERM=linux
fi

if [ "$TERM" = "linux" ]; then
    export LC_TIME=C
    export LC_MESSAGES=C
fi

if [[ -d $HOME/bin ]]; then
    export LOCAL_BIN_DIR=$HOME/bin
fi

if [[ -d /opt/android-ndk/ ]]; then
    export ANDROID_NDK_DIR=/opt/android-ndk
fi

test -f $HOME/.zsh.d/perlenv && source $HOME/.zsh.d/perlenv

test -f $HOME/.zsh.d/rubyenv && source $HOME/.zsh.d/rubyenv

typeset -U path

path=(/sbin
      /bin
      /usr/sbin
      /usr/bin
      /usr/local/bin
      /usr/local/sbin
      ${LOCAL_BIN_DIR}(N)
      ${CORE_PERL_BIN_DIR}(N)
      ${SITE_PERL_BIN_DIR}(N)
      ${VENDOR_PERL_BIN_DIR}(N)
      ${PERL_LOCAL_BIN_DIR}(N)
      ${PERL6_BIN_DIR}(N)
      ${RUBYGEMS_BIN_DIR}(N)
      ${ANDROID_NDK_DIR}(N)
      ${ANDROID_SDK_DIR}(N)
      ${PSP_SDK_DIR}(N)
      ${ADDON_SDK_DIR}(N)
      ${CLOJURESCRIPT_DIR}(N)
      ${YARN_BIN_DIR}(N))
