#!/usr/bin/bash

cd
cd 128-test/unit/
./prgchk_all.py 
cd ../global
make clean
make
make check
