https://net.cybbh.io/public/networking/latest/index.html
http://10.50.20.162:8000/
JB Info
    Student#: student19
    Command: ssh student@10.50.23.2 -X
    Password: password

    net1_comrade19:privet19
    
# Network Fundamentails
bit = 1
nibble = 4
byte = 8
half word =16
word = 32
double word =33

base 2
base 10
base 16
base 64

## physical layer
hardware

## date link
mac or llc

ether type
0x0800 IPV4
0x0806 ARP
0x86DD IPV6
0x8100 VLAN tag
## Network layer 

## Transport Layer
Tcp
Udp

# Packet Creation and Socket Programming
User Space Sockets
    Stream Sockets
    Datagram Sockets
Kernel Space Sockets
    Raw Sockets

import socket
  s = socket.socket(socket.FAMILY, socket.TYPE, socket.PROTOCOL)
family constants should be: AF_INET (default), AF_INET6, AF_UNIX
type constants should be: SOCK_STREAM (default), SOCK_DGRAM, SOCK_RAW
proto constants should be: 0 (default), IPPROTO_RAW

# network scanning
nmap [Options] [Target IP/ Subnet]
nc [Options] [Target IP] [Target Port]
nmap -A -T4 --min-rate 10000 -vvvv 10.50.30.212 # TCP port scan
nc 172.16.140.33 2086 #banner grab
wget -r ftp://10.50.30.212 #get content from a port 
eom web.png #opens a png
ss -ntulp
sudo nmap -sU -T4 172.16.182.110 -p 2000-2999 #search the system for udp ports
nc -zuvnw1 172.16.140.33 2000-2200 #search the system for udp ports
nc 172.16.140.33 2086 -u #banner grab udp port
rtr>>>  show config 
        sudo ifconfig 
        ip addr
        ip nei
# ssh tunneling
ssh <user>@<ip> -L <port>:<tgt ip>:<tgt port>
ip for alt ssh port -p 
ihost>>> ssh toby@toby-host -L 2000:127.0.0.1:80 -NT 
wget -r 127.0.0.1:2000
ssh -p 2000 mike@127.0.0.1
ihost>>> ssh toby@loby-host -L 2000:<john>:1111 -NT
ihost>>> ssh -p 2000 john@172.0.0.1 -L 2001:<carlton>:23 -NT
telnet 127.0.0.1 2001

chost>>> ssh john@john-host -p 1111 -R 2999: 127.0.0.1:3443 -NT
ihost>>> ssh -p 2000 john@127.0.0.1
jhost>>> ssh -p 2999 carlton@127.0.0.1
ihost>>> ssh -p 2000 john@127.0.0.1 -L 2002:127.0.0.1:2999 -nt
ihost>>> ssh -p 2002 carlton@127.0.0.1

ihost>>> ssh -p 2002 carlton@127.0.0.1 -D 9050 -NT
ihost>>> proxychains ./scan or nmap or wget or ftp


# Network Analysis
p0f
wireshark 
tcpdump

# Filtering 
sudo iptables -L
sudo iptables -t nat -L
sudo iptables -t mangle -L
sudo iptables -F (flushes the box)
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT
sudo iptables -P INPUT DROP 
sudo iptables -A INPUT -p tcp -m multiport --ports 6010,6011,6012 -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m multiport --ports 6010,6011,6012 -j ACCEPT
sudo iptables -A INPUT -P tcp --sport 22 -j ACCEPT
sudo iptables -A OUTPUT -P tcp --dport 22 -j ACCEPT
sudo iptables -L -n --Line-Numbers
sudo iptables -A INPUT -P icmp -j ACCEPT

sudo nft add chain ip Wev OUTPUT {type fillter hook uptpts}
sudo nft add chain ip Wev INPUT { type filter hook input priority 0 \: policy accept \: }
sudo nft flush ruleset
sudo nft list ruleset

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 1.1.1.1 (change sip)
iptables -t nat -A POSTROUTING -p tcp -o eth0 -j SNAT --to 1.1.1.1:9001 (change sip and sport)
iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 10.0.0.1 (change dip) 
iptables -t nat -A PREROUTING -p tcp -i eth0 -j DNAT --to 10.0.0.1:8080 (change dip and dport)
nft add table ip NAT
nft add chain ip NAT PREROUTING {type nat hook prerouting priority 0 \; }
nft add chain ip NAT POSTROUTING {type nat hook postrouting priority 100 \; }
nft add rule ip NAT POSTROUTING ip saddr 10.1.0.2 oif eth0 snat 144.15.60.11
nft add rule ip NAT PREROUTING iif eth0 tcp dport { 80, 443 } dnat 10.1.0.3
nft add rule ip NAT POSTROUTING ip saddr 10.1.0.0/24 oif eth0 masquerade
nft add rule ip NAT PREROUTING tcp dport 80 redirect to 8080


## Network based

ps -elf | grep snort | grep -v grep
ls /etc/snort
cat /etc/snort/snort.conf

