#!/usr/bin/python
# -*- coding: utf8 -*-

class mono():
    # 初期化
    def __init__(self, id, name, price):
        self.id = id;
        self.name = name;
        self.price = price

    # print self
    def __str__(self):
        return ("Id: %i \tName:%s \tPrice:%si", self.id, self.name, self.price);

    # compare
    def __cmp__(self, other):
        if (self.id > other.id):
            return 1;
        else:
            return -1;

    # comparator
    def __eq__(self, other):
        return self.cmp(other) == 0

    def __le__(self, other):
        return self.cmp(other) <= 0

    def __ge__(self, other):
        return self.cmp(other) >= 0

    def __gt__(self, other):
        return self.cmp(other) > 0

    def __lt__(self, other):
        return self.cmp(other) < 0

    def __ne__(self, other):
        return self.cmp(other) != 0

def main():

    mono1 = mono(100, 'Camera', 99800)
    mono2 = mono(200, 'TV', 99800)
    mono3 = mono(300, 'PC', 99800)

    src = sys.argv[1];
    dst = sys.argv[2];

    print src, dst

    cpObj = Copy(src, dst);
    cpObj.doCopy();

if __name__ == "__main__":
    main();