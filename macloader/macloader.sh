#! /vendor/bin/sh

# Load mac address
cat /mnt/vendor/efs/wifi/.mac.info > /sys/wifi/mac_addr

# Load the driver
echo 1 > /sys/kernel/boot_wlan/boot_wlan
