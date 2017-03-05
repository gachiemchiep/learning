# http://wiki.christophchamp.com/index.php?title=OpenStack_deployment_via_packstack_from_RDO
https://www.rdoproject.org/documentation/packstack-all-in-one-diy-configuration/
https://docs.openstack.org/image-guide/obtain-images.html
http://f5-openstack-docs.readthedocs.io/en/latest/guides/map_deploy-guide-next-steps.html

sysctl -a | grep ip_forward #=> 1 (see: sysctl)
sestatus #=> set to "permissive" (see: selinux)
systemctl stop NetworkManager.service
systemctl disable NetworkManager.service
chkconfig network on
systemctl start network.service



yum update -y
yum install -y https://rdoproject.org/repos/rdo-release.rpm

yum install -y http://rdoproject.org/repos/openstack-kilo/rdo-release-kilo.rpm
yum install -y openstack-packstack
packstack --answer-file f5....


yum install python-pip
pip install django_pycss



nova secgroup-create all "Allow all tcp ports"
nova secgroup-add-rule all TCP 1 65535 0.0.0.0/0
nova secgroup-create base "Allow Base Access"
nova secgroup-add-rule base TCP 22 22 0.0.0.0/0
nova secgroup-add-rule base TCP 80 80 0.0.0.0/0
nova secgroup-add-rule base ICMP -1 -1 0.0.0.0/0
nova secgroup-list-rules base

nova keypair-add admin >/root/admin.pem
chmod 600 /root/admin.pem
nova keypair-list

INSTANCE_NAME=rdo-test-01
GLANCE_IMAGE_ID=$(glance image-list|awk '/ '${CIRROS_IMAGE_NAME}' /{print $2}')
PRIVATE_NET_ID=$(neutron net-list|awk '/ private_network /{print $2}')


nova boot --flavor m1.tiny --image ${GLANCE_IMAGE_ID} --nic net-id=${PRIVATE_NET_ID} \
            --key-name admin --security-groups base ${INSTANCE_NAME}
INSTANCE_ID=$(nova list|awk '/ '${INSTANCE_NAME}' /{print $2}')



    IPADDR  192.168.122.182
    HWADDR  52:54:00:94:67:fd
    NETMASK 255.255.255.0
    GATEWAY 192.168.122.1
    DNS1    8.8.8.8

$ sudo vi /etc/sysconfig/network-scripts/ifcfg-br-ex
$ sudo vi /etc/sysconfig/network-scripts/ifcfg-enp2s0
    
    $ openstack-config --set /etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini ovs bridge_mappings extnet:br-ex
    $ openstack-config --set /etc/neutron/plugin.ini ml2 type_drivers vxlan,flat,vlan
    
# create neutron-network

neutron net-create external_network --provider:network_type flat --provider:physical_network extnet  --router:external --shared
neutron subnet-create --name public_subnet --enable_dhcp=False --allocation-pool=start=192.168.122.100,end=192.168.122.250 --gateway=192.168.122.1 external_network 192.168.122.0/24

neutron net-create private_network
neutron subnet-create --name private_subnet private_network 172.16.0.0/12 --dns-nameserver=192.168.122.190


neutron router-create router1
neutron router-gateway-set router1 external_network
neutron router-interface-add router1 private_subnet
