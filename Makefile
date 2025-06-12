#Utility make file to automate debugging

#directories
binutils_dir = ../riscv-binutils/build-128up

.PHONY: all
all:
	$(MAKE) binutils

#check test in 128-test
.PHONY: check
check:
	./autocheck.sh	

.PHONY: reset
reset:
	$(MAKE) -C $(binutils_dir) clean
	$(MAKE) -C $(binutils_dir) distclean


.PHONY: reconfig
reconfig: 
	./binconfig.sh

.PHONY: binutils
binutils:
	$(MAKE) -C $(binutils_dir)
	$(MAKE) -C $(binutils_dir) install
