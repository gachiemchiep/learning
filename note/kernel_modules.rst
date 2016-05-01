The linux kernel module programming
======================================

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

    yum install kernel-devel

get module information

.. code-block:: html

    modinfo module
    **** exam ****
    filename:       /home/gachiemchiep/workspace/learning/kernel_modules/hello-1.ko
    depends:
    vermagic:       4.1.13-100.fc21.x86_64 SMP mod_unload

Kernel module programはc programです。
しかし、mainがなくて"init_module"と"lean_module"で
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

Exampleの詳細
----------------

.. code-block:: html

    hello-1.c   -> basic
    hello-2.c    -> use different init and exit
    hello-4.c    : modinfoを利用するときに、必要な情報（著作、など）を表示

    TODO: 後に、続く