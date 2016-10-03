Networのpacket tracing toolsのサンプル
=======================================

//TODO

よく使われるtools
-----------------

.. code-block:: html

    Command名                説明
    traceip                 ip packet tracing
        traceroute
        tracepath
    snoop
    tcpdump
    nettl
    wireshark

Wiresharkの使い方について
=================

.. code-block:: html

    sudo apt-get install wireshark
    # run wireshark without root
    sudo chgrp username /usr/bin/dumpcap
    sudo chmod 750 /usr/bin/dumpcap
    sudo setcap cap_net_raw,cap_net_admin+eip /usr/bin/dumpcap

Sample
    https://cs.gmu.edu/~astavrou/courses/ISA_674_F12/Wireshark-Tutorial.pdf