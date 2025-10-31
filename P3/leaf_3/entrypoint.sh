#!/bin/sh

# Start the daemons in the background
/usr/lib/frr/zebra -d -F traditional -A 127.0.0.1 -s 90000
/usr/lib/frr/bgpd -d -F traditional -A 127.0.0.1
/usr/lib/frr/ospfd -d -F traditional -A 127.0.0.1
/usr/lib/frr/isisd -d -F traditional -A 127.0.0.1


# Wait a bit for all daemons to start
sleep 2


# Config the router, the bridge and the VXLAN
# (dev == device)
ip link add br0 type bridge
ip link set dev br0 up

ip link add name vxlan10 type vxlan id 10 dstport 4789

ip link set dev vxlan10 up
brctl addif br0 eth1
brctl addif br0 vxlan10

# Start a shell
exec sh
