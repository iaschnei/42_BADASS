#!/bin/sh

# Make sure everything is properly setup by GNS3
sleep 2

# Set a custom IP for interface eth1 to connect easily
ip link set eth0 up
ip addr add 30.1.1.2/24 dev eth0

exec sh
