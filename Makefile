# sudo apt install -y gcc-7-aarch64-linux-gnu
# sudo ln -s /usr/bin/aarch64-linux-gnu-gcc-7 /usr/bin/aarch64-linux-gnu-gcc
#
# cd /usr/src/linux-headers-$(shell uname -r)
# sudo make ARCH=arm64 oldconfig
# sudo make ARCH=arm64 prepare
# sudo make ARCH=arm64 headers_check
# sudo make ARCH=arm64 headers_install
# sudo make ARCH=arm64 scripts
#
# make CROSS=/usr/bin/aarch64-linux-gnu-

obj-m += hello.o

all:
	make ARCH=arm64 CROSS_COMPILE=$(CROSS) -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
