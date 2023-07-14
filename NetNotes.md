https://net.cybbh.io/public/networking/latest/index.html
http://10.50.20.162:8000/
JB Info
    Student#: student19
    Command: ssh student@10.50.23.2 -X
    Password: password
    
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
emo web.png #opens a png
ss -ntulp
sudo nmap -sU -T4 172.16.182.110 -p 2000-2999 #search the system for udp ports
nc -zuvnw1 172.16.140.33 2000-2200 #search the system for udp ports
nc 172.16.140.33 2086 -u #banner grab udp port

# ssh tunneling

rtr>>>  show config 
        sudo ifconfig 
        ip addr
        ip nei
