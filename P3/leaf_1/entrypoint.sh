#!/bin/sh

# Start all daemons using the main script instead of doing it manually like before (because using frr.conf requires to do it like that)
/usr/lib/frr/frrinit.sh start

# Wait a bit for all daemons to start
sleep 2

# Start a shell
exec sh
