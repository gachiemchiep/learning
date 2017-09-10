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


.. code-block:: html

    -nographic      disable graphical output and redirect serial I/Os to console
    -curses         use a curses/ncurses interface instead of SDL
    -no-frame       open SDL window without a frame and window decorations
    -alt-grab       use Ctrl-Alt-Shift to grab mouse (instead of Ctrl-Alt)
    -ctrl-grab      use Right-Ctrl to grab mouse (instead of Ctrl-Alt)
    -no-quit        disable SDL window close capability
    -sdl            enable SDL

By default, qemu will create a pop up window.Moving between windows is very annoy.
Using QEMU on console  = "boot by serialConsole" + "disable QEMU's graphical output"
-> very convinient

.. code-block:: html

    # enable booting by serialConsole
    # https://help.ubuntu.com/community/SerialConsoleHowto
    ############################################################
    #### 1. create /etc/init/ttyS0.conf
    start on stopped rc RUNLEVEL=[12345]
    stop on runlevel [!12345]
    respawn
    exec /sbin/getty -L 115200 ttyS0 vt102
    # then
    sudo start ttyS0
    #### 2. edit /etc/default/drub
    GRUB_CMDLINE_LINUX="console=tty0 console=ttyS0,115200n8"
    GRUB_TERMINAL=serial
    GRUB_SERIAL_COMMAND="serial --speed=115200 --unit=0 --word=8 --parity=no --stop=1"
    # then
    update-grub

Setup network: -> it is more complex than i thought -> TODO : do it later

Setup NFS (network file system = sharing)

.. code-block:: html

    apt-get install ssh

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



lshw -class network


route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.150.1   0.0.0.0         UG    0      0        0 eth0
192.168.122.0   0.0.0.0         255.255.255.0   U     0      0        0 virbr0
192.168.150.0   0.0.0.0         255.255.255.0   U     1      0        0 eth0


User Networking (SLIRP)

-> this is not the "normal" one

shit, without networking basic knowledge fooling around is waste of time
Save until you know wtf is SLIRP and what is the "normal" one (the virtual networking standard)
which VM, Virtual Box are using


Qemu can output to serial0 (/dev/ttyS0 on guest, but /dev/tty on host).
 This makes it possible to run guests via SSH, without graphical desktop at all,
  not on server and not on client. But guests must be modified to make them compatible with this feature.
  Windows guests won't run with this option.

Huhm, interesting. virtualbox can output everything to serial too
https://www.virtualbox.org/wiki/Serial_redirect

-> theoritically, virtualbox does have a nographic option too

In case of virtualbox :  -> i give up

    # set up virtual machine
    Allow virtual to use Serialport
    Settings -> Serial Ports -> check "Enable Serial Port"
                              Path/Address = /dev/ttyS0

    # add VBox user to "dialout" group
    sudo usermod -a -G dialout vboxusers
    sudo usermod -a -G  vboxusers gachiemchiep

    # start without GUI
    VBoxManage startvm "ubuntu 12.04" --type headless

    # start minicom and connect to serial port

    -> it does not show anything -> fuck



Let QEMU mount host's dir directtely -> do not need to use NFS
https://nixos.org/wiki/QEMU_guest_with_networking_and_virtfs

https://www.suse.com/documentation/sles11/book_kvm/data/kvm_qemu_virtfs.html -> this one

VirtFS : virtual filesystem

-virtfs local,path=path,mount_tag=tag,security_model=[mapped-xattr|mapped-file|passthrough|none]
        [,writeout=immediate][,readonly][,socket=socket|sock_fd=sock_fd]


qemu-system-i386 -hda ubuntu-desktop-12.04.img -redir tcp:2222::22 -nographic

ssh -p 2222 root@192.168.0.101
192.168.0.101  is the IP of the host)
mount 192.168.0.101:/mnt/nfs /mnt/nfs


fk this shit,


Setup virtualbox sharing folder

.. code-block:: html

    Make Virtual machine
    # start the VM
    Devices > Insert Guest Additions CD image...
    sudo mount /dev/cdrom /media/cdrom
    sudo apt-get install make gcc linux-headers-$(uname -r)
    sudo /media/cdrom/VBoxLinuxAdditions.run
    # from VirtualBox's Setting set sharing dir as kernel_modules_host
    # set network as bride adapter
    # static IP will appear -> can ssh and do other
    # then mount
    mount -t vboxsf kernel_modules_host workspace/
    # DO NOT use NFS -> too much complex




