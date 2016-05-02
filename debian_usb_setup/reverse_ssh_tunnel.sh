#!/bin/sh
COMMAND="ssh -N -f -R 4242:localhost:2424 tyler@alexon.duckdns.org"
pgrep -f -x "$COMMAND" > /dev/null 2>&1 || $COMMAND