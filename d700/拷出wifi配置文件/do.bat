adb shell "seustubtest cp /persist/WCNSS_qcom_wlan_nv.bin /sdcard/"
adb pull  /sdcard//WCNSS_qcom_wlan_nv.bin .

adb shell "seustubtest cp /data/misc/wifi/WCNSS_qcom_cfg.ini /sdcard/"
adb pull  /sdcard//WCNSS_qcom_cfg.ini .
