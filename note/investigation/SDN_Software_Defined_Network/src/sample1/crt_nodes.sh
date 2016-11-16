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
SFLOWUUID=$( sudo ovs-vsctl -- --id=@sflow create sflow agent=${AGENT_IP} \
target=\"${COLLECTOR_IP}:${COLLECTOR_PORT}\" header=${HEADER_BYTES} \
sampling=${SAMPLING_N} polling=${POLLING_SECS} -- set bridge ${BR} sflow=@sflow )

echo "SFLOWUUID=${SFLOWUUID}" >> tmp.txt

# add OpenDayLight controller
# Controller will be ovs-br0 tcp:173.16.12.1:6633”
ovs-vsctl set-controller $BR tcp:127.0.0.1:6653
