#FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

#SRC_URI_append = " file://write_access.sh "

#do_install_append() {
#        install -m 0755 ${WORKDIR}/write_access.sh ${D}${sysconfdir}/init.d
#        update-rc.d -r ${D} write_access.sh start 29 S .
#}
