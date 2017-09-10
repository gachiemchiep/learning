The linux kernel module programming
======================================

TODO Move back when have time
http://www.tldp.org/LDP/lkmpg/2.6/html/index.html



kernel moduleを扱うtool
------------------------

.. code-block:: html

    **** load module ***
    insmod module
    modprobe module

kernel module location

.. code-block:: html

        /lib/modules/

kernel source

.. code-block:: html

    sudo apt-get install fakeroot build-essential
    sudo apt-get install git-core libncurses5 libncurses5-dev libelf-dev asciidoc binutils-dev

get module information

.. code-block:: html

    modinfo module
    **** exam ****
    filename:       /home/gachiemchiep/workspace/learning/kernel_modules/hello-1.ko
    depends:
    vermagic:       4.1.13-100.fc21.x86_64 SMP mod_unload

Kernel module programはc programです。
しかし、mainがなくて"init_module"と"lcean_module"で
moduleの初期化と終了をします。
初期化と終了関数は別の名前でも良いですが、習慣的には
"init_module"と"clean_module"を利用します。

how to compile : using a make file
more detail at  linux/Documentation/kbuild/makefiles.txt

compile後、"test.ko"のmoduleを取得します。

.. code-block:: html

    **** load module ****
    insmod test.ko
    ** check **
    cat /proc/modules | grep test
    **** remove module ****
    rmmod test.ko
    ** check **

How to see the log

from /var/log/dmesg or /var/log/kernel

.. code-block:: html

    insmod hello-5.ko
    root@ubuntu-16-sv-vm:/home/gachiemchiep/workspace# dmesg | tail -n 10
    [  822.227805] Hello, world 5
                   =============
    [  822.227808] myshort is a short integer: 1
    [  822.227808] myint is an integer: 420
    [  822.227809] mylong is a long integer: 9999
    [  822.227810] mystring is a string: blah
    [  822.227810] myintArray[0] = -1
    [  822.227811] myintArray[1] = -1
    [  822.227812] got 0 arguments for myintArray.

    rmmod hello_5
    root@ubuntu-16-sv-vm:/home/gachiemchiep/workspace# dmesg | tail -n 10
    [  822.227805] Hello, world 5
                   =============
    [  822.227808] myshort is a short integer: 1
    [  822.227808] myint is an integer: 420
    [  822.227809] mylong is a long integer: 9999
    [  822.227810] mystring is a string: blah
    [  822.227810] myintArray[0] = -1
    [  822.227811] myintArray[1] = -1
    [  822.227812] got 0 arguments for myintArray.
    [  845.651201] Goodbye, world 5

    # HINT
    # use -F options of tail to show the log
    tail -F  /var/log/kern.log

there is a number of cases in which you may want to load your module into a precompiled running kernel.
This case = machine can not be rebooted, kernel is running, kernel which is compiled in the past,
kernel of common linux distribution

The most common errors:  "version strings" of "current running kernel" and "compiled module" is different.
-> kernel will refuse to load new module

Solution : compile it with the old source and setting

.. code-block:: html

    # get the kernel source code
    # https://wiki.ubuntu.com/Kernel/Dev/KernelGitGuide
    # https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel
    git clone git://kernel.ubuntu.com/ubuntu/ubuntu-xenial.git
    # copy the config and Makefile of precompied kernel into new kernel source
    cp /boot/config-`uname -r` /usr/src/linux-`uname -r`/.config.
    cp /lib/modules/`uname -r`/build/Makefile /usr/src/linux-`uname -r`
    # then make

TODO : read w1 driver
/home/gachiemchiep/workspace/kernel/linux-2.6.39/drivers/w1

start working env

    VBoxManage startvm ubuntu-sv-16.04 --type headless
    ssh gachiemchiep@192.168.150.64
    sudo mount -t nfs -o proto=tcp,port=2049 192.168.150.40:/export/workspace /home/gachiemchiep/workspace
    # /etc/fstab
    192.168.150.40:/   /export/workspace   /home/gachiemchiep/workspace    auto  0  0


/lib/modules/4.2.0-27-generic/build/include/linux/fs.h


Exampleの詳細
----------------

.. code-block:: html

    hello-1.c   -> basic
    hello-2.c    -> use different init and exit
    hello-4.c    : modinfoを利用するときに、必要な情報（著作、など）を表示
    hello-5.c   : parsing parameters

    TODO: 後に、続く