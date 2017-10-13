include ../config.mk

init-gitconfig: .gitconfig
	install -pd $(ROOTDIR)
	install -pm 644 $< $(ROOTDIR)

init-gitignore: gitignore
	install -pd $(ROOTDIR)/.git
	install -pm 644 $< $(ROOTDIR)/.git

init: init-gitconfig	\
      init-gitignore

.PHONY: init
