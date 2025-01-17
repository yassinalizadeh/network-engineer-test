/interface bridge
add name=loopback0
/interface ethernet
set [ find default-name=ether1 ] name=Internet
set [ find default-name=ether6 ] name=ether6-LocalHost
/routing bgp instance
set default as=65537 router-id=10.0.0.3
/ip address
add address=198.51.100.5/30 interface=Internet network=198.51.100.4
add address=10.0.0.3 interface=loopback0 network=10.0.0.3
/ip dhcp-client
add add-default-route=no disabled=no interface=ether6-LocalHost use-peer-dns=no
/ip route
add distance=1 dst-address=10.0.0.1/32 gateway=198.51.100.6
/routing bgp peer
add in-filter=bgp-in multihop=yes name=Internet remote-address=10.0.0.1 remote-as=65538 ttl=2 update-source=loopback0
/routing filter
add action=accept chain=bgp-in prefix=0.0.0.0 prefix-length=0
add action=discard chain=bgp-in
/system identity
set name=ISP-B
