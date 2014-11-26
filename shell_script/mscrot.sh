#!/usr/bin/zsh

PROGNAME="mscrot.sh"
FILETYPE=".png"
CAPTURE="/usr/bin/scrot"
SLEEP_S="/bin/sleep"
SLEEP_U="/usr/bin/sleepenh" # Required usleep or sleepenh

l=0
dflag=0
sflag=0
uflag=0


help_page() {
    echo -e "Usage: ${PROGNAME} [-d directory] [-s second | -u millisecond]\n"
}

switchdir() {
    if [ ${dflag} = 1 ]; then
        if [ ! -d "${dval}" ]; then
            mkdir "${dval}" 
        fi
        cd "${dval}"
    fi
    return
}

screenshot_sec() {
    while :
    do
        ${CAPTURE} "`printf %03d ${l}`${FILETYPE}"
        ${SLEEP_S} ${sval}
        ((l++))
    done

    exit 0
}

screenshot_msec() {
    while :
    do
        ${CAPTURE} "`printf %03d ${l}`${FILETYPE}"
        ${SLEEP_U} ${uval}
        ((l++))
    done

    exit 0
}


while getopts 'd:s:u:h' OPTION
do
    case "${OPTION}" in
    'd')
        dflag=1
        dval="${OPTARG}"
        switchdir
        ;;
    's')
        sflag=1
        ((sval = OPTARG))
        screenshot_sec
        ;;
    'u')
        uflag=1
        ((uval = OPTARG))
        screenshot_msec
        ;;
    'h')
        help_page
        exit 0
        ;;
    '?')    
        echo "${PROGNAME}: Invalid option -- '$(echo $1 | sed 's/^-*//')'" 1>&2
        exit 1
        ;;
    esac
done

shift $(($OPTIND - 1 ))
