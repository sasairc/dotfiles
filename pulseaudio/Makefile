include ../config.mk

init-client.conf: client.conf
	install -pd $(SYSCONFDIR)/pulse
	install -pm 644 $< $(SYSCONFDIR)/pulse

init-daemon.conf: daemon.conf
	install -pd $(SYSCONFDIR)/pulse
	install -pm 644 $< $(SYSCONFDIR)/pulse

init-default.pa: default.pa
	install -pd $(SYSCONFDIR)/pulse
	install -pm 644 $< $(SYSCONFDIR)/pulse

init-system.pa: system.pa
	install -pd $(SYSCONFDIR)/pulse
	install -pm 644 $< $(SYSCONFDIR)/pulse

init: init-client.conf	\
      init-daemon.conf	\
      init-default.pa	\
      init-system.pa

.PHONY: init
