qemu-system-riscv64  -nographic -bios none -cpu x-rv128 -accel tcg,thread=single -machine virt -kernel $1.x -d plugin -plugin /home/fred/qemu-riscv128/build-elf128/contrib/plugins/libexeclog.so 2> trace.txt
vim trace.txt
