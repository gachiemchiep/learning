#!/bin/bash

################ add default rule to openvswitch $BR ######

source env.conf

# delete old rule
ovs-ofctl del-flows ${BR}

# add default rule
ovs-ofctl add-flow ${BR} actions=NORMAL

# see http://manpages.ubuntu.com/manpages/precise/man8/ovs-ofctl.8.html
# for a full list of options

# add specified rule for icmp request packets
ovs-ofctl add-flow ${BR} "table=0, priority=99, icmp,nw_dst=${NODE_IPS[4]}/24 ,actions=resubmit(,1)"
exit
ovs-ofctl add-flow ${BR} "table=0, priority=99, nw_src=${NODE_IPS[0]}, nw_dst=${NODE_IPS[4]}, icmp ,actions=resubmit(,1)"
exit
# rule is as follow
# from debian_1 ping debian_5
# icmp packets go   as : debian_1 -> debian_2 -> debian_3 -> debian_4 -> debian_5
# icmp packets back as : debian_5 -> debian_4 -> debian_3 -> debian_2 debian_1

ovs-ofctl add-flow ${BR} "table=1, priority=99, in_port=1, actions=output:2"
ovs-ofctl add-flow ${BR} "table=1, priority=99, in_port=2, actions=output:3"
ovs-ofctl add-flow ${BR} "table=1, priority=99, in_port=3, actions=output:4"
ovs-ofctl add-flow ${BR} "table=1, priority=99, in_port=4, actions=output:5"

# add specified rule for icmp reply packets
ovs-ofctl add-flow ${BR} "table=0, priority=99, nw_src=${NODE_IPS[4]}, nw_dst=${NODE_IPS[0]}, icmp ,actions=resubmit(,2)"

ovs-ofctl add-flow ${BR} "table=2, priority=99, in_port=5, actions=output:4"
ovs-ofctl add-flow ${BR} "table=2, priority=99, in_port=4, actions=output:3"
ovs-ofctl add-flow ${BR} "table=2, priority=99, in_port=3, actions=output:2"
ovs-ofctl add-flow ${BR} "table=2, priority=99, in_port=2, actions=output:1"




























