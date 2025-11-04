hostname leaf-iaschnei-2
no ipv6 forwarding
!
! Configure eth0 :
interface eth0
 ip address 10.1.1.2/30
 ip ospf area 0
!
! Configure loopback :
interface lo
 ip address 1.1.1.2/32
 ip ospf area 0
!
! Configure router :
router bgp 1
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
