autoload -U compinit
autoload -Uz colors
compinit
colors

function set_tty_opts() {
    stty stop undef

    return 0
}

function set_env_generic() {
#   setopt VI
    export PROMPT="%{${fg[red]}%}%n@%m%{${reset_color}%}%f [ %~ ] %h %# "

    # history
    export HISTFILE="${HOME}/._zsh_history"
    export HISTSIZE=100000
    export SAVEHIST=100000
    export LESSHISTFILE=-
    setopt HIST_IGNORE_DUPS
    setopt HIST_IGNORE_ALL_DUPS
    setopt HIST_IGNORE_SPACE
    setopt HIST_SAVE_NO_DUPS
    setopt HIST_FIND_NO_DUPS
    setopt HIST_REDUCE_BLANKS
    setopt HIST_NO_STORE
    setopt PUSHD_IGNORE_DUPS

    # エディタさん
    test -f /usr/local/bin/vim              && \
        export EDITOR=/usr/local/bin/vim    || \
        export EDITOR=vim

    # fbterm利用時にTERM=fbtermを設定
    if grep '^fbterm' /proc/${PPID}/cmdline > /dev/null; then
        export TERM="fbterm"
    fi

    # 1. xterm及び、fbterm利用時はLANG=ja_JP.UTF-8を設定
    # 2. TERM=Linux等であればLANG=Cを設定
    if [ ${TERM} = "xterm" -o ${TERM} = "rxvt-256color" -o ${TERM} = "screen" -o ${TERM} = "screen-256color" -o ${TERM} = "fbterm" ]; then
        export LANG="ja_JP.UTF-8"
    else
        export LANG="C"
        setterm --blank 0
    fi

    return 0
}

function set_env_expath() {
    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/games:${HOME}/local/bin"
    export LD_LIBRARY_PATH="/usr/local/lib:/usr/local/lib64:/lib:/lib64:/usr/lib:/usr/lib64:${HOME}/local/lib"
    export LD_LIBRARY_PATH="/lib:/lib64:/usr/local/lib:/usr/lib:/usr/lib64:${HOME}/local/lib"
    export LD_RUN_PATH="${LD_LIBRARY_PATH}"
    export RPATH="${LD_LIBRARY_PATH}"
    export MANPATH="${MANPATH}:${HOME}/local/man"
    export GST_PLUGIN_PATH="/usr/local/lib/gstreamer-0.10:/usr/lib/gstreamer-0.10"
    export GHPROJ="${HOME}/Devel/github.com/sasairc"

    return 0
}

function set_env_termux() {
    export PREFIX="/data/data/com.termux/files/usr"
    export PREFIX_LOCAL="${PREFIX}/local"
    export PATH="${PREFIX_LOCAL}/bin:${PREFIX}/bin"
    export LD_LIBRARY_PATH="${PREFIX_LOCAL}/lib:${PREFIX}/lib"
    export MANPATH="${PREFIX_LOCAL}/share/man:${PREFIX}/share/man"
    export INCLUDE="${PREFIX_LOCAL}/include"
    export GHPROJ="${HOME}/Devel/github.com/sasairc"

    unset LD_PRELOAD

    return 0
}

function set_env_hosts() {
    export DOMAIN="ssiserver.moe.hm"
    export DENTAKU="dentaku.${DOMAIN}"
    export NUMMERN="nummern.${DOMAIN}"
    export COMPUTERWELT="computerwelt.${DOMAIN}"
    export COMPUTERWELT2="computerwelt2.${DOMAIN}"
    export AERODYNAMIK="aerodynamik.${DOMAIN}"
    export ROBOTS="robots.${DOMAIN}"
    export COMPUTERLIEBE="computerliebe.${DOMAIN}"

    return 0
}

function set_env_gcc_x86_64_flags() {
    export DEB_BUILD_OPTIONS="parallel=5"
    #
    # Intel Core2 Quad Q9400 processor
    #
    export CFLAGS="-Wall -O3 -m64 -march=core2 -mtune=core2 -mmmx -msse -msse2 -mssse3 -msse4.1 -fomit-frame-pointer -fbranch-probabilities -pipe"
    export CXXFLAGS="${CFLAGS}"

    return 0
}

