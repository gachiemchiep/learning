#!/usr/bin/env python

import subprocess

for count in range(1, 5, 1):

    ipCount = count + 1
    if (count == 5):
        ipCount = 2
    command = "Docker exec debian_%d -dit nmap -c1 --icmp  73.16.1.%d/24" % (count, ipCount)
    print command