export LANG=ja_JP.UTF-8
export XMODIFIERS=@im=uim
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export WMPATH="/usr/local/bin/wmaker"

xmodmap ~/.Xmodmap
xset m 6 4

/usr/local/bin/pulseaudio -D
/usr/bin/xscreensaver-command -exit
/usr/bin/xscreensaver &
/usr/bin/uim-xim &
/usr/local/bin/wmsystemtray &
/home/sasai/local/bin/2chproxy.pl &

#exec twm
exec ${WMPATH}
