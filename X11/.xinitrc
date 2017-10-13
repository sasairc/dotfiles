export LANG=ja_JP.UTF-8
export XMODIFIERS=@im=uim
export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export WMPATH="/usr/local/bin/wmaker"
export GST_PLUGIN_PATH="/usr/local/lib/gstreamer-0.10:/usr/lib/gstreamer-0.10"
# use vlc/seamonkey ffmpeg-2.8
export LD_LIBRARY_PATH="${HOME}/local/lib:/usr/local/lib:/lib:/lib64:/usr/lib:/usr/lib64"

xmodmap ~/.Xmodmap
xset m 6 4
xset r rate 192 32

/usr/local/bin/pulseaudio --start
/usr/bin/xscreensaver-command -exit
/usr/bin/xscreensaver &
/usr/bin/uim-xim &
/usr/local/bin/wmsystemtray &
/usr/local/bin/urxvt -geometry 228x72+1920+0 &
# /usr/games/xsnow -nosanta &
perl /home/sasai/local/bin/2chproxy.pl &

#exec twm
exec ${WMPATH}
