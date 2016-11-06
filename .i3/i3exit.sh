#!/bin/sh

case "$1" in
    lock)
        i3lock -c000000
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        i3lock -c000000 && sleep 1 && \
        dbus-send --system --print-reply --dest=org.freedesktop.login1 \
        /org/freedesktop/login1 "org.freedesktop.login1.Manager.Suspend" \
        boolean:true
        ;;
    reboot)
        dbus-send --system --print-reply --dest=org.freedesktop.login1 \
        /org/freedesktop/login1 "org.freedesktop.login1.Manager.Reboot" \
        boolean:true
        ;;
    shutdown)
        dbus-send --system --print-reply --dest=org.freedesktop.login1 \
        /org/freedesktop/login1 "org.freedesktop.login1.Manager.PowerOff" \
        boolean:true
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|reboot|shutdown}"
        exit 2
esac
