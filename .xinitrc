export LANG=ja_JP.UTF-8
export XMODIFIERS=@im=uim
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export WMPATH="/usr/local/bin/wmaker"
export LD_LIBRARY_PATH="/usr/local/lib:/lib:/lib64:/usr/lib:/usr/lib64:/home/sasai/local/lib"

xmodmap ~/.Xmodmap
xset m 20/10 4
xset r rate 192 32

/usr/bin/xscreensaver-command -exit
/usr/bin/xscreensaver &
/usr/bin/uim-xim &
/usr/local/bin/pulseaudio -D
/usr/local/bin/wmsystemtray &

#exec twm
exec ${WMPATH}
