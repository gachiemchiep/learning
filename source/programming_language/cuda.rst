CUDAについて
==============

環境設定
-------------

Nvidia社はinstall fileを提供する
    https://developer.nvidia.com/cuda-downloads

Nvidia driver
    # driver version 340を利用（>340 -> できない -> card is old）
    sudo add-apt-repository ppa:graphics-drivers/ppa
    sudo apt-get update
    sudo ubuntu-drivers autoinstall
    # check
    ubuntu-drivers devices

Install Cuda
    https://developer.nvidia.com/cuda-downloads
    # download cuda_6.5.14_linux_64.run
    # then ./cuda_6.5.14_linux_64.run
    # DO NOT SELECT TO INSTALL DRIVER
    # also remember to include opengl
    sudo apt-get install freeglut3 freeglut3-dev
    # .bashrc
    export PATH=/usr/local/cuda-6.5/bin:$PATH
    export LD_LIBRARY_PATH=/usr/local/cuda-6.5/lib64:$LD_LIBRARY_PATH


Compile caffe
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
    make all; make test; make runtest
    * Please make sure your PATH includes /usr/local/cuda-5.5/bin
    * Please make sure your LD_LIBRARY_PATH
    *   for 32-bit Linux distributions includes /usr/local/cuda-5.5/lib
    *   for 64-bit Linux distributions includes /usr/local/cuda-5.5/lib64:/lib
    * OR
    *   for 32-bit Linux distributions add /usr/local/cuda-5.5/lib
    *   for 64-bit Linux distributions add /usr/local/cuda-5.5/lib64 and /lib
    * to /etc/ld.so.conf and run ldconfig as root

    * To uninstall CUDA, remove the CUDA files in /usr/loca

***********************
Caffe Tutorial
===============~=======

.. code-block:: html

    export CAFFE_ROOT=/home/gachiemchiep/Tools/caffe/build/tools/
    bash $CAFFE_ROOT/../../data/mnist/get_mnist.sh

    sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
    sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
    sudo apt-get autoremove libopencv-dev python-opencv

特徴抽出
----------