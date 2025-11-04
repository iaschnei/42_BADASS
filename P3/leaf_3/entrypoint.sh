#!/bin/sh

# Start the daemons
/usr/lib/frr/frrinit.sh start


# Wait a bit for all daemons to start
sleep 2

# Start a shell
exec sh
