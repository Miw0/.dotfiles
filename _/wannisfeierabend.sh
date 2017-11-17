#!/bin/bash
# via crontab -e: 1 14-18 * * 1-5 $HOME/wannisfeierabend.sh

environs=`pidof dbus-daemon | tr ' ' '\n' | awk '{printf "/proc/%s/environ ", $1}'`
export DBUS_SESSION_BUS_ADDRESS=`cat $environs 2>/dev/null | tr '\0' '\n' | grep DBUS_SESSION_BUS_ADDRESS | cut -d '=' -f2-`
export DISPLAY=:0

notify-send -i stock_smiley-22 -t 10000 "Wann is Feierabend?" "$(php /home/mw/wannisfeierabend.php)"
