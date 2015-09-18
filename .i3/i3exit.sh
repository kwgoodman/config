#!/bin/sh

case "$1" in
    lock)
        i3lock -c000000
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        # sleep is to avoid race condition with suspend
        i3lock -c000000 && sleep 1 && \
        dbus-send --system --print-reply --dest="org.freedesktop.UPower" \
        /org/freedesktop/UPower org.freedesktop.UPower.Suspend
        ;;
    reboot)
        dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" \
        /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart
        ;;
    shutdown)
        dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" \
        /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|reboot|shutdown}"
        exit 2
esac
