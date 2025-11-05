! Leaf 1 - Central leaf / route-reflector
hostname leaf-iaschnei-1
no ipv6 forwarding
!
! Underlay interfaces to other leaves
interface eth0
 ip address 10.1.1.1/30
 ip ospf area 0
!
interface eth1
 ip address 10.1.1.5/30
 ip ospf area 0
!
interface eth2
 ip address 10.1.1.9/30
 ip ospf area 0
!
! Loopback interface used as router ID and BGP source
interface lo
 ip address 1.1.1.1/32
 ip ospf area 0
!
! BGP configuration for EVPN
router bgp 1
 ! Create a group containing all the routers this router will talk to
 neighbor ibgp peer-group
 ! Tell this router that all the routers in the group are in the same area = can share infos
 neighbor ibgp remote-as 1
 ! Use the loopback address as the return address = connection stable even if other interfaces go down
 neighbor ibgp update-source lo
 ! Automatically add to the group any router with an IP in this range
 bgp listen range 1.1.1.0/29 peer-group ibgp
 !
 ! Enter evpn config
 address-family l2vpn evpn
  ! Activate info sharing
  neighbor ibgp activate
  ! Tell everyone that this router is the one reflecting routes to everyone
  neighbor ibgp route-reflector-client
  ! Tell everyone about the neighbors you found
  advertise-all-vni
 ! Exit evpn config
 exit-address-family
!
! Start the OSPF process
router ospf
!

