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

    get-help script_name

    add -online at last to see online document

Using Familiar Command Names
------------------------------

Powershell use alias to link window cmdlets to unix-liked familiar command

.. code-block:: html

    get-alias command

    # to set new alias
    Set-Alias -Name gi -Value Get-Item
    Set-Alias -Name si -Value Set-Item
    Set-Alias -Name gl -Value Get-Location
    Set-Alias -Name sl -Value Set-Location
    Set-Alias -Name gcm -Value Get-Command

Using Tab Expansion
----------------------

auto complete

Pipe line
-----------

    get-childitem -path c:\windows\system32 | Out-Host -paging


Viewing Object Structure (Get-Member)

.. code-block:: html

    Get-Process | Get-Member | Out-Host -Paging
    Get-Process | Get-Member -MemberType Properties

Using Format Commands to Change Output View

.. code-block

    Get-Process -Name firefox
    # select which part to display
    Get-Process -Name firefox | format-wide -properpy cpu
    Get-Process -Name firefox | format-list
    Get-Process -Name firefox | format-table
    # 多くのtipやヒントがある
    # MEMO
    https://msdn.microsoft.com/en-us/powershell/scripting/topic/using-format-commands-to-change-output-view

Redirecting Data with Out-* Cmdlets

.. code-block:: html

    Get-Process | Out-Host -Paging | Format-List
    Get-Process | Format-List | Out-Host -Paging

    # 2 command below are the same
    get-command | out-host -paging
    get-command | more

    # Discarding Output (Out-Null)
    get-command | out-null

Paging Console Output (Out-Host)

    get-command -name out-*
    ##
    out-default
    out-file                -> output to file
    out-gridview
    out-host                -> output to console
    out-null                -> > /dev/null
    out-printer
    out-string

Windows PowerShell Navigation
------------------------------

.. code-block:: html

    # cd, pwd を利用でる
    get-location    # = pwd
    set-location    # = cd
    # other  -> あまり使わない
    push-location
    pop-location

Managing Windows PowerShell Drives
    https://msdn.microsoft.com/en-us/powershell/scripting/topic/managing-windows-powershell-drives

新しい概念: window powershell drive

Working With Files, Folders and Registry Keys
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

検索、表示など

.. code-block:: html

    Get-ChildItem -Path C:\Windows
    Get-ChildItem -Path C:\Windows -recurse
    Get-ChildItem -Path C:\Windows -name
    Get-ChildItem -Path C:\Windows -forece
    # wildcard -> same as linux ?,*などを利用
    Get-ChildItem -Path C:\Windows\?????.log
    # excluding item
    Get-ChildItem -Path C:\WINDOWS\System32\w*32*.dll -Exclude *[9516]*

get-childitem = ls

間違いタイプしても、powershellは自分でタイプし文のからエラーを読み出し、正しいコマンドの出力を表示する

Manipulating Items Directly
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

"Items" = elements which we see in window powershell
Example : files, directories

.. code-block:: html

    get-command -noun item

    C:\Users\gachiemchiep\workspace\powershell

    New-Item -Path c:\temp\New.Directory -ItemType Directory
    New-Item -Path C:\temp\New.Directory\file1.txt -ItemType file

Why Registry Values are not Items

Renaming Existing Items (Rename-Item)

.. code-block:: html

    Rename-Item -Path C:\temp\New.Directory\file1.txt fileOne.txt
    move-item
    copy-item
    remove-item
    # executing items
    invoke-item

Working with Objects
-------------------------

read later

https://msdn.microsoft.com/en-us/powershell/scripting/topic/working-with-objects

後で書き直すべき
================

about policy
    https://technet.microsoft.com/en-us/library/347708dc-1515-4d74-978b-8334603472e6

default execution policy = Restricted

in powershell command is considered as "cmdlets"

Microsoftの資料は本当に悪い、無駄な部分は多くので初心者には難しい


Effective powershell
=====================

blog link: https://rkeithhill.wordpress.com/2007/09/03/effective-powershell-item-1-the-four-cmdlets-that-are-the-keys-to-finding-your-way-around-powershell/

Effective PowerShell Item 1: The Four Cmdlets That are the Keys to Finding Your Way Around PowerShell
--------------------------------------------------------------------------------------------------------

command = cmdlets
in case of popular command (ex: pwd, cd,...) powershell use "alias" to link real-cmdlets
with alias. So we can re-use popular command

cmdlets is written as "verb-noun" format.

.. code-block:: html

    # search for cmdlets
    get-command
    # man command
    get-help
    # cmdlets's properties and member
    get-member
    # TODO
    Get-PSDrive

Effective PowerShell Item 2: Use the Objects Luke. Use the Objects!
---------------------------------------------------------------------

In most shells, information = string
in powershell, information = .net object

powershell's text manipulation functions

.. oode-block:: html

    -like
    -notlike
    -match
    -notmatch
    -replace
    -eq
    -ne
    -ceq (case-sensitive)
    -cne (case-sensitive)

in powershell , all text is case sensitive

information = .net object -> fast, easier to avoid bug and read code
TODO: 将来、powershellを利用する機会があればもう一度読む
-> 今は利用しないので、old-way(information = string)のアプローチを使う

Effective PowerShell Item 3: Know Your Output Formatters
---------------------------------------------------------

.. code-block:: html

    # 以下のcmdletsの出力は.net objectsである
    get-date
    # .net objectをToString関数を呼ぶ
    (get-date).ToString()
    # output formatを検索
    get-command format-*
    # 全ての情報を見るときに"*"を追加
    (Get-Process)[0] | Format-List *

Effective PowerShell Item 4: Commenting Out Lines in a Script File
-------------------------------------------------------------------

.. code-block:: html

    # 多くのラインをcomment out
    >> @'
    >> $(get-process)
    >> '@
    # Note, double quote will execute the command
    >> @"
    >> $(get-process)
    >> "@