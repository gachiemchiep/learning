#!/bin/bash

######### create openvswitch bridge $BR ##########

source env.conf

sudo ovs-vsctl add-br ${BR}

# configuration
sudo ifconfig ${BR} 173.16.1.1 netmask 255.255.255.0 up

# create 5 instances (debian_1, debian_2) from /dev/debian
# which ip as (173.16.1.2, ... )
for count in {1..5}; do

    # run instance without default networking
    docker run -dit --net=none --name debian_${count} dev/debian

    # use pipework to bind to $BR
#    sudo pipework ${BR} debian_${count} 173.16.1.$(( count + 1 ))/24

    # use ovs-docker to bind to $BR
    ovs-docker add-port ${BR} eth1 debian_${count} --ipaddress=173.16.1.$(( count + 1 ))/24

done

# add sFlowTrend configuration
SFLOWUUID=$( sudo ovs-vsctl -- --id=@sflow create sflow agent=${AGENT}  \
target=\"${COLLECTOR_IP}:${COLLECTOR_PORT}\" header=${HEADER} \
sampling=${SAMPLING} polling=${POLLING} \
-- set bridge ${BR} sflow=@sflow )

echo "SFLOWUUID=${SFLOWUUID}" >> tmp.txt
