include ../config.mk

ifndef	W3MROOT
W3MROOT	= $(ROOTDIR)/.w3m
# W3MROOT
endif

init-bookmark.txt: bookmark.txt
	install -pd $(W3MROOT)
	install -pm 644 $< $(W3MROOT)

init-config: config
	install -pd $(W3MROOT)
	install -pm 644 $< $(W3MROOT)

init-keymap: keymap
	install -pd $(W3MROOT)
	install -pm 644 $< $(W3MROOT)

init: init-bookmark.txt	\
      init-config	\
      init-keymap

.PHONY: all
