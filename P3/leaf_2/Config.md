! Connected to leaf 1 (eth0) and host 1 (eth1)
hostname leaf-iaschnei-2
no ipv6 forwarding
!
! Configure eth0:
interface eth0
 ip address 10.1.1.2/30
 ip ospf area 0
!
! Configure loopback with an IP we can remember:
interface lo
 ip address 1.1.1.2/32
 ip ospf area 0
!
router bgp 1
 ! Set leaf 1 in the same group as this router
 neighbor 1.1.1.1 remote-as 1
 neighbor 1.1.1.1 update-source lo
 !
 address-family l2vpn evpn
  neighbor 1.1.1.1 activate
  advertise-all-vni
 exit-address-family
!
router ospf
!
