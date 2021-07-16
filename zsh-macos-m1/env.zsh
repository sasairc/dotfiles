# zsh completions
export fpath=($fpath ${ZDOTDIR}/completions)

# prefix local
export PREFIX_LOCAL="${HOME}/local"
export PATH="${PREFIX_LOCAL}/bin:${PATH:+$PATH}"
export INCLUDE="${PREFIX_LOCAL}/include:${INCLUDE:+$INCLUDE}"
export DYLD_LIBRARY_PATH="${PREFIX_LOCAL}/lib:${DYLD_LIBRARY_PATH:+$DYLD_LIBRARY_PATH}"

# homebrew
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

# XDG base directory specification
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"

# git root directory
export GHPROJ="${HOME}/Devel/github.com/sasairc"

# clangsay
export COWPATH="${PREFIX_LOCAL}/share/clangsay/cows:${GHPROJ}/my_cows"
export DEFAULT_COWFILE="yasuna_09"

# compiler
CFLAGS="-Wall -Wextra -O3 -pipe"
CXXFLAGS="${CFLAGS}"

# compiler (universal binary)
#CFLAGS="-arch x86_64 -arch arm64"
#CXXFLAGS="${CFLAGS}"

# linker (universal binary)
#LDFLAGS="-arch x86_64 -arch arm64"
