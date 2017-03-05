#!/usr/bin/env bash

source env.conf

echo "#################################"
echo "Bridge information"
sudo ovs-vsctl show

echo "\n\n#################################"
echo "flow information"
sudo ovs-ofctl dump-flows ${BR}


echo "\n\n#################################"
echo "Information table"
sudo ovs-ofctl show ${BR}



#ovs-appctl fdb/show ${BR}
# show sflow
# sudo ovs-vsctl list sflow


################ usefull command to debug sFlowTrend

#ovs-vsctl list sflow
# tcpdump -ni eth1 udp port 6343