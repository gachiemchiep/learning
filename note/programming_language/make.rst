makeについて
================

Make is a tool to build, compile program.
makeのコマンドは通常"Makefile"に書きます。

makeの一番簡単な例は：

.. code-block:: html

    app: app.c inc_a.h
	    cc -o app app.c
	*******************
    output_file: dependency list
        command 1
        command 2

Makefileはbashと同じように、引数やbash toolを利用できます。

注意：bash toolの実行が失敗する時に、エラー msgはmakeに戻す。
makeはエラーが発生するところに止まる。
このことを避けるため、bash toolのコマンドの前に"-"（minus）または"@"(a cong)
を追加する。
makeはコマンドのエラーを飛ばす。

.. code-block:: html

    INSTPATH=./bin/myapp
    INCPATH=./include
    # *** Targets
    all: getobj app install putobj

    app: main.o mod_a.o mod_b.o
        $(CC) $(CFLAGS) -o app main.o mod_a.o mod_b.o

    main.o: main.c $(INCPATH)/inc_a.h $(INCPATH)/inc_b.h
        $(CC) $(CFLAGS) -c main.c

    putobj:
        -mv *.o $(OBJPATH) 2>/dev/null

    # Process only when app timestamp is changed
    install:
        @if [ "$(COND1)" != "$(COND2)" ];\
        then\
            cp -p ./app $(INSTPATH) 2>/dev/null;\
            chmod 700 $(INSTPATH);\
            echo "Installed in" $(INSTPATH);\
        fi

    # This one is used for housekepping
    cleanall:
        -rm -f app
        -rm -f $(OBJPATH)/*.o
        -rm -f $(INSTPATH)

Suffix Rules: Simplifying Makefiles Syntax

A Makefile Calling Others Makefiles

makeは上記の二つのこともできる。面倒から保留
http://www.codeproject.com/Articles/31488/Makefiles-in-Linux-An-Overview

複雑なprojectには手でMakefileを書くではなく、
"Autotools"または"Cmake"を利用して行う。
Linuxの方は"Autotools"をよく使われる。
Cmakeは最近の新しいprojectはどんどん使われている。