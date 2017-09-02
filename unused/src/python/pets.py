#!/usr/bin/python
# -*- coding: utf8 -*-

# from pets import Pet

class Pet(object):

    # 初期化
    def __init__(self, name, species):
        self.name = name;
        self.species = species;

    # setter, getter
    def setName(self, name):
        self.name = name;

    def getName(self):
        return self.name;

    def setSpecies(self, species):
        self.species = species;

    def getSpecies(self):
        return self.species;

    # print self
    def __str__(self):
        return "%s is a %s" % (self.name, self.species)

class Dog(Pet):

    def __init__(self, name, chases_cats):
        Pet.__init__(self, name, "Dog")
        self.chases_cats = chases_cats

    def chasesCats(self):
        return self.chases_cats



class Cat(Pet):

    def __init__(self, name, hates_dogs):
        Pet.__init__(self, name, "Cat")
        self.hates_dogs = hates_dogs

    def hatesDogs(self):
        return self.hates_dogs


