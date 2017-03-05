自分が読んだ本を纏め
=====================


The Art of Readable Code
-----------------------------

Comment : help reader know what the writer knew when writting code

How to write precise compact comment

    keep comment compact
    No "it" or "this"
    describe function's behavior as precised as possible
    use inline comment (/* arg =*/) when calling high influence function

Making Control Flow easy to read

    In comparision  : changing values on the left, stable value on the right
    ternary operator    if (hour >= 12) ? {+="pm"} : {+="am"};      -> only for simplest case
    NO goto, do/white