概要
=======

1. Learn C the hard way


Learn C the hard wayについて
==============================

Cの基礎について、再学習をします。
著者はさまざまな例を挙げて、説明します。

How to write
----------------

基本なsource codeは"ex.cpp"です。

How to compile
-----------------

.. code-block:: html

    gcc -Wall ex.cpp -o ex

When writing Makefile : use tab instead of space.
If you want to check tab use "cat -e -t -v  Makefile"

How to debug
-------------

.. code-block:: html

    **** Tool ****
    valgrind
    remember to use "-g" option when compile
    then
    valgrind program

Key points
-------------

 C stores its strings simply as an array of bytes, terminated with the '\0'  : ex8.cpp

Heap vs. Stack Allocation

Pointer

.. code-block:: html

    ex14 : simple function
    ex15: pointer
    *******************************
    type *ptr
        "a pointer of type named ptr"
    *ptr
        "the value of whatever ptr is pointed at"
    *(ptr + i)
        "the value of (whatever ptr is pointed at plus i)"
    &thing
        "the address of thing"
    type *ptr = &thing
        "a pointer of type named ptr set to the address of thing"
    ptr++
        "increment where ptr points"
    *********************************
    ex16: struct + pointer

    **** clas

.. code-block:: html

    Never Trust Input
        Never trust the data you are given and always validate it.
    Prevent Errors
        If an error is possible, no matter how probable, try to prevent it.
    Fail Early And Openly
        Fail early, cleanly, and openly, stating what happened, where and how to fix it.
    Document Assumptions
        Clearly state the pre-conditions, post-conditions, and invariants.
    Prevention Over Documentation
        Do not do with documentation, that which can be done with code or avoided completely.
    Automate Everything
        Automate everything, especially testing.
    Simplify And Clarify
        Always simplify the code to the smallest, cleanest form that works without sacrificing safety.
    Question Authority
        Do not blindly follow or reject rules.

.. code-block:: html

    For each parameter identify what its preconditions are, and whether the precondition should cause a failure or  return an error. If you are writing a library, favor errors over failures.
    Add assert calls at the beginning that checks for each failure precondition using assert(test && "message"); This little hack does the test, and when it fails the OS will typically print the assert line for you, which then includes that message. Very helpful when you're trying to figure out why that assert is there.
    For the other preconditions, return the error code or use my check macro to do that and give an error message. I didn't use check in this example since it would confuse the comparison.
    Document why these preconditions exist so that when a programmer hits the error they can figure out if they are really necessary or not.
    If you are modifying the inputs, make sure that they are correctly formed when the function exits, or abort if they aren't.
    Always check the error codes of functions you use. For example, people frequently forget to check the return codes from fopen or fread which causes them to use the resources they give despite the error. This causes your program to crash or gives an avenue for an attack.
    You also need to be returning consistent error codes so that you can do this for all of your functions too. Once you get in this habit you will then understand why my check macros work the way they do.

Automate Everything

.. code-block:: html

    Testing and validation.
    Build processes.
    Deployment of software.
    System administration.
    Error reporting.

Simplify And Clarify

The simplest test of which function to use is:

    Make sure both functions have no errors. It doesn't matter how fast or simple a function is if it has errors.
    If you can't fix one, then pick the other.
    Do they produce the same result? If not then pick the one that has the result you need.
    If they produce the same result, then pick the one that either has fewer features, fewer branches, or you just think is simpler.
    Make sure you're not just picking the one that is most impressive. Simple and dirty beats complex and clean any day.

