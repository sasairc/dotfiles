include ../config.mk

init-zshrc: .zshrc
	install -pd $(ROOTDIR)
	install -pm 644 $< $(ROOTDIR)

init-completions:
	$(MAKE) -C ./completions	$@

init: init-zshrc	\
      init-completions

.PHONY: init
