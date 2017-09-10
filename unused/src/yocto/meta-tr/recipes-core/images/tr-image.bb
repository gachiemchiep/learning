DESCRIPTION = "A core image make by gachiemchiep"
LICENSE = "NOTHING"

# core files for basic console boot
IMAGE_INSTALL = "packagegroup-core-boot"

# Add our desired extra files
IMAGE_INSTALL += " psplash dropbear hello "

inherit core-image

# Add user/password
inherit extrausers
EXTRA_USERS_PARAMS = "\
                    useradd -P conmeocat gachiemchiep; \
                    usermod -P conmeocat root; \
"

IMAGE_ROOTFS_SIZE ?="8192"
#EXTRA_IMAGE_FEATURES_append = " read-only-rootfs "
