include ../config.mk

init-Xmodmap: .Xmodmap
	install -pd $(ROOTDIR)
	install -pm 644 $< $(ROOTDIR)

init-Xresources: .Xresources
	install -pm 644 $< $(ROOTDIR)

init-xinitrc: .xinitrc
	install -pd $(ROOTDIR)
	install -pm 755 $< $(ROOTDIR)

init-xsession: .xsession
	install -pd $(ROOTDIR)
	install -pm 755 $< $(ROOTDIR)

init: init-Xmodmap	\
      init-Xresources	\
      init-xinitrc	\
      init-xsession

.PHONY: init
