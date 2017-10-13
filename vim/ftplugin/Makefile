include ../../config.mk

init-make.vim: make.vim
	install -pd $(VIMROOT)/ftplugin
	install -pm 644 $< $(VIMROOT)/ftplugin

init-markdown.vim: markdown.vim
	install -pd $(VIMROOT)/ftplugin
	install -pm 644 $< $(VIMROOT)/ftplugin

init init-ftplugin: init-make.vim init-markdown.vim

.PHONY: init		\
	init-ftplugin