function set_env_gcc_armhf_flags () {
    export DEB_BUILD_OPTIONS="parallel=5"
    #
    # ARM v7 Cortex-a53 processor
    #
    #export CFLAGS="-Wall -O3 -mcpu=cortex-a7 -march=armv7-a -mtune=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4 -fforce-addr -pipe"
    #export CXXFLAGS="${CFLAGS}"

    #
    # ARM v8 Cortex-A53 processor
    #
    export CFLAGS="-Wall -O3 -mcpu=cortex-a53 -march=armv8-a+crc -mtune=cortex-a53 -mfloat-abi=hard -mfpu=neon-fp-armv8 -fforce-addr -pipe"
    export CXXFLAGS="${CFLAGS}"

    return 0
}

function set_env_perl5() {
    export PATH="${PATH}:${HOME}/perl5/bin"
    export PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"
    export PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"
    export PERL_MB_OPT="--install_base \"${HOME}/perl5\""
    export PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"
    export PERL_CPANM_OPT="--local-lib=~/perl5"

    return 0
}

function set_env_go() {
    export GOROOT="${HOME}/local/lib/go"
    export GOPATH="${HOME}/Devel/go"
    export PATH="${PATH}:${GOROOT}/bin"

    return 0
}

function set_env_cuda() {
    export PATH="${PATH}:${HOME}/local/opt/cuda-6.5/bin"
    export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${HOME}/local/opt/cuda-6.5/lib64"

    return 0
}

function set_env_pgi() {
    export PGI="${HOME}/local/opt/pgi"
    export PGI_RELEASE="2018"
    export PGI_ARCH="linux86-64"
    export PATH="${PGI}/${PGI_ARCH}/${PGI_RELEASE}/bin:${PGI}/${PGI_ARCH}/${PGI_RELEASE}/mpi/mpenmpi/bin:${PATH}"
    export LM_LICENSE_FILE="${PGI}/license.dat"

    return 0
}

function set_env_android_devkit() {
    export PATH="${HOME}/local/opt/android-studio/bin:${PATH}"
    export JAVA_HOME="${HOME}/local/opt/android-studio/jre"
    export ANDROID_HOME="${HOME}/local/opt/android-sdk"

    return 0
}

function set_env_clangsay() {
    export COWPATH="/usr/share/clangsay/cows:${GHPROJ}/my_cows"
    export DEFAULT_COWFILE="yasuna_09"

    return 0
}

function set_alias_generic() {
    alias ..="cd .."
    alias v="vim"
    alias sc="screen"
    alias sr="screen -r"
    alias ht="headtail --pretty"
    alias ls="ls --color=auto"
    alias open="${HOME}/local/bin/xdg-open"
    alias fbterm="FONTCONFIG_FILE=~/.fonts.conf.fbterm fbterm"
    alias sudo="sudo "
    alias paco="porg"
    alias gtime="/usr/bin/time"
    alias lsb_release="lsb_release -idrc"
    alias fep="uim-fep"
    alias rl="source ${HOME}/.zshrc"
    alias zh="history -i -E 1"
    alias mbhead="mbhead -p"
    alias w3m="w3m www.google.co.jp"
    alias debuild="test -d ./debian && dpkg-buildpackage -us -uc -d && fakeroot ./debian/rules clean && mv debian .."
    alias vlc="LD_LIBRARY_PATH=${HOME}/local/lib:/usr/local/lib:/lib:/lib64:/usr/lib:/usr/lib64 vlc"
    alias slack="slack --logLevel info --silent"

    return 0
}

function set_alias_git() {
    alias gh="cd ${GHPROJ}/"
    alias co="git checkout"
    alias b="git branch"
    alias c="git commit"
    alias p="git push"
    alias d="git diff"
    alias l="git log --decorate=full --graph --color"
    alias m="git merge --no-ff"
    alias mf="git submodule foreach git pull origin master"

    return 0
}

