adb shell "getprop" > getprop.txt
adb shell "ps -e" > ps.txt
adb shell "cat /proc/cpuinfo" > cpuinfo.txt
adb shell "cat /proc/meminfo" > meminfo.txt
adb shell "mount" > mount.txt
adb shell "dmesg" > dmesg.txt
adb shell "logcat -b all -d" > logcat.txt
adb shell "dumpsys" > dumpsys.txt
adb bugreport
