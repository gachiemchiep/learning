CUDAについて
==============

環境設定
-------------

Nvidia driver
    sudo add-apt-repository ppa:graphics-drivers/ppa
    sudo apt-get update
    sudo ubuntu-drivers autoinstall
    # check
    ubuntu-drivers devices

Install Cuda
    https://developer.nvidia.com/cuda-downloads
    `sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb`
    `sudo apt-get update`
    `sudo apt-get install cuda`


    sudo update-alternatives --config x86_64-linux-gnu_gl_conf
    -> select which dirver