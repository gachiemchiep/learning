Bashについて
================

Bashは強いプログラミング言語であるが、Debugは難しいので
タスクの自動化するだけために利用する。

Bashの引数の定義と利用

.. code-block:: html

    ****引数定義****
    var=10;
    ****引数を利用****
    echo $var
    echo "$var"         -> preserves whitespace
    echo ${var}         -> indirect reference, 読み易い+引数の名変更できる
    echo $(var)         -> often used in makefile, same as $var
    ****引数の割り当て****
    var=$( cat aaa );   -> 新しい、お勧めである。
    var=`cat aaa`;      -> very old