OpenDayLight: How to develop
=============================

`Application Development Tutorial - A Grand Tour of Coding for OpenDaylight Part 1  <https://www.youtube.com/watch?v=2wTEuNyxspY&t=4739s>`_

When compiling on sharing directory (NFS) shared
java.io lock not found error appear



Create workspace on the VM, export it using NFS
then mount on HOST

when compiling              -> use the VM
When edit the source code   -> use the host eclipse

Install Mininet on CentOS (VM)

    https://techandtrains.com/2014/09/13/mininet-and-open-vswitch-on-centos-7/

log:display | grep -i Hello

@Warning
    never compile directly from HelloWorld
    It will take very loing time

    Select each small project then compile

    When import into eclipse, only select imp and api
    Other project is not needed

    After editing the source
    Only compile the edited ones


Develop Environment
----------------------

Our Development Environment is as this :numref:`fig_env`

.. _fig_env:

.. figure:: ../imgs/OpenDayLight/env.png

Sharing directory is a NFS


On The Host
^^^^^^^^^^^^^

Install Maven, Eclipse Neon

.. code-block::

    # Install Maven
    # Go to https://wiki.opendaylight.org/view/GettingStarted:Development_Environment_Setup#Download_and_install_maven
    # Add OpenDayLight repository to Maven
    # wget -q -O - https://raw.githubusercontent.com/opendaylight/odlparent/master/settings.xml > ~/.m2/settings.xml
    # Increase Maven memory size
    export MAVEN_OPTS='-Xmx1048m -XX:MaxPermSize=512m'

    # Eclipse with OpenDayLight respository
    # DO AS SAME AS
    https://github.com/vorburger/opendaylight-eclipse-setup

    # After installation
    ~/Tools/eclipse_OpenDayLight$
        ├── eclipse
        ├── git
        └── ws

    # link to workspace
    ln -s ~/Tools/eclipse_OpenDayLight/ws ~/workspace/OpenDayLight

Create and compile Hello World OpenDayLight project

.. code-block:: html

    # see "Exercise 1" in the link below
    # https://wiki.opendaylight.org/view/Controller_Core_Functionality_Tutorials:Application_Development_Tutorial

    # The project directory struture is as followed
    hello/
    ├── api
    ├── artifacts
    ├── cli
    ├── deploy-site.xml
    ├── features
    ├── impl
    ├── it
    ├── karaf
    ├── pom.xml
    ├── src
    └── target



Compile project

.. code-block:: html

    # cd hello

    # compile project
    #  mvn -nsu  clean install

    # generate eclipse entry
    #  mvn -npr eclipse:eclipse

    # At the first time,  It would take around 30 minutes
    # Result
    [INFO] ------------------------------------------------------------------------
    [INFO] Reactor Summary:
    [INFO]
    [INFO] hello-api .......................................... SUCCESS [ 13.744 s]
    [INFO] hello-impl ......................................... SUCCESS [  7.384 s]
    [INFO] hello-cli .......................................... SUCCESS [  6.215 s]
    [INFO] hello-features ..................................... SUCCESS [04:47 min]
    [INFO] hello-karaf ........................................ SUCCESS [10:29 min]
    [INFO] hello-artifacts .................................... SUCCESS [  1.184 s]
    [INFO] hello-it ........................................... SUCCESS [01:17 min]
    [INFO] hello .............................................. SUCCESS [ 26.357 s]
    [INFO] ------------------------------------------------------------------------
    [INFO] BUILD SUCCESS
    [INFO] ------------------------------------------------------------------------
    [INFO] Total time: 17:31 min
    [INFO] Finished at: 2016-11-02T21:54:19+09:00
    [INFO] Final Memory: 235M/1589M
    [INFO] ------------------------------------------------------------------------

Select desired project and import into Eclipse as Maven project.

.. code-block:: html

    File -> New Project -> Maven Project -> select hello
    You will see a list of project is imported inside hello-aggreator groups
    Do not panic, you will use all of these project to develop OpenDayLight application

On The VM
^^^^^^^^^^^

VM is VirtualBox with CentOs7-64



Start the VirtualMachine in background

.. code-block:: html

    VBoxManage list vms
    #"CentOS" {df523ad9-6033-4a88-a9f3-b67a28517abb}

    VBoxManage startvm CentOS --type headless

    LogInto virtual machine using ssh

.. code-block:: html

    # shared directory on Virtual Box
    # add user to vboxsf
    sudo usermod -a -G vboxsf gachiemchiep
    # link to working directory
    sudo ln -s /media/sf_workspace/ $PWD/workspace

Change SELinux Rule

.. code-block:: html

    # inside file /etc/sysconfig/selinux
    SELINUX=permissive

    # turn off firewalld
    systemctl disable firewalld
    # then reboot

Install maven, java

.. code-block:: html

    # get java SE 1,8
    http://tecadmin.net/install-java-8-on-centos-rhel-and-fedora/
    # get the newest maven
    http://maven.apache.org/install.html
    # Add OpenDayLight repository to Maven
    # wget -q -O - https://raw.githubusercontent.com/opendaylight/odlparent/master/settings.xml > ~/.m2/settings.xml
    # Increase Maven memory size
    export MAVEN_OPTS='-Xmx1048m -XX:MaxPermSize=512m'

recompile the source again on the virtual machine

.. code-block:: html

    # cd OpenDayLight
    #  mvn -nsu clean install
    # It would take around 30 minutes

    # result
    [INFO] ------------------------------------------------------------------------
    [INFO] Reactor Summary:
    [INFO]
    [INFO] hello-api .......................................... SUCCESS [ 35.896 s]
    [INFO] hello-impl ......................................... SUCCESS [ 12.581 s]
    [INFO] hello-cli .......................................... SUCCESS [ 12.918 s]
    [INFO] hello-features ..................................... SUCCESS [ 20.651 s]
    [INFO] hello-karaf ........................................ SUCCESS [01:59 min]
    [INFO] hello-artifacts .................................... SUCCESS [  3.402 s]
    [INFO] hello-it ........................................... SUCCESS [ 37.599 s]
    [INFO] hello .............................................. SUCCESS [ 52.317 s]
    [INFO] ------------------------------------------------------------------------
    [INFO] BUILD SUCCESS
    [INFO] ------------------------------------------------------------------------
    [INFO] Total time: 05:04 min
    [INFO] Finished at: 2016-11-03T10:14:34+09:00
    [INFO] Final Memory: 220M/446M
    [INFO] ------------------------------------------------------------------------

Now follow `OpenDayLight Execise <https://wiki.opendaylight.org/view/Controller_Core_Functionality_Tutorials:Application_Development_Tutorial#Build_the_hello_project>`_


.. code-block:: html

    # Run the karaf
    ./hello/karaf/target/assembly/bin/karaf

    #This will present the karaf prompt:
    opendaylight-user@root>

    # Veryfyting
    opendaylight-user@root>log:tail

    # The below message will appear after a while
    HelloProvider Session Initiated

    # Exit Karaf
    opendaylight-user@root>shutdown -h

Remember to edit the source on the HOST and COMPILE, DEPLOY on the GUEST
