#!/usr/bin/python

from mininet.topo import Topo

from mininet.net import Mininet
from mininet.node import Controller, RemoteController, OVSController
from mininet.node import CPULimitedHost, Host, Node
from mininet.node import OVSKernelSwitch, UserSwitch
from mininet.node import IVSSwitch
from mininet.cli import CLI
from mininet.log import setLogLevel, info
from mininet.link import TCLink, Intf
from subprocess import call

class Net1( Topo):

    print """
               |s1
        ===============
        |s2           |s3
     ======        ======
     |    |        |     |
     h1   h2       h3    h4
       
    """
    
    def __init__(self):
        
        Topo.__init__(self)
        
        # init host
        h1 = self.addHost('h1')
        h2 = self.addHost('h2')
        h3 = self.addHost('h3')
        h4 = self.addHost('h4')

        # init switch
        s1 = self.addSwitch('s1')
        s2 = self.addSwitch('s2')
        s3 = self.addSwitch('s3')
        
        # add links to connect them together
        self.addLink(h1, s2)
        self.addLink(h2, s2)
        self.addLink(h3, s3)
        self.addLink(h4, s3)
        self.addLink(s1, s2)
        self.addLink(s1, s3)

class Net2( Topo ):
    
    print """
        Network is as follow
               |s1
        =================================
        |s2               |s3           |
     =============      ======          h4
     |           |      |    | 
     h1          |s4    h2   h3
            ===========
            |         |s5
            h5     ========
                   |      |     
                   h6     h7
    """
    
    def __init__(self):
        
        Topo.__init__(self)
        
        # init host
        h1 = self.addHost('h1')
        h2 = self.addHost('h2')
        h3 = self.addHost('h3')
        h4 = self.addHost('h4')
        h5 = self.addHost('h5')
        h6 = self.addHost('h6')
        h7 = self.addHost('h7')

        # init switch
        s1 = self.addSwitch('s1')
        s2 = self.addSwitch('s2')
        s3 = self.addSwitch('s3')
        s4 = self.addSwitch('s4')
        s5 = self.addSwitch('s5')
        
        # add links to connect them together
        self.addLink(h6, s5)
        self.addLink(h7, s5)
        
        self.addLink(h5, s4)
        self.addLink(s5, s4)
        
        self.addLink(s4, s2)
        self.addLink(h1, s2)
        
        self.addLink(h2, s3)
        self.addLink(h3, s3)
        
        self.addLink(h4, s1)
        self.addLink(s2, s1)
        self.addLink(s3, s1)

class Net3( Topo):

    
    def __init__(self):
        
        Topo.__init__(self)
        
        s4 = self.addSwitch('s4', cls=OVSKernelSwitch)
        s1 = self.addSwitch('s1', cls=OVSKernelSwitch)
        s3 = self.addSwitch('s3', cls=OVSKernelSwitch)
        s2 = self.addSwitch('s2', cls=OVSKernelSwitch)
        s5 = self.addSwitch('s5', cls=OVSKernelSwitch)
    
        h6 = self.addHost('h6', cls=Host, ip='10.0.0.6', defaultRoute=None)
        h2 = self.addHost('h2', cls=Host, ip='10.0.0.2', defaultRoute=None)
        h10 = self.addHost('h10', cls=Host, ip='10.0.0.10', defaultRoute=None)
        h1 = self.addHost('h1', cls=Host, ip='10.0.0.1', defaultRoute=None)
        h4 = self.addHost('h4', cls=Host, ip='10.0.0.4', defaultRoute=None)
        h5 = self.addHost('h5', cls=Host, ip='10.0.0.5', defaultRoute=None)
        h8 = self.addHost('h8', cls=Host, ip='10.0.0.8', defaultRoute=None)
        h7 = self.addHost('h7', cls=Host, ip='10.0.0.7', defaultRoute=None)
        h9 = self.addHost('h9', cls=Host, ip='10.0.0.9', defaultRoute=None)
        h3 = self.addHost('h3', cls=Host, ip='10.0.0.3', defaultRoute=None)
    
        self.addLink(h1, s1)
        self.addLink(h2, s1)
        self.addLink(h3, s4)
        self.addLink(h4, s4)
        self.addLink(h5, s2)
        self.addLink(h10, s2)
        self.addLink(h6, s3)
        self.addLink(s1, s2)
        self.addLink(s2, s3)
        self.addLink(s1, s4)
        self.addLink(s5, s3)
        self.addLink(s5, h8)
        self.addLink(s5, h7)
        self.addLink(s5, h9)


# topos = { 'mytopo': ( lambda: MyTopo() ) }
# topos = { 'Net1': ( lambda: Net1() ) }
topos = { 'Net3': ( lambda: Net3() ) }

