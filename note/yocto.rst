Yoctoについて
=============

Yocto = linux distributionを生成するframeworkである

Poky contains several "layers"of metadata

.. code-block:: html

    Other layer
    meta-yocto
    meta-yocto-bsp
    oe-core(meta)

metadata = reciper(*.bb), packagegroups(special *.bb), classes(*.bbclass), configuration(*.conf)

reccipe = bitbake + metadata + how to build

.. code-block:: html

    linux distribution = a lot of recipe
    BSD = BSD recipe
    kernel = kernel recipe
    software = software recipe

what is bitbake ?

.. code-block:: html

    bitbake = python script
    -> settings are writtens as python array

Set up
-------

`yocto's homepage <https://www.yoctoproject.org/>`

.. code-block:: html

    sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat libsdl1.2-dev xterm
    # get source
    git clone -b dizzy git://git.yoctoproject.org/poky.git
    # initialize environment
    source oe-init-build-env build_directory
    ##########################################################
    # after initializing, some usefull command
    bitbake                     :  recipeをparseして、packageをcompile
    bitbake-layers              :  projectのlayersの詳細を表示
    toaster
    wic                         :  Linux imageを生成用tool(以外に複雑から利用しない)

what is inside poky
----------------------------------

.. code-block:: html

    poky-krogoth-15.0.0/
    ├── bitbake                         : bitbake
    ├── documentation
    ├── LICENSE
    ├── meta                            : OE-core
    ├── meta-yocto                      : yocto
    ├── meta-yocto-bsp                  : yocto bsp
    ├── oe-init-build-env               : init
    └── scripts                         : usefull script

Examining recipe
---------------------

why recipe is needed ?
    To simplify the building process

where can i find a sample recipe ?

.. code-block:: html

    #### inside poky ####
    pokymeta/recipes-extended
    # flac recipe
    poky-krogoth-15.0.0/meta/recipes-multimedia/flac
    ###########################################
    #### or in the web #####
    https://github.com/openembedded
    # apache2 recipe
    https://github.com/openembedded/meta-openembedded/tree/master/meta-webserver/recipes-httpd/apache2

what is a recipe ?

.. code-block:: html

    # contains a lot of metadata
    # details
    poky-krogoth-15.0.0/meta/recipes-core/base-passwd
    ├── base-passwd                                         : patches, etc
    │   ├── add_shutdown.patch
    └── base-passwd_3.5.29.bb                               : recipe's rule

How a recipe is built ?

.. code-block:: html

    #### Using bitbake ####
    bitbake package
    ## equal to
    bitbake -c do_build
    ############################
    ## list all task ##
    bitbake -c listtasks package
    ############################
    #### when debug a package, execute each task seperately is recomended ####
    ##   do_build = do_fetch -> do_unpack -> do_patch -> do_configure -> do_compile -> do_install
    ## -> do_populate_sysroot -> do_package_*

A lot of recipe -> how to manage them ?

.. code-block:: html

    ##### group recipe into layer ####
    poky-krogoth-15.0.0/meta/recipes-core
    ├── base-files
    ├── base-passwd
    ├── bsd-headers
    ...
    ## see Examining layer for more detail


Start the first build
----------------------

以下のコマンドはdefault settingでlinux imageを生成する。

.. code-block:: html

    #### init env ####
    source oe-init-build-env build_directory
    cd build_directory
    ##### change local ####
    # MACHINE ??= "qemux86"
    # PACKAGE_CLASSES ?= "package_rpm"
    #### build image ####
    bitbake core-image-minimal
    # then run on qemu
    runqemu qemux86 tmp/deploy/images/qemux86/core-image-minimal-qemux86.ext4
    # PACKAGE_CLASSES ?= "package_rpm"

what is inside build_directory ?

.. code-block:: html

    /poky_build
    ├── conf                        : build configuration
        ├── bblayers.conf           : define layer
        ├── local.conf              : define architecture, build process' property
    ├── downloads                   : downloaded source code
    └── tmp                         : build process's product
        ├── deploy
            ├── images              : linux image
            ├── rpm                 : software package
            └── sdk                 : software sdk
        ├── work

Examining layer
------------------

layer = collection of recipes, bsp, application stack
layer has "priority" and can override old layer's setting

How to use layers ?

.. code-block:: html

    #### add layer to conf/bblayers.conf
    BBLAYERS ?= " \
      /home/gachiemchiep/workspace/yocto/poky-krogoth-15.0.0/meta \
      /home/gachiemchiep/workspace/yocto/poky-krogoth-15.0.0/meta-poky \
      /home/gachiemchiep/workspace/yocto/poky-krogoth-15.0.0/meta-yocto-bsp \
      "
    ## Hint
    NEVER touch yocto's source layer
    add new layer with highest priority to override

How to create custom layer ?

