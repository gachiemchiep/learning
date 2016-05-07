https://en.wikibooks.org/wiki/QEMU

install

.. code-block:: html

    sudo apt-get install qemu-kvm qemu virt-manager virt-viewer libvirt-bin
    sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
    #### download test image ####
    qemu-system-i386 linux-0.2.img
    modprobe kvm
    # check kvm
    sudo kvm-ok
    # enable virtualization in bios


<ctrl+a 2> and <ctrl+a 1> to switch
(when switch the cusor is release)

also <ctrl + alt>

wrong architecture will lead to failed boot

create image

.. code-block:: html

    qemu-img create -f qcow2 centOS.img 4G
    qemu-system-x86_64 -m 512 -hda centOS.img -cdrom CentOS-7-x86_64-Minimal-1511.iso -boot d
    qemu -m 256 -hda centOS.img -cdrom CentOS-7-x86_64-Minimal-1511.iso -kernel-kqemu

.. code-block:: html

    #### create image ####
    qemu-img create -f raw image_file 4G
    qemu-img create -f qcow2 ubuntu.img 10G
    #################################################
    # qemu-img resize disk_image +10G
    #################################################
    #### installing the OS ####
    qemu-system-i386 -m 512 -hda ubuntu.img -cdrom ubuntu-12.04.5-server-i386.iso -boot d
    ##################################################
    #### running ####
    # qemu-system-i386 options disk_image
    # options = -m 512 -nographic -hda -kernel-kqemu
    qemu -m 512 -hda -nographic -kernel-kqemu disk_image
    qemu-system-i386 -m 512 -hda ubuntu.img -nographic
    ## can use yocto image too
    runqemu qemux86 tmp/deploy/images/qemux86/core-image-minimal-qemux86.ext4 nographic

# something nasty happed with ubuntu server 12.04
# -> can not boot
# just use the desktop image and boot into text mode
# /etc/default/grub
GRUB_HIDDEN_TIMEOUT_QUIET=true
GRUB_TIMEOUT=0
# GRUB_CMDLINE_LINUX_DEFAULT=”quiet splash
GRUB_CMDLINE_LINUX=”text”
GRUB_TERMINAL=console,
update-grub

# use virtual machine manager to create image
/var/lib/libvirt/images


TODO : http://nairobi-embedded.org/qemu_serial_port_system_console.html

make qemu client IO to server's console

Setup NFS (network file system = sharing)

.. code-block:: html

    #### summary ####
    # NFS server is on working machine
    # NFS client is on virtual machine
    # NFS client mount sharing directory when start up
    #############################################################
    #### https://help.ubuntu.com/community/SettingUpNFSHowTo ####
    ### On working machine ##
    apt-get install nfs-kernel-server
    mkdir /export
    mkdir /export/workspace
    mount --bind /home/gachiemchiep/workspace/ /export/workspace
    ## /etc/fstab
    /home/gachiemchiep/workspace /export/workspace none    bind  0  0
    ## /etc/exports
    /export       192.168.1.0/24(rw,fsid=0,insecure,no_subtree_check,async)
    /export/workspace 192.168.1.0/24(rw,nohide,insecure,no_subtree_check,async)
    ## restart
    service nfs-kernel-server restart
    ### on client machine (virtual machine) ###





