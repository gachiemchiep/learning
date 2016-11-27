FROM debian

MAINTAINER vugiatruong version: 0.1

RUN apt-get update 
RUN apt-get install -y nmap net-tools iptables



# RUN iptables -t nat -A PREROUTING -p icmp --dport 80 --src $IP1 --destination $IP2  -j DNAT --to-destination 10.0.4.2:80

EXPOSE 80


