#!/bin/bash

# Start zebra (-d = daemon instead of foreground, -F traditional = type of naming conventions to use, -A = bind to an address, -s 90000 = max number of fd zebra can use) Note : all of these options are shown in the subject's expected result
/usr/lib/frr/zebra -d -F traditional -A 127.0.0.1 -s 90000

# Start BGP, OSPF and IS-IS in the same way
/usr/lib/frr/bgpd -d -F traditional -A 127.0.0.1

/usr/lib/frr/ospfd -d -F traditional -A 127.0.0.1

/usr/lib/frr/isisd -d -F traditional -A 127.0.0.1

# Default interactive console for GNS3 to use with frr suite
exec vtysh