function set_alias_cssh() {
    alias clusterssh="PERL5LIB=\"\" clusterssh"
    alias cssh="PERL5LIB=\"\" cssh"
    alias acssh="PERL5LIB=\"\" cssh ${DENTAKU} ${NUMMERN} ${COMPUTERWELT} ${COMPUTERWELT2} ${AERODYNAMIK} ${ROBOTS} ${COMPUTERLIEBE}"

    return 0
}

function set_zsh_misc_opts() {
    # zshで利用する色の詳細な設定
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

    return 0
}

function set_screen_proc_name() {
    # screen上でのウィンドウ一覧に、プロセス名を表示
    if [ "${TERM}" = "screen" -o "${TERM}" = "screen-256color" ]; then
        function preexec() {
            1="$1 "
            print -n "\ek${${(s: :)1}[1]}\e\\"
        }
        function precmd() {
            print -n "\ekzsh\e\\"
        }
    fi

    return 0
}

function switch_gcc_version_4() {
    local GCC_PREFIX="${HOME}/local"

    test -f ${GCC_PREFIX}/bin/gcc -a -f ${GCC_PREFIX}/bin/g++   || \
        return 1

    export PATH="${GCC_PREFIX}/bin:${PATH}"
    export LD_LIBRARY_PATH="${GCC_PREFIX}/lib:${LD_LIBRARY_PATH}"

    return 0
}

function switch_gcc_version_default() {
    set_env_expath
    set_env_perl5
    set_env_go

    return 0
}

function unset_gcc_optimize_envs() {
    unset CFLAGS CXXFLAGS
    unset RPATH LD_LIBRARY_PATH LD_RUN_PATH

    return 0
}

function set_ld_preload_libsegfault() {
    export LD_PRELOAD="/lib/x86_64-linux-gnu/libSegFault.so"
    export SEGFAULT_SIGNALS="all"

    return 0
}

function precmd() {
    # xterm利用時のタイトル
    print -Pn "\e]0;[${USER}@${HOST}] %~\a"

    return 0
}

function swtmpdir() {
    local TEMP=$(mktemp -d)
    cd $TEMP

    return 0
}

function mntrng() {
    test -f /var/log/rsync_backup.log   && \
        tail -f /var/log/rsync_backup.log &
    test -f /var/log/smart.err          && \
        tail -f /var/log/smart.err &
    clear
    clbiff

    return 0
}

function swapon() {
    test -f ${HOME}/local/tmp/swap.img  && \
        sudo swapon ${HOME}/local/tmp/swap.img

    return 0
}

function temp_of_servers() {
    local CMD="local/bin/temp"

    echo "dentaku:       $(ssh ${DENTAKU} ${CMD})"
    echo "nummern:       $(ssh ${NUMMERN} ${CMD})"
    echo "computerwelt:  $(ssh ${COMPUTERWELT} ${CMD})"
    echo "computerwelt2: $(ssh ${COMPUTERWELT2} ${CMD})"
    echo "aerodynamik:   $(ssh ${AERODYNAMIK} ${CMD})"
    echo "robots:        $(ssh ${ROBOTS} ${CMD})"
    echo "computerliebe: $(ssh ${COMPUTERLIEBE} ${CMD})"

    return 0
}

#function command_not_found_handler() {
    # 煽り
#   yasuna -n 1896 | sed -e "s/財布/ \$PATH /g" -e "s/何も/ $0 が/g"
#}

set_tty_opts

set_env_generic
set_env_expath
set_env_clangsay
set_env_perl5
set_env_go
set_env_cuda
set_env_android_devkit
set_env_hosts

test "${MACHTYPE}" = "x86_64"   && \
    set_env_gcc_x86_64_flags
test "${MACHTYPE}" = "armv7l"  && \
    set_env_gcc_armhf_flags

set_alias_generic
set_alias_git
set_alias_cssh

set_zsh_misc_opts
set_screen_proc_name
