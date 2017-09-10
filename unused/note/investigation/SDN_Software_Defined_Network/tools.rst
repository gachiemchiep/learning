Tools for developing network
=================================

`Mininet : Network emulator <http://mininet.org/>`_

`Mininet course <https://github.com/mininet/mininet/wiki/SIGCOMM-2014-Tutorial%3A-Teaching-Computer-Networking-with-Mininet>`_

`Open vSwitch : Virtual; switch <http://www.openvswitch.org/>`_

` sFlowTrend : Open vSwitch network capture <www.inmon.com/products/sFlowTrend.php>`_

`OpenDayLight : 2nd generation network controller <https://www.opendaylight.org>`_

`OpenDayLight: Eclipse (Oomph) support <https://wiki.opendaylight.org/view/GettingStarted:_Eclipse>`_

`Docker : Container manager (use to create more real network) <www.docker.com>`_

`pipework : utilities to bind Docker instance with Open vSwitch  <https://github.com/jpetazzo/pipework>`_

Setup and Installation
----------------------------

.. code-block:: html

    sudo apt-get install mininet openvswitch-switch

    # see below link for a good installation
    # https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04

    # pipework
    sudo bash -c "curl https://raw.githubusercontent.com/jpetazzo/pipework/master/pipework > /usr/local/bin/pipework"

sFlowTrend
^^^^^^^^^^^^^^^

`Run the isntaller from <http://www.inmon.com/products/sFlowTrend.php>`_

.. code-block:: html

    # start sflowtrend server
    sudo /etc/init.d/sflowtrend-server start

    # connect to the server using java client
    http://localhost:8087/sflowtrend/?tab=dashboard