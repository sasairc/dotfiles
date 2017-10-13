include ../config.mk

init-screenrc: .screenrc
	install -pd $(ROOTDIR)
	install -pm 644 $< $(ROOTDIR)

init: init-screenrc

.PHONY: init
