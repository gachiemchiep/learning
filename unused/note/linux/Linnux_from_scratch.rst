Linux from scratch
======================

Keywords
----------

Cross-compiling


Brieft
----------

How linux is built ? How each linux distribution is different from each other ?
This can answer all.

Detail
----------
Link

.. code-block:: html

    http://www.linuxfromscratch.org/

Linux From Scratch (LFS) is a project that provides you with step-by-step
instructions for building your own custom Linux system, entirely from source code.

Why:
    LFS teaches people how a Linux system works internally
    Building LFS produces a very compact Linux system
    LFS is extremely flexible

How LFS is build
    chroot
    they compile each package and make final image

pushd popd

Then download and check md5sum

Compile temporary tools which will be used to build LFS
    http://www.linuxfromscratch.org/lfs/view/stable/chapter04/creatingtoolsdir.html

#configure binutils

export LFS=/home/gachiemchiep/workspace/LFS/work_dir/
#ln -sv $LFS/tools /
export MAKEFLAGS='-j 4'

../configure --prefix=$LFS/tools            \
             --with-sysroot=$LFS       \
             --with-lib-path=$LFS/tools/lib \
             --target=$LFS_TGT          \
             --disable-nls              \
             --disable-werror

gcc
# note mpfr, gmp, mpc is inside gcc sources

../configure                                       \
    --target=$LFS_TGT                              \
    --prefix=$LFS/tools                                \
    --with-glibc-version=2.11                      \
    --with-sysroot=$LFS                            \
    --with-newlib                                  \
    --without-headers                              \
    --with-local-prefix=$LFS/tools                     \
    --with-native-system-header-dir=$LFS/tools/include \
    --disable-nls                                  \
    --disable-shared                               \
    --disable-multilib                             \
    --disable-decimal-float                        \
    --disable-threads                              \
    --disable-libatomic                            \
    --disable-libgomp                              \
    --disable-libquadmath                          \
    --disable-libssp                               \
    --disable-libvtv                               \
    --disable-libstdcxx                            \
    --enable-languages=c,c++


stuck here