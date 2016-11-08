SDN Development Environment
=============================

OpenFlow
OpenSswitch
Mininet

Controller
    1st generation : POX
    2nd generation : OpenDaylight

Wireshark remote capture
-----------------------------

.. code-block::

    # Create a named pipe:
    mkfifo /tmp/remote
    # Start wireshark from the command line
    wireshark -k -i /tmp/remote
    # Run tcpdump over ssh on your remote machine and redirect the packets to the named pipe
    ssh root@192.168.150.55 "/usr/sbin/tcpdump -s 0 -U -n -w - -i enp0s3 not port 22" > /tmp/remote

Open vSwitch tutorial
-------------------------

`Open vSwitch<https://www.nanog.org/meetings/nanog57/presentations/Monday/mon.tutorial.SmallWallace.OpenFlow.24.pdf>`_

Using Mininet to simulate

.. code-block:: html



OpenFlow tutorial with Mininet
-------------------------------

`Mininet walkthrough<http://mininet.org/walkthrough/>`_
`Mininet tutorials <https://github.com/mininet/mininet/wiki/Documentation>`_


Using mininet
^^^^^^^^^^^^^^

`Using mininet <https://github.com/mininet/openflow-tutorial/wiki/Learn-Development-Tools>`_

.. code-block:: html

    # --controller=remote,ip=[controller IP],port=[controller listening port]
    sudo mn --topo single,3 --mac --switch ovsk --controller=remote,ip=127.0.0.1,port=6633



