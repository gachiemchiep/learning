#!/bin/sh
# If filesystem is readonly, link log folder to /var/volatile
. /etc/default/rcS

[ "$ROOTFS_READ_ONLY" = "no" ] && exit 0

is_on_read_only_partition () {
        DIRECTORY=$1
        dir=`readlink -f $DIRECTORY`
        while true; do
                if [ ! -d "$dir" ]; then
                        echo "ERROR: $dir is not a directory"
                        exit 1
                else
                        for flag in `awk -v dir=$dir '{ if ($2 == dir) { print "FOUND"; split($4,FLAGS,",") } }; \
                                END { for (f in FLAGS) print FLAGS[f] }' < /proc/mounts`; do
                                [ "$flag" = "FOUND" ] && partition="read-write"
                                [ "$flag" = "ro" ] && { partition="read-only"; break; }
                        done
                        if [ "$dir" = "/" -o -n "$partition" ]; then
                                break
                        else
                                dir=`dirname $dir`
                        fi
                fi
        done
        [ "$partition" = "read-only" ] && echo "yes" || echo "no"
}

# net-snmp is run after init script so /var/net-snmp is empty

if [ "$1" = "start" ] ; then
        if [ `is_on_read_only_partition /var` = "yes" ]; then
                # Mount
                grep -q "tmpfs /var/volatile" /proc/mounts || mount /var/volatile
                # Make a writable space for apache2
                mkdir -p /var/volatile/apache2
                cp -a /var/apache2/* /var/volatile/apache2
                mount --bind /var/volatile/apache2 /var/apache2
                # Make a writable space for net-snmp
                mkdir -p /var/volatile/net-snmp
        fi
fi