.. code-block:: html

    # create a directory like this
    meta-tr/
    ├── conf
    │   └── layer.conf              -> is required
    └── recipes-core
    ################################
    # layer.conf
    BBPATH =. "${LAYERDIR}:"
    BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
                ${LAYERDIR}/recipes-*/*/*.bbappend"
    ###
    BBFILE_COLLECTIONS += "tr"                  # tr = layer's name
    BBFILE_PATTERN_tr = "^${LAYERDIR}/"
    BBFILE_PRIORITY_tr = "10"
    LAYERDEPENDS_tr = "core"
    REQUIRED_POKY_BBLAYERS_CONF_VERSION = "2"

What we can do by adding custom layers ?

.. code-block:: html

    # make new image recipe
    # patch, deploy new software
    # etc

Creating a Custom Image Recipe

.. code-block:: html

    # default image recipe is "core-image-minimal"
    # create a new image recipe
    # name : tr-image
    # core-image-minimal + " psplash dropbear "
    meta-tr/recipes-core/
            └── images
                 └── tr-image.bb
    #####################################
    # add custom layer to conf/bblayers.conf
    BBLAYERS ?= " \
      /home/gachiemchiep/workspace/yocto/poky-krogoth-15.0.0/meta \
      /home/gachiemchiep/workspace/yocto/poky-krogoth-15.0.0/meta-poky \
      /home/gachiemchiep/workspace/yocto/poky-krogoth-15.0.0/meta-yocto-bsp \
      /home/gachiemchiep/workspace/yocto/yocto-layers/meta-tr \
      "
    #### build ####
    bitbake tr-image
    #### run ####
    runqemu qemux86 tmp/deploy/images/qemux86/tr-image-qemux86.ext4 nographic

Custom image's common task

.. code-block:: html

    TODO
    # change default user, add new user
    # image type to read-only filesystem
    # prepare package management
    # deploy new software (using eclipse)

Common task's details
---------------------------

Change root , add new user

.. code-block:: html

    #### base-passwd のpasswordを再有効
    # see base-passwd for more detail
    #########################################################################
    #### use useradd to modify user and password    images/tr-image.bb
    # Add user/password
    inherit extrausers
    EXTRA_USERS_PARAMS = "\
                        useradd -P conmeocat gachiemchiep; \
                        usermod -p conmeocat root; \
    "
    #########################################################################
    #### If we want to secure the password -> add as md5 type
    openssl passwd -1 -salt xyz century1500
    usermod -p '\$1\$xyz\$2BeJPTd2Mc9PELxX1newk0' root; \
    # $1$xyz\$2BeJPTd2Mc9PELxX1newk0
    # $ is special character
    # -> \$1\$xyz\$2BeJPTd2Mc9PELxX1newk0

Image type to read-only filesystem

.. code-block:: html

    #### add read-only feature  images/tr-image.bb
    EXTRA_IMAGE_FEATURES_append = " read-only-rootfs "
    #### move server, boot, system's log to memory
    # see initscripts for more detail

Add package manager

.. code-block:: html

    #### user yocto's smart management
    #### first create local server
    ## then add options to tr-image.bb
    # smartの設定
    add_smart_config() {
        smart --data-dir=${IMAGE_ROOTFS}/var/lib/smart  channel --add all type=rpm-md baseurl=http://192.168.0.21/pkgrepo.yocto.NUC/all --yes;
        smart --data-dir=${IMAGE_ROOTFS}/var/lib/smart  channel --add core2_32 type=rpm-md baseurl=http://192.168.0.21/pkgrepo.yocto.NUC/core2_32 --yes;
        smart --data-dir=${IMAGE_ROOTFS}/var/lib/smart  channel --add core2_32_intel_common type=rpm-md baseurl=http://192.168.0.21/pkgrepo.yocto.NUC/core2_32_intel_common --yes;
        smart --data-dir=${IMAGE_ROOTFS}/var/lib/smart  channel --add valleyisland_32 type=rpm-md baseurl=http://192.168.0.21/pkgrepo.yocto.NUC/valleyisland_32 --yes;
    }
    # root filesystemを生成するために、add_smart_configの関数を実行
    ROOTFS_POSTPROCESS_COMMAND_append = " add_smart_config;"
    #### in case of read-only, remount it as rw
    sudo mount -o remount,rw /dev/sda /
    smart install htop
    reboot

Deploy new software

.. code-block:: html

    # write software
    # create recipe
    #### modify image recipe to include software to image
    # IMAGE_INSTALL += " newsoftware "
    #### see meta-tr/recipes-core/hello for more detail
    # HINT
    # if sources file is compressed as tar -> bitbake will uncompress, then move and compile
    # but sources code is not compressed -> bitbake will not move so compile will fail
    # remember to use ${WORKDIR}/source_file

TODO: Kernel

Advanced topics
----------------

working with gpio and raspberry pi

https://www.yoctoproject.org/tools-resources/presentations/devday-na-2015-advanced-lab

TODO : Compile, upload, update directly to raspberry pi using uboot and ethernet
        working with gpio  ->  LED, sensors, etc


Usefull Link
===========

https://www.yoctoproject.org/sites/default/files/ypdd-mar2015-intro-lab.pdf
