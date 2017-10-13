include ../config.mk

init-fbtermrc: .fbtermrc
	install -pd $(ROOTDIR)
	install -pm 644 $< $(ROOTDIR)

init: init-fbtermrc

.PHONY: init
