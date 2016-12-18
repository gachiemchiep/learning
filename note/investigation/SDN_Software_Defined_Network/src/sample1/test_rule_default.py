#!/usr/bin/env python

import subprocess

while True:

    for idCount in range(1, 6, 1):      # 1 .. 5
        for ipCount in range(2, 7, 1):  # 2 .. 6

            if idCount == 5:
                ipCount = 2

            # command = "docker exec debian_%d nping -c1 --icmp  173.16.1.%d/24" % (idCount, ipCount)
            command = "docker exec debian_%d ping -c5  173.16.1.%d/24" % (idCount, ipCount)
            print command
            subprocess.call(command, shell=True)

