#!/usr/bin/env python

import subprocess

for i in range(1, 10000):

    for idCount in range(1, 6, 1):

        for ipCount in range(2, 7, 1):

            if not (idCount +1) == ipCount:
                command = "docker exec debian_%d nping -c1 --icmp  173.16.1.%d/24" % (idCount, ipCount)
            print command
            subprocess.call(command, shell=True)

