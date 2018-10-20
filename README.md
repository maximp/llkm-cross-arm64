# llkm-cross-arm64
Test loadable linux kernel module cross-compilation for arm64 at x86_64 Linux machine

Work platform:
```
# uname -a
Linux maxim 4.15.0-36-lowlatency #39-Ubuntu SMP PREEMPT Tue Sep 25 00:16:08 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
```

Install cross-compiler toolchain:
```
# sudo apt install -y gcc-7-aarch64-linux-gnu
# sudo ln -s /usr/bin/aarch64-linux-gnu-gcc-7 /usr/bin/aarch64-linux-gnu-gcc
```

Setup linux headers for arm64 arch:
```
# cd /usr/src/linux-headers-$(shell uname -r)
# sudo make ARCH=arm64 oldconfig
# sudo make ARCH=arm64 prepare
# sudo make ARCH=arm64 headers_check
# sudo make ARCH=arm64 headers_install
# sudo make ARCH=arm64 scripts
```

Go back to test module sources and make:
```
# make CROSS=/usr/bin/aarch64-linux-gnu-
```

Check:
```
# file hello.ko
hello.ko: ELF 64-bit LSB relocatable, ARM aarch64, version 1 (SYSV), BuildID[sha1]=2bd5a6a6b436899ee635ee7f44e8d4e97e3019e5, not stripped
```
