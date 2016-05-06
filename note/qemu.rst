https://en.wikibooks.org/wiki/QEMU

install
    apt-get install qemu qemu-kvm libvirt-bin

download test image

test qemu
    qemu-system-i386 linux-0.2.img

<ctrl+a 2> and <ctrl+a 1> to switch
(when switch the cusor is release)

also <ctrl + alt>

create image
    qemu-img create -f qcow2 centOS.img 4G
    qemu-system-i386 -m 512 -hda centOS.img -cdrom CentOS-7-x86_64-Minimal-1511.iso -boot d
    qemu -m 256 -hda centOS.img -cdrom CentOS-7-x86_64-Minimal-1511.iso -kernel-kqemu


test image

.. code-block:: html

    # fastest
    runqemu qemux86 tmp/deploy/images/qemux86/core-image-minimal-qemux86.ext4 nographic

