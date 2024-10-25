#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 1.更改默认IP
sed -i 's/192.168.1.1/192.168.10.250/g' package/base-files/files/bin/config_generate

# 2.清除默认密码
# sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' package/lean/default-settings/files/zzz-default-settings

# 3.修改主机名
#sed -i 's/OpenWrt/OpenWrt/g' package/base-files/files/bin/config_generate

# 4.修改版本号
#sed -i "s/OpenWrt /Compiled $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 5.修改默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g ' feeds/luci/collections/luci/Makefile

# 6.固件名添加生成时间
#sed -i 's/IMG_PREFIX:=$(VERSION_DIST_SANITIZED)/IMG_PREFIX:=Build-$(shell date +%Y%m%d-%H%M%S)-$(VERSION_DIST_SANITIZED)/g' include/image.mk

# 7.切换5.15内核
#sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=5.15/g' target/linux/x86/Makefile
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.10/KERNEL_TESTING_PATCHVER:=6.1/g' target/linux/x86/Makefile

# 8.fix bios boot partition is under 1 MiB
sed -i 's/256/1024/g' target/linux/x86/image/Makefile

# 9.kernel:remove outdated patches
# rm -rf target/linux/generic/hack-5.10/221-module_exports.patch
# rm -rf target/linux/generic/hack-5.15/221-module_exports.patch

# 10.恢复主机型号
#sed -i 's/(dmesg | grep .*/{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
#sed -i '/h=${g}.*/d' package/lean/autocore/files/x86/autocore
#sed -i 's/echo $h/echo $g/g' package/lean/autocore/files/x86/autocore

# 11.关闭串口跑码
#sed -i 's/console=tty0//g'  target/linux/x86/image/Makefile

# 12.修正软件源
sed -i "s/mirrors.tencent.com\/lede.*\/etc\/opkg\/distfeeds.conf.*/&\nsed -i '\/kenzo\/d' \/etc\/opkg\/distfeeds.conf\nsed -i '\/small\/d' \/etc\/opkg\/distfeeds.conf/" ./package/lean/default-settings/files/zzz-default-settings
