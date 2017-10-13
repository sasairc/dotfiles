include ../config.mk

init-fonts.conf: fonts.conf
	install -pd $(XDG_CONFIG_HOME)/fontconfig
	install -pm 644 $< $(XDG_CONFIG_HOME)/fontconfig
	fc-cache -fv

init-fonts.conf.fbterm: .fonts.conf.fbterm
	install -pd $(ROOTDIR)
	install -pm 644 $< $(ROOTDIR)
	FONTCONFIG_FILE="$(ROOTDIR)/$<" fc-cache -fv

init: init-fonts.conf	\
      init-fonts.conf.fbterm

.PHONY: init
