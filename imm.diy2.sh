#!/bin/bash
###
 # @Author: xiawang1024
 # @Date: 2023-01-06 15:29:51
 # @LastEditTime: 2023-01-06 15:30:17
 # @LastEditors: xiawang1024
 # @Description: 
 # @FilePath: /OpenWrt-360T7/diy2.sh
 # 工作，生活，健康
### 
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

# Modify default IP
sed -i 's/192.168.6.1/192.168.88.7/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.88.7/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.88.7/g' ppackage/base-files/luci2/bin/config_generate
#sed -i "s/hostname='ImmortalWrt'/hostname='OpenWRT-360T7'/g" package/base-files/files/bin/config_generate
sed -i "s/DISTRIB_DESCRIPTION=.*/DISTRIB_DESCRIPTION='OpenWrt By 神棍 $(date +"%Y%m%d")'/g" package/base-files/files/etc/openwrt_release

# 强制内置 MT7981 + MT7976 DBDC EEPROM（360T7 必需）
EEP_DIR="target/linux/mediatek/files/lib/firmware/mediatek"

mkdir -p ${EEP_DIR}

wget -O ${EEP_DIR}/mt7981_eeprom_mt7976_dbdc.bin \
https://raw.githubusercontent.com/openwrt/mt76/eb567bc7f9b692bbf1ddfe31dd740861c58ec85b/firmware/mt7981_eeprom_mt7976_dbdc.bin
