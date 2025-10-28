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

ip addr add 10.1.1.2/24 dev eth0

# Create the vxlan and assign it to a group to enable multicast (as required by subject)
# Multicast means a packet entering will be sent to every member of the VXLAN, as opposed to a single target
# The destination port is set to 4789 as recommended in RFC
ip link add name vxlan10 type vxlan id 10 dev eth0 group 239.1.1.1 dstport 4789

ip addr add 20.1.1.2/24 dev vxlan10

# Link the bridge to the router's eth1 interface and to vxlan10
brctl addif br0 eth1
brctl addif br0 vxlan10


ip link set device vxlan10 up

# To summarise : 
# This router is part of a VXLAN. The hosts will connect on eth1 through a bridge from eth1 to vxlan10
# eth0 is linked to vxlan10 and any packet exiting will be part of this VXLAN
# That way, communication can enter any router in the VXLAN and exit through any other to reach the desired host

# Start a shell
exec sh
