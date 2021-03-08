include ../config.mk

init-uim: .uim.d
	install -pd $(ROOTDIR)
	install -pm 644 $< $(ROOTDIR)

init: init-uim

.PHONY: init
