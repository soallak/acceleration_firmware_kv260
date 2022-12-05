#!/bin/bash

# stop script on first error
set -e

# variables that define the result
install_dir="/opt/aarch64-linux-gnu-kv260-ubuntu-20.04"
sysroot_dir="/opt/sysroot-kv260-ubuntu-20.04"

arch=aarch64
gcc_version='9.4.0'
binutils_version='2.34'
target=aarch64-linux-gnu
nproc=32
workdir=gcc_for_kv260_ubuntu_20.04.2


function backup_and_create {
  local newdir=$1
  if [[ -d $newdir ]]; then
    oldnewdir=$newdir'.old'
    if [[ -d $oldnewdir ]]; then
      rm -rf $oldnewdir
    fi
    mv $newdir $oldnewdir

  fi
  mkdir $newdir
}

backup_and_create $install_dir
backup_and_create $workdir

# do everything else in a separate directory
cd $workdir

# get sources
curl -Lo binutils.tar.bz2 \
  "https://ftpmirror.gnu.org/binutils/binutils-$binutils_version.tar.bz2"
curl -Lo gcc.tar.xz \
  "https://ftp.wayne.edu/gnu/gcc/gcc-$gcc_version/gcc-$gcc_version.tar.xz"


# build binutils
mkdir binutils_source
cd binutils_source
tar --strip-components 1 -xf ../binutils.tar.bz2
mkdir ../binutils_build
cd ../binutils_build
../binutils_source/configure \
  --prefix="$install_dir" \
  --target="$target" \
  --disable-multilib \
  --with-sysroot="$sysroot_dir"

make -j $nproc
make install
cd ..

# build gcc
mkdir gcc_source
cd gcc_source
tar --strip-components 1 -xf ../gcc.tar.xz
mkdir ../gcc_build
cd ../gcc_build
../gcc_source/configure \
  --prefix="$install_dir" \
  --target="$target" \
  --disable-multilib \
  --with-sysroot="$sysroot_dir" \
  --enable-languages=c,c++
make -j $nproc
make install
cd ..

echo "Successfully compiled 'binutils' and 'gcc'"
