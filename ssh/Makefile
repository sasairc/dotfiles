include ../config.mk

init-sshconfig: config
	install -pd $(ROOTDIR)/.ssh
	install -pm 644 $< $(ROOTDIR)/.ssh

init: init-sshconfig

.PHONY: init
