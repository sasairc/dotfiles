include ../config.mk

init-clbiffrc: .clbiffrc
	install -pd $(ROOTDIR)
	install -pm 644 $< $(ROOTDIR)

init: init-clbiffrc

.PHONY: init
