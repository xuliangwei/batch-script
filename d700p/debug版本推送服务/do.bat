adb root
@ping -n 3 127.0.0.1 > nul 2>nul
adb remount
adb push w:\qcom\mg\msm8953\out\target\product\d700p\system\framework\services.jar /system/framework/
adb reboot
pause
