#!/bin/bash

################ add default rule to openvswitch $BR ######

source env.conf

# delete old rule
ovs-ofctl del-flows ${BR}

# add default rule
ovs-ofctl add-flow ${BR} actions=NORMAL



