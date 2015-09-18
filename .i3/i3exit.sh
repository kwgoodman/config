#!/bin/sh

case "$1" in
    lock)
        i3lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
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
