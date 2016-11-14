#!/usr/bin/env python

import subprocess

for count in range(1, 5, 1):

    ipCount = count + 1
    if (count == 5):
        ipCount = 2
    command = "docker exec debian_%d nping -c1 --icmp  173.16.1.%d/24" % (count, ipCount)
    print command
    subprocess.call(command, shell=True)