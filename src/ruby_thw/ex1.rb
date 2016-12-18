# -*- coding: utf-8 -*-
#### enable encode as utf-8 ####

#### print to stdout ####
puts "Hello World!"

#### math
##      same rule as C
##      to display math result in stdout do as follow
puts "Hens #{25 + 30 / 6}"

#### variable
##       using variable #{varName}
##       naming rule is as same as C
dogCount = 100;
put "Number of dogs is #{dogCount}"

####    string + text
text_1 = "Hellow"
text_2 = "World"
print text_1 + " " + text_2

####    print using format
formatter = "%{first} %{second} %{third} %{fourth}"
puts formatter % {first: "one", second: "two", third: "three", fourth: "four"}
print formatter % {first: "one", second: "two", third: "three", fourth: "four"}

####    print a very long text
##      same rule as python
print """
This is a very long text
"""

####    input from keyboard
number = gets.chomp.to_i
string = gets.chomp

####    reading writing files
filename = ARGV.first
fid = open(filename, 'w');

##      truncate file
fid.truncate(0)

##      write line
fid.write("This is line 1\n");

##      close
fid.close()

####     define function
##       function can have default value
def foo(a, b = nil)
    puts a
    if (b != nil) {
        puts b
    }
    return (a + b)
end


####################################################
####    Example of module
##      save as test.rb
module  test

    def test.add(a, b = 0)
        return a + b;
    end

##      in other file
require "test.rb"
c = test.add(10, 20)

####     If
if 20 > 10
    puts "true"
elsif 20 = 20
    puts "fair enough"
else
    puts "wrong"
end

####    loop
fruits = ['apples', 'oranges', 'pears', 'apricots']
for fruit in fruits
    puts "#{fruit}"
end

i = 0;
number = []

while i < 6
    numbers.push(i)
    i += 1;
end

####    array accessing
##      same as C
animals = ['bear', 'tiger', 'penguin', 'zebra']
bear    = animals[0]

