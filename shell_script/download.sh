#!/usr/bin/zsh

DOWNLOADER=wget

help_page() {
	echo "Usage: download.sh [-b beam] [-r referer ] pages utl"
	echo ""
	echo "-b,\t\t連番であるファイル名の桁数を指定します。規定値では3桁です。"
	echo "-r,\t\tリファラとして送るURLを指定します。"
	echo "EXTNAME\t\tファイル名の接頭語を指定します。(例 hogehoge-000.jpg であれば EXTNAME=hogehoge)"
}


bflag=
rflag=0
bval=3

while getopts 'b:r:h' OPTION
do
	case $OPTION in
	"b")
		bflag=1
		bval="$OPTARG"
		;;
	"r")
		rflag=1
		rval="$OPTARG"
		;;
	"h")
		help_page
		exit 0
		;;
	"?")
		echo "不正なオプションです: $OPTARG" >&2
		echo "Usage: download.sh [-a beam] [-r referer] pages url" >&2
		exit 2
		;;
	esac
done

shift $(($OPTIND - 1))

if [ $rflag = 1 ]; then
	for ((count = 0; count <= $1; count++))
	do
		$DOWNLOADER --referer="$rval" $2/$EXTNAME`printf %0"$bval"d $count`.jpg
		sleep 1
	done
else
	for ((count = 0; count <= $1; count++))
	do
		$DOWNLOADER $2/$EXTNAME`printf %0"$bval"d $count`.jpg
		sleep 1
	done
fi
