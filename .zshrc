autoload -U compinit
autoload -Uz colors
compinit
colors

stty stop undef	# スクリーンロックを予防

## 環境変数の設定
if grep '^fbterm' /proc/${PPID}/cmdline > /dev/null; then
	export TERM=fbterm	# fbterm利用時にTERM=fbtermを指定
	setterm --blank 0	# スクリーン消灯を無効
fi

if [ ${TERM} = "xterm"  -o ${TERM} = "rxvt-256color" -o ${TERM} = "screen" -o ${TERM} = "fbterm" ]; then
	export LANG=ja_JP.UTF-8	# xterm及び、fbterm利用時はLANG=ja_JP.UTF-8を設定
else
	export LANG=C		# TERM=linux等であればLANG=Cを設定
	setterm --blank 0	# スクリーン消灯を無効
fi

export HISTSIZE=100000
export SAVEHIST=100000
export HISTFILE="${HOME}/._zsh_history"
export PROMPT="%{${fg[red]}%}%n@%m%{${reset_color}%}%f [ %~ ] %h %# "

export PATH="${HOME}/perl5/bin${PATH+:}${PATH}:${HOME}/local/bin"
export LD_LIBRARY_PATH="/usr/local/lib:/lib:/lib64:/usr/lib:/usr/lib64:${HOME}/local/lib"
export LD_RUN_PATH="${LD_LIBRARY_PATH}"
export RPATH="${LD_LIBRARY_PATH}"
export MANPATH="${MANPATH}:${HOME}/local/man"
export GHPROJ="${HOME}/Devel/git_sasairc"

export DEB_BUILD_OPTIONS="parallel=3"	# dpkg-buildpackageするときのプロセス数
export CFLAGS="-Wall -O3 -m64 -march=core2 -mtune=core2 -mmmx -msse -msse2 -mssse3 -msse4.1 -fomit-frame-pointer -fbranch-probabilities -pipe"	# ccで使用するCFLAGS
export CXXFLAGS="${CFLAGS}"				# CFLAGSをg++でも利用

export PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"
export PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"
export PERL_MB_OPT="--install_base \"${HOME}/perl5\""
export PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"
export PERL_CPANM_OPT="--local-lib=~/perl5"

export COWPATH="/usr/share/clangsay/cows:${GHPROJ}/my_cows"
export DEFAULT_COWFILE="yasuna_9"

## aliasの設定
alias v="vim"
alias sc="screen"
alias ht="headtail --pretty"
alias ls="ls --color=auto"
alias open="${HOME}/local/bin/xdg-open"
alias fbterm="FONTCONFIG_FILE="~/.fonts.conf.fbterm" fbterm --vesa-mode=379"
#alias fbterm="fbterm --vesa-mode=379"
alias gtime="/usr/bin/time"
alias lsb_release="lsb_release -idrc"
alias fep="uim-fep"
alias rl="source ${HOME}/.zshrc"
alias zh="cat ${HOME}/._zsh_history"
alias sshs="ssh ssiserver.moe.hm -l sasai"
# git
alias gh="cd ${GHPROJ}/"
alias co="git checkout"
alias b="git branch"
alias c="git commit"
alias p="git push"
alias d="git diff"
alias l="git log --decorate=full --graph"
alias m="git merge --no-ff"

## zshで利用する色の詳細な設定
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

## xterm*利用時のタイトル
precmd() {
	print -Pn "\e]0;[${USER}@${HOST}] %~\a"
}

## 煽り
#function command_not_found_handler() {
#	yasuna -n 1805 | sed -e "s/瓦/$0/g"
#}

## screen上でのウィンドウ一覧に、プロセス名を表示
if [ "${TERM}" = "screen" ]; then
	preexec() {
		1="$1 "
		print -n "\ek${${(s: :)1}[1]}\e\\"
	}
	precmd() {
			print -n "\ekzsh\e\\"
	}
fi
