#!/bin/bash

######### remove all the old nodes #########

source env.conf

# stop and remove docker instances
for count in {1..5}; do
    docker stop debian_${count}
    docker rm debian_${count}
done

# stop the switch from sending packages
# sudo ovs-vsctl remove bridge ovsbr1 sflow $SFLOWUUID
# remove sFlowTrend configuration
sudo ovs-vsctl -- clear Bridge ${BR} sflow

# remove old bridge flows ruke
ovs-ofctl del-flows ${BR}
# delete bridge
ovs-vsctl del-br ${BR}
