include ../../config.mk

init-clangsay: _clangsay
	install -pd $(ZSH_FPATH)
	install -pm 644 $< $(ZSH_FPATH)

init-clbiff: _clbiff
	install -pd $(ZSH_FPATH)
	install -pm 644 $< $(ZSH_FPATH)

init-kcipher: _kcipher
	install -pd $(ZSH_FPATH)
	install -pm 644 $< $(ZSH_FPATH)

init-ncipher: _ncipher
	install -pd $(ZSH_FPATH)
	install -pm 644 $< $(ZSH_FPATH)

init-pulseaudio: _pulseaudio
	install -pd $(ZSH_FPATH)
	install -pm 644 $< $(ZSH_FPATH)

init-renge:_renge
	install -pd $(ZSH_FPATH)
	install -pm 644 $< $(ZSH_FPATH)

init-yasuna: _yasuna
	install -pd $(ZSH_FPATH)
	install -pm 644 $< $(ZSH_FPATH)

init init-completions:		\
	     init-clangsay	\
	     init-clbiff	\
	     init-kcipher	\
	     init-ncipher	\
	     init-pulseaudio	\
	     init-renge		\
	     init-yasuna

.PHONY: init			\
	init-completions
