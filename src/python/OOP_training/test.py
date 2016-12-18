#!/usr/bin/python
# -*- coding: utf8 -*-

import sys, os, shutil
#
class Copy(object):

    # 初期化
    def __init__(self, src, dst):
        self.src = src;
        self.dst = dst

    # setter, getter
    def setSrc(self, src):
        if os.path.exists(src) & os.path.isfile(src):
            self.src = src;
        else:
            print("%s is not exist or not a file", src);

    def getSrc(self):
        return self.src;

    # print self
    def __str__(self):
        return "%s is copy1 object";

    # start copy
    def doCopy(self):
        if os.path.exists(self.src) & (not os.path.isdir(self.src)):
            shutil.copyfile(self.src, self.dst);

def main():
    src = sys.argv[1];
    dst = sys.argv[2];

    print src, dst

    cpObj = Copy(src, dst);
    cpObj.doCopy();

if __name__ == "__main__":
    main();
