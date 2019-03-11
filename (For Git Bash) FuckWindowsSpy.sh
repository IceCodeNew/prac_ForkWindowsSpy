#!/bin/bash

read -rp "Where to download the rules file? "
REPLY=${REPLY//\\/\/}
root_letter=`echo ${REPLY:0:1} | tr '[:upper:]' '[:lower:]'`
REPLY='/'$root_letter'/'${REPLY:3}
echo "The specified dir is: $REPLY"
unset root_letter
cd $REPLY

rm spy.txt extra.txt
curl -O https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/dnscrypt/extra.txt
curl -O https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/dnscrypt/spy.txt

winpty "$(which python)" fws.py
