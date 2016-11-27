docker build -t dev/debian_2 .

source ../env.conf

# add iptables rules
for IP in ${NODE_IPS[@]}; do
  docker run -t -i --privileged dev/debian_2 iptables -t nat -A PREROUTING --destination $IP  -j DNAT --to-destination $IP
done

