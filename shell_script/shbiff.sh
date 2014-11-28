# cdbiffのシェルスクリプト版
# 本家　http://0xcc.net/cdbiff/

#!/bin/bash

PROGNAME="shbiff.sh"

MAILBOX="${HOME}/Mail/inbox"
COMMAND="eject"
INTERVAL="15"

function shdiff_main() {
	echo -e "MAILBOX = ${MAILBOX}\nCOMMAND= ${COMMAND}\nINTERVAL = ${INTERVAL}"
	while :
	do
		last=`ls --full-time ${MAILBOX} | awk '{print $6"-"$7}'`
		sleep ${INTERVAL}
		state=`ls --full-time ${MAILBOX} | awk '{print $6"-"$7}'`

		if [ "${last}" != "${state}" ]; then
			echo "${PROGNAME}: Call event."
			${COMMAND}
		fi
	done
}

function help_page() {
	echo -e "Usage: ${PROGNAME} [-f file] [-c command] [-i interval]\n\n\
-f, --file\tMonitored filename. [DEFAULT= ${MAILBOX}]\n\
-c, --command\tCalled command for event. [DEFAULT = ${COMMAND}]\n\
-i, --interval\tInterval. [DEFAULT = ${INTERVAL}]\n\
-h, --help\tThis help page."
}

for OPT in "$@"
do
	case "${OPT}" in
		'-h'|'--help')
			help_page
			exit 0
			;;
		'-f'|'--file')
			if [[ -z "$?" ]] || [[ "$?" =~ ^-+ ]]; then
				echo "${PROGNAME}: option requires an argument -- $1" 1>&2
				exit 1
			fi
			if [ ! -e "$2" ]; then
				echo "${PROGNAME}: File not found. $2" 1>&2
				exit 2
			fi
			MAILBOX="$2"
			shift 2
			;;
		'-c'|'--command')
			if [[ -z "$?" ]] || [[ "$?" =~ ^-+ ]]; then
				echo "${PROGNAME}: option requires an argument -- $1" 1>&2
				exit 1
			fi
			COMMAND="$2"
			shift 2
			;;
		'-i'|'--interval')
			if [[ -z "$?" ]] || [[ "$?" =~ ^-+ ]]; then
				echo "${PROGNAME}: option requires an argument -- $1" 1>&2
				exit 1
			fi
			if ! expr "$2" : '[0-9]*' > /dev/null; then
				echo "${PROGNAME}: not integer -- ${2}" 1>&2
				exit 1
			fi
			INTERVAL="$2"
			shift 2
			;;
		-*)
			echo "${PROGNAME}: illegal option -- '$(ecjp $1 | sed 's/^-*//')'" 1>&2
			exit 2
			;;
		'-'|'--')
			shift 1
			param+=("$@")
			break
			;;
		*)
			if [[ ! -z "$1" ]] && [[ ! "$1" =~ ^-+ ]]; then
				param+=("$1")
				shift 1
			fi
			;;
	esac
done

shdiff_main
