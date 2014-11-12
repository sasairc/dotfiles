export LANG=ja_JP.UTF-8
export XMODIFIERS=@im=uim
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim

xmodmap .Xmodmap
xrdb -merge ~/.Xresources
/usr/bin/xscreensaver-command -exit
/usr/local/bin/wmsystemtray &

uim-xim &
pulseaudio -D
/usr/bin/xscreensaver &

#exec twm
exec wmaker
