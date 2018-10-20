//#define __KERNEL__
//#define MODULE

#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Maxim Perenesenko");
MODULE_DESCRIPTION("A simple Linux Helloworld driver");
MODULE_VERSION("0.1");

static int __init init_hello_module(void)
{
    printk("Hello World!\n");
    return 0;
}

static void __exit cleanup_hello_module(void)
{
    printk("Bye, Bye\n");
}

module_init(init_hello_module);
module_exit(cleanup_hello_module);

