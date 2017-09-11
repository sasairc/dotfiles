include ../config.mk

init-vimrc: vimrc
	install -pd $(VIMROOT)
	install -pm 644 $< $(VIMROOT)

init-vimrc.keybind: vimrc.keybind
	install -pd $(VIMROOT)
	install -pm 644 $< $(VIMROOT)

init-vimrc.local: vimrc.local
	install -pd $(VIMROOT)
	install -pm 644 $< $(VIMROOT)

init-vimrc.neobundle: vimrc.neobundle
	install -pd $(VIMROOT)
	install -pm 644 $< $(VIMROOT)

init-vimrc.tweetvim: vimrc.tweetvim
	install -pd $(VIMROOT)
	install -pm 644 $< $(VIMROOT)

init-vimrc.visual: vimrc.visual
	install -pd $(VIMROOT)
	install -pm 644 $< $(VIMROOT)

init-ftplugin init-make.vim init-markdown.vim:
	@$(MAKE) -C ./ftplugin	$@

init: init-vimrc		\
      init-vimrc.keybind	\
      init-vimrc.keybind	\
      init-vimrc.local		\
      init-vimrc.neobundle	\
      init-vimrc.tweetvim	\
      init-vimrc.visual		\
      init-ftplugin

.PHONY: init			\
	init-ftplugin		\
	init-make.vim		\
	init-markdown.vim
