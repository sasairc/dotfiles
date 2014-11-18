# Open JTalk用の簡易的なラッパ
#!/bin/bash

PROGNAME="openjtalk"

OJTALK_EXOPTION="-s 48000 -a 0.58 -u 0.0 -jm 0.7 -jf 0.5 -l -p 240"

VOICE_DIR=/usr/local/share/hts_voice/mei
VOICE_NORMAL=mei_normal.htsvoice
VOICE_HAPPY=mei_happy.htsvoice
VOICE_SAD=mei_sad.htsvoice
VOICE_ANGRY=mei_angry.htsvoice
VOICE_BASHFUL=mei_bashful.htsvoice

DIC=/usr/local/dic
TEMPFILE=/tmp/open_jtalk_tmp_voice.wav

PLAYER="/usr/local/bin/cvlc"
PLAYER_OPTIONS="-q --no-repeat --play-and-exit"

function normal() {
        open_jtalk ${OJTALK_EXOPTIONS} \
                -m ${VOICE_DIR}/${VOICE_NORMAL} \
                -x ${DIC} \
                -ow ${TEMPFILE} \
                ${ARG_A} &&

        ${PLAYER} ${PLAYER_OPTIONS} ${TEMPFILE}

        return 0;
}

function happy() {
        open_jtalk ${OJTALK_EXOPTIONS} \
                -m ${VOICE_DIR}/${VOICE_HAPPY} \
                -x ${DIC} \
                -ow ${TEMPFILE} \
                ${ARG_A} &&

        ${PLAYER} ${PLAYER_OPTIONS} ${TEMPFILE}

        return 0;
}

function sad() {
        open_jtalk ${OJTALK_EXOPTIONS} \
                -m ${VOICE_DIR}/${VOICE_SAD} \
                -x ${DIC} \
                -ow ${TEMPFILE} \
                ${ARG_A} &&

        ${PLAYER} ${PLAYER_OPTIONS} ${TEMPFILE}

        return 0;
}

function angry() {
        open_jtalk ${OJTALK_EXOPTIONS} \
                -m ${VOICE_DIR}/${VOICE_ANGRY} \
                -x ${DIC} \
                -ow ${TEMPFILE} \
                ${ARG_A} &&

        ${PLAYER} ${PLAYER_OPTIONS} ${TEMPFILE}

        return 0;
}

function bashful() {
        open_jtalk ${OJTALK_EXOPTIONS} \
                -m ${VOICE_DIR}/${VOICE_BASHFUL} \
                -x ${DIC} \
                -ow ${TEMPFILE} \
                ${ARG_A} &&

        ${PLAYER} ${PLAYER_OPTIONS} ${TEMPFILE}

        return 0;
}


if [ -e ${TEMPFILE} ]; then
    rm ${TEMPFILE}
fi


for OPT in "$@"
do
    case "${OPT}" in
        '-n'|'--normal' )
            if [[ -z "$?" ]] || [[ "$?" =~ ^-+ ]]; then
                echo "${PROGNAME}: option requires an argument -- $1" 1>&2
                exit 1;
            fi
            ARG_A="$2"
            shift 2
            normal
            ;;
        '-h'|'--happy' )
            if [[ -z "$?" ]] || [[ "$?" =~ ^-+ ]]; then
                echo "${PROGNAME}: option requires an argument -- $1" 1>&2
                exit 1
            fi
            ARG_A="$2"
            shift 2
            happy
            ;;
        '-s'|'--sad' )
            if [[ -z "$?" ]] || [[ "$?" =~ ^-+ ]]; then
                echo "${PROGNAME}: option requires an argument -- $1" 1>&2
                exit 1
            fi
            ARG_A="$2"
            shift 2
            sad
            ;;
        '-a'|'--angry' )
            if [[ -z "$?" ]] || [[ "$?" =~ ^-+ ]]; then
                echo "${PROGNAME}: option requires an argument -- $1" 1>&2
                exit 1
            fi
            ARG_A="$2"
            shift 2
            angry
            ;;
        '-b'|'--bashful' )
            if [[ -z "$?" ]] || [[ "$?" =~ ^-+ ]]; then
                echo "${PROGNAME}: option requires an argument -- $1" 1>&2
                exit 1
            fi
            ARG_A="$2"
            shift 2
            bashful
            ;;
        -*)
            echo "${PROGNAME}: illegal option -- '$(echo $1 | sed 's/^-*//')'" 1>&2
            exit 2
            ;;

        *)
            if [[ ! -z "$1" ]] && [[ ! "$1" =~ ^-+ ]]; then
                ARG_A+=("$1")
                shift 1
                normal
            fi
            ;;
    esac
done
