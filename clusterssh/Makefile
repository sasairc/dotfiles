include ../config.mk

init-config: config
	install -pd $(ROOTDIR)/.clusterssh
	install -pm 644 $< $(ROOTDIR)/.clusterssh

init: init-config

.PHONY: init
