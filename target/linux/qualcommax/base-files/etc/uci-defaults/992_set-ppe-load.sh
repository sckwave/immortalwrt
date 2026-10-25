#!/bin/sh
logger -t "my-setup" "Configuration applied successfully."
#指定文件路径
FILE="/usr/share/rpcd/ucode/luci"

#添加PPE状态显示
[ -f "$FILE" ] && sed -i "s#const fd = popen('top.*')#const fd = popen('/sbin/cpuusage')#g" "$FILE"

echo "starting my config files"

exit 0
