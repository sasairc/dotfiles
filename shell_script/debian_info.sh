#!/bin/zsh

C_RED='\033[31m'
C_CLR='\033[0m'

echo ""
echo "$C_RED         _,met$$$$$gg.$C_CLR  \tOS: Debian GNU/Linux `cat /etc/debian_version`"
echo "$C_RED      ,g\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$P.$C_CLR\tUser: `whoami`"
echo "$C_RED   ,g\$\$P\"\"       \"\"\"Y\$\$.\".$C_CLR"
echo "$C_RED  ,$$P'            \`\$\$\$.$C_CLR\tHostname: `hostname`"
echo "$C_RED  ',\$\$P      ,ggs.     \`\$\$b:$C_CLR\tKernel: `uname -r`"
echo "$C_RED d\$\$\'     ,$P\"\'   .    \$\$$C_CLR\tUptime: `uptime| cut -d " " -f 4-5 | sed -e 's/,$//g'`"
echo "$C_RED \$\$P      d$\'     ,    \$\$P$C_CLR\tWindow Mmanager: $WMPATH"
echo "$C_RED \$\$:      \$\$.   -    ,d\$\$\'$C_CLR\tShell: $SHELL"
echo "$C_RED  \$\$;      Y\$b._   _,d\$P\'$C_CLR\tTerminal: $TERM"
echo "$C_RED  Y\$\$.    \`.\`\"Y\$\$\$\$P\"\'$C_CLR\t\tPackages: `dpkg --get-selections | wc -l`"
echo "$C_RED    \`\$\$b      \"-.__$C_CLR\t\tProcessor Type: `head -n 5  /proc/cpuinfo | grep name | cut -d " " -f 3-6`"
echo "$C_RED    \`Y\$\$b $C_CLR\t\t\tProcessor Frequency: `head -n 25 /proc/cpuinfo | grep MHz | cut -d ":" -f 2` MHz"
echo "$C_RED     \`Y\$\$. $C_CLR\t\t\tTotal Memory: `cat /proc/meminfo | grep MemTotal | cut -d " " -f 9` KB"
echo "$C_RED       \`\$\$b. $C_CLR"
echo "$C_RED        \`Y\$\$b. $C_CLR"
echo "$C_RED         \`\"Y\$b._ $C_CLR"
echo "$C_RED             \`\"\"\"\" $C_CLR"

if [ "$1" = "-h" ]; then
	read I
fi

exit 0
