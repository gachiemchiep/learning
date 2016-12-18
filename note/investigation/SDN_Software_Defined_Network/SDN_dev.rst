SDN Development Environment
=============================

OpenFlow
OpenSswitch
Mininet

Controller
    1st generation : POX
    2nd generation : OpenDaylight

Sample
------

sample1 : simple openvswitch raw flow table with OpenDayLight controller

.. code-block:: html

    run crt_nodes.sh
    run add_rule_default.sh

    # start karaf
    ./distribution-karaf-0.3.0-Lithium/bin/karaf

    # add feature
    # feature:install odl-dlux-all odl-restconf-all odl-l2switch-switch

    # restart karaf
    shutdown -f

    # run test_rule_default.py  (from 1 node ping anothers)

    # then access http://192.168.150.54:8080/index.html#/topology
    # or access sflowtrend http://localhost:8087
    # to view 5 nodes are connected by a hub

TODO : add images





