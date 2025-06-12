#!/usr/bin/bash
cd ../riscv-binutils/build-128up/
CFLAGS="-O0 -g" CXXFLAGS="-O0 -g" ../configure --prefix=$HOMEDIR/sandbox \
                                                   --enable-maintainer-mode \
                                                   --target=riscv128-unknown-elf

