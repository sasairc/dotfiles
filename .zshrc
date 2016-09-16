autoload -U compinit
autoload -Uz colors
compinit
colors

function set_tty_opts() {
	stty stop undef

	return 0
}

function set_env_generic() {
	export HISTSIZE=100000
	export SAVEHIST=100000
	export HISTFILE="${HOME}/._zsh_history"
	export PROMPT="%{${fg[red]}%}%n@%m%{${reset_color}%}%f [ %~ ] %h %# "
	export LESSHISTFILE=-

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
	export PATH="${HOME}/perl5/bin${PATH+:}${PATH}:${HOME}/local/bin"
	export LD_LIBRARY_PATH="/usr/local/lib:/lib:/lib64:/usr/lib:/usr/lib64:${HOME}/local/lib"
	export LD_RUN_PATH="${LD_LIBRARY_PATH}"
	export RPATH="${LD_LIBRARY_PATH}"
	export MANPATH="${MANPATH}:${HOME}/local/man"
	export GHPROJ="${HOME}/Devel/git_sasairc"

	return 0
}

function set_env_gcc_x86_64_flags() {
	export DEB_BUILD_OPTIONS="parallel=3"
	export CFLAGS="-Wall -O3 -m64 -march=core2 -mtune=core2 -mmmx -msse -msse2 -mssse3 -msse4.1 -fomit-frame-pointer -fbranch-probabilities -pipe"
	export CXXFLAGS="${CFLAGS}"

	return 0
}

function set_env_gcc_armhf_flags () {
	export DEB_BUILD_OPTIONS="parallel=3"
	export CFLAGS="-march=armv8-a+crc -mtune=cortex-a53 -mfpu=crypto-neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations -O3 -pipe"
	export CXXFLAGS="${CFLAGS}"

	return 0
}

function set_env_perl5() {
	export PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"
	export PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"
	export PERL_MB_OPT="--install_base \"${HOME}/perl5\""
	export PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"
	export PERL_CPANM_OPT="--local-lib=~/perl5"

	return 0
}

function set_env_clangsay() {
	export COWPATH="${GHPROJ}/my_cows:/usr/share/clangsay/cows"
	export DEFAULT_COWFILE="yasuna_09"

	return 0
}

function set_alias_generic() {
	alias ..="cd .."
	alias v="vim"
	alias sc="screen"
	alias ht="headtail --pretty"
	alias ls="ls --color=auto"
	alias open="${HOME}/local/bin/xdg-open"
	alias fbterm="FONTCONFIG_FILE=~/.fonts.conf.fbterm fbterm --vesa-mode=379"
	alias sudo="sudo "
	alias paco="porg"
	alias gtime="/usr/bin/time"
	alias lsb_release="lsb_release -idrc"
	alias fep="uim-fep"
	alias rl="source ${HOME}/.zshrc"
	alias zh="cat ${HOME}/._zsh_history"
	alias sshs="ssh ssiserver.moe.hm -l sasai"

	return 0
}

function set_alias_git() {
	alias gh="cd ${GHPROJ}/"
	alias co="git checkout"
	alias b="git branch"
	alias c="git commit"
	alias p="git push"
	alias d="git diff"
	alias l="git log --decorate=full --graph"
	alias m="git merge --no-ff"

	return 0
}

function set_zsh_misc_opts() {
	# zshで利用する色の詳細な設定
	zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

	return 0
}

function set_screen_proc_name() {
	# screen上でのウィンドウ一覧に、プロセス名を表示
	if [ "${TERM}" = "screen" ]; then
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

function precmd() {
	# xterm利用時のタイトル
	print -Pn "\e]0;[${USER}@${HOST}] %~\a"

	return 0
}

#function command_not_found_handler() {
	# 煽り
#	yasuna -n 1896 | sed -e "s/財布/ \$PATH /g" -e "s/何も/ $0 が/g"
#}

set_tty_opts

set_env_generic
set_env_expath
set_env_gcc_x86_64_flags
set_env_perl5
set_env_clangsay

set_alias_generic
set_alias_git

set_zsh_misc_opts
set_screen_proc_name
