/interface ethernet
set [ find default-name=ether1 ] name=Customer-A
set [ find default-name=ether2 ] name=Customer-B
set [ find default-name=ether6 ] name=ether6-LocalHost
/interface vrrp
add interface=Customer-A name=vrrp1 priority=254
add interface=Customer-B name=vrrp2 vrid=2
/ip settings
set rp-filter=loose
/ip address
add address=10.10.1.2/24 interface=Customer-A network=10.10.1.0
add address=10.20.1.2/24 interface=Customer-B network=10.20.1.0
add address=10.10.1.1 interface=vrrp1 network=10.10.1.1
add address=10.20.1.1 interface=vrrp2 network=10.10.1.1
/ip dhcp-client
add add-default-route=no disabled=no interface=ether6-LocalHost use-peer-dns=no
/system identity
set name=Building-A
