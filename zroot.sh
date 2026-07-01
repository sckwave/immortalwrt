#!/bin/sh
# 1. 挂载必要的基础文件系统
echo "starting change rootfs"
mount -t proc proc /proc
mount -t sysfs sysfs /sys
mount -t devtmpfs devtmpfs /dev

# 2. （可选）加载磁盘驱动模块或扫描设备
# 例如 insmod /lib/modules/your_driver.ko 或 mdev -s

# 3. 挂载真实的根文件系统（假设真实根在 /dev/sda1）
mkdir /mnt/root
mount -t ext4 /dev/sda1 /mnt/root

# 4. 清理并切换到真实根目录 (PID 必须为 1)
# 注意：必须使用 exec 调用 switch_root
exec switch_root /mnt/root /sbin/init
