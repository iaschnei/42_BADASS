#!/bin/sh

# Start all daemons using the main script instead of doing it manually like before (because using frr.conf requires to do it like that)
/usr/lib/frr/frrinit.sh start

# Wait a bit for all daemons to start
sleep 2


# Config the router, the bridge and the VXLAN
# (dev == device)
ip link add br0 type bridge
ip link set dev br0 up

# Create the vxlan, we don't need to set a group or a target to the vxlan since we use a different method in p3
# The destination port is set to 4789 as recommended in RFC
ip link add name vxlan10 type vxlan id 10 dstport 4789

# Link the bridge to the router's eth0 interface and to vxlan10
brctl addif br0 eth1
brctl addif br0 vxlan10

# Note : IP addresses are defined by frr.conf

# Start a shell
exec sh
