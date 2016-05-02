
Type
    help about

to show the help

or go to
    https://technet.microsoft.com/library/bb978526


Command

    help about

    Update-Help




Dicoverability
    Use this command to search for cmd
        get-command *-service

Commandの"help"を表示

.. code-block:: html

    get-help command名
    command名 -?
    #例
    get-help get-service
    get-service -?
    # get-help の方は読みやすい


Cmdlets Use Verb-Noun Names to Reduce Command Memorization

    Verb
        get, new, restart, resum, set, start, stop, suspend
        #例
        # serviceでエンードするcmdletsを検索
        get-command -noun service
        # getでスタートするcmdletsを検索
        get-command -verb get

    Get-Process, Stop-Process, Get-Service, and Stop-Service

In some case, verb-noun is not a cmdlets

cmdlets parameters

    unlike linux, cmdlets only use "-", they do not use "--"

    Common parameters   TODO
        WhatIf, Confirm, Verbose, Debug, Warn, ErrorAction, ErrorVariable, OutVariable, and OutBuffer

Getting Information About Commands
------------------------------------

.. code-block ::html


    get-help get-command
    get-command -commandType Alias
    get-command -commandType Function
    get-command -commandType Script

Getting Detailed Help Information
-----------------------------------

cmdlets : get-childitem

.. code-block:: html

    get-help get-childitem
    get-childitem -?
    man get-childitem
    help get-childitem

    get-help get-childitem
    get-help get-childitem -detailed
    get-help get-childitem -full
    get-help get-childitem -parameter *
    get-help get-childitem -examples

    get-help about_*
    get-help about_command_syntax

    get-help resistry
    get-help -category prvider

後で書き直すべき
================

about policy
    https://technet.microsoft.com/en-us/library/347708dc-1515-4d74-978b-8334603472e6

default execution policy = Restricted

in powershell command is considered as "cmdlets"
