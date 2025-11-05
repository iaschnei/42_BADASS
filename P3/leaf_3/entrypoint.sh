#!/bin/sh

# Start the daemons in the background
/usr/lib/frr/zebra -d -F traditional -A 127.0.0.1 -s 90000
sleep 2
/usr/lib/frr/bgpd -d -F traditional -A 127.0.0.1
/usr/lib/frr/ospfd -d -F traditional -A 127.0.0.1
/usr/lib/frr/isisd -d -F traditional -A 127.0.0.1

# Wait a bit for all daemons to start
sleep 2

# Config the bridge and the VXLAN
# (dev == device)
ip link add br0 type bridge
ip link set dev br0 up

# Create the vxlan, specify the loopback address of the router to make sure it uses this interface
# The destination port is set to 4789 as recommended in RFC
ip link add name vxlan10 type vxlan id 10 dstport 4789 local 1.1.1.3
ip link set dev vxlan10 up

# Link the bridge to the router's eth0 interface (the one connected to the host) and to vxlan10
brctl addif br0 vxlan10
brctl addif br0 eth0

# Note : Ip addresses are now setup by the config we copy in vtysh config mode

# Start a shell (for easy console access)
exec sh
