#!/bin/sh

# Start the daemons in the background
/usr/lib/frr/zebra -d -F traditional -A 127.0.0.1 -s 90000
sleep 2
/usr/lib/frr/bgpd -d -F traditional -A 127.0.0.1
/usr/lib/frr/ospfd -d -F traditional -A 127.0.0.1
/usr/lib/frr/isisd -d -F traditional -A 127.0.0.1


# Wait a bit for all daemons to start
sleep 2

# Start a shell (for easy console access)
exec sh
