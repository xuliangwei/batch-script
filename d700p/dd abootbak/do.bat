aboot root
adb push abootbak /sdcard/
adb shell dd if=/sdcard/abootbak of=/dev/block/bootdevice/by-name/aboot
adb reboot
