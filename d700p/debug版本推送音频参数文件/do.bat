adb root
adb remount
adb push QRD_Speaker_cal.acdb /system/etc/acdbdata/QRD/
adb push QRD_Headset_cal.acdb /system/etc/acdbdata/QRD/
adb push QRD_Handset_cal.acdb /system/etc/acdbdata/QRD/
adb reboot
pause
