include ../config.mk

init-asoundrc: .asoundrc
	install -pd $(ROOTDIR)
	install -pm 644 $< $(ROOTDIR)

init: init-asoundrc

.PHONY: init
