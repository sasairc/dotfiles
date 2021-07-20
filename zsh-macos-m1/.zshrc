# disable <Ctrl>-S
stty stop undef

# disable screen lock
export LOCKPRG=/bin/true

source /Users/sasai/.zsh/env.zsh
#source /Users/sasai/.zsh/homebrew.zsh
source /Users/sasai/.zsh/alias.zsh

bindkey -e
autoload -U compinit
autoload -Uz colors
compinit
colors

# prompt
export PROMPT="%{[31m%}%n@%m%{[00m%}%f [ %~ ] %h %# "

# color
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# language
export LANG="ja_JP.UTF-8"
setopt PRINT_EIGHT_BIT

# history
export HISTFILE="/Users/sasai/.zsh/._zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000
export LESSHISTFILE=-
export LESSCHARSET=UTF-8
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_NO_STORE
setopt PUSHD_IGNORE_DUPS

# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end

# editor
export EDITOR=vim

# change terminal window title
function precmd() {
    print -Pn "\e]0;[${USER}@${HOST}] %~\a"

    return 0
}

if [ "${TERM}" = "screen" -o "${TERM}" = "screen-256color" ]; then
    function preexec() {
        1="$1 "
        print -n "\ek${${(s: :)1}[1]}\e\\"
    }
    function precmd() {
        print -n "\ekzsh\e\\"
    }
fi
