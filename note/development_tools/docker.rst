Docker in nutshell
======================

参考資料
---------

` <http://techbeacon.com/essential-guide-software-containers-application-development>`_

概要
-----

The Docker platform leverages Docker containers to enable IT operations teams and Developer teams to build,
ship and run any application, anywhere.
In short words, Docker is a platform for build, deploy CONTAINER.

CONTAINER is one approach of VIRTUALIZATION. Another approach is using VMM/Hypervisor.

.. image:: imgs/docker/vmm_vs_container.PNG

.. image:: imgs/docker/container.PNG

The difference is for each guest instance VMM/Hypervisor also wrap guest's Kernel inside.
So the guest is heavy-weight, slow to boot up and use. But it is very secure.
But in case of CONTAINER, all of the guest share the same Kernel with the Host.
So the guests is light weight, fast to boot up and use. But there is security problems.

`vmm/hypervisor vs container <http://www.slashroot.in/difference-between-hypervisor-virtualization-and-container-virtualization>`_

Docker Usage
---------------

`Docker homepage <https://www.docker.com/>`_

`Docker tutorial <http://www.containertutorials.com/index.html>`_

Docker Usefull command
-------------------------

.. code-block::

    # Information
    docker info

    #Create a Container and enter its shell
    sudo docker run -i -t debian /bin/bash

    # run command and create new container
    docker run
    # run command on old container
    docker start

    # list on the running container
    docker ps -a -f status=running

Using docker with openvswitch

.. code-block::

    `install openvswitch on centOS <http://supercomputing.caltech.edu/blog/index.php/2016/05/03/open-vswitch-installation-on-centos-7-2/>`_
    `Networking with openvswitch <http://www.containertutorials.com/network/ovs_docker.html>`_


