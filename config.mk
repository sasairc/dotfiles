ifndef	ROOTDIR
ROOTDIR		= ${HOME}
# ROOTDIR
endif
ifndef	VIMROOT
VIMROOT		= $(ROOTDIR)/.vim
# VIMROOT
endif
ifndef	ZSH_FPATH
ZSH_FPATH	= $(ROOTDIR)/.zsh/completions
# ZSH_FPATH
endif
ifndef	XDG_CONFIG_HOME
XDG_CONFIG_HOME	= $(ROOTDIR)/.config
# XDG_CONFIG_HOME
endif
ifndef	SYSCONFDIR
SYSCONFDIR	= /etc
# SYSCONFDIR
endif
export
