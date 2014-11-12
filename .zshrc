autoload -U compinit
autoload -Uz colors
compinit
colors

# スクリーンロックを予防
stty stop undef

if grep '^fbterm' /proc/$PPID/cmdline > /dev/null; then
	         export TERM=fbterm
fi


if [ $TERM = "xterm"  -o $TERM = "rxvt-256color" -o $TERM = "screen" -o $TERM = "fbterm" ]; then
	export LANG=ja_JP.UTF-8
else
	export LANG=C
fi

export HISTSIZE=100000
export SAVEHIST=100000
export PROMPT="%{${fg[red]}%}%n@%m%{${reset_color}%}%f [ %~ ] %h %# "
export CFLAGS="-Wall -O3 -m64 -march=core2 -mtune=core2 -mmmx -msse -msse2 -mssse3 -msse4.1 -fomit-frame-pointer -fbranch-probabilities -pipe"
export CXXFLAGS="${CFLAGS}"

export MANPATH=/home/sasai/local/man:$MANPATH
export LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/usr/lib64
export HISTFILE=/home/sasai/._zsh_history
export PATH=/home/sasai/local/bin:$PATH

alias ls="ls --color=auto"
alias open="$HOME/local/bin/xdg-open"
alias fbterm="fbterm --vesa-mode=379"
alias rl="source ~/.zshrc"
alias zh="cat ~/._zsh_history"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

precmd() {
	print -Pn "\e]0;[$USER@$HOST] %~\a"
}

if [ "$TERM" = "screen" ]; then
	preexec() {
		1="$1 "
		print -n "\ek${${(s: :)1}[1]}\e\\"
	}
	precmd() {
			print -n "\ekzsh\e\\"
	}
fi
