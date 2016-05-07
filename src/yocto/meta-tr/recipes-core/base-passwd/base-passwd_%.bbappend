# Override old default user/password
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " file://haveshadow.patch "

