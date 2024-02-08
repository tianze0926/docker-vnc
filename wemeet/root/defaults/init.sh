#!/bin/sh

sudo chown $PUID:$PGID /run/user/$PUID

unset PULSE_RUNTIME_PATH

exec dbus-run-session wemeet
