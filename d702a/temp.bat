echo in_temp_ambient_raw: > 1.txt
adb shell "cat /sys/bus/i2c/devices/1-005b/iio:device2/in_temp_ambient_raw" >> 1.txt
echo in_temp_object_raw: >> 1.txt
adb shell "cat /sys/bus/i2c/devices/1-005b/iio:device2/in_temp_object_raw" >> 1.txt
echo in_temp_object_filter_low_pass_3db_frequency: >> 1.txt
adb shell "cat /sys/bus/i2c/devices/1-005b/iio:device2/in_temp_object_filter_low_pass_3db_frequency" >> 1.txt
echo in_temp_object_filter_low_pass_3db_frequency_available: >> 1.txt
adb shell "cat /sys/bus/i2c/devices/1-005b/iio:device2/in_temp_object_filter_low_pass_3db_frequency_available" >> 1.txt
echo in_temp_object_calibemissivity: >> 1.txt
adb shell "cat /sys/bus/i2c/devices/1-005b/iio:device2/in_temp_object_calibemissivity" >> 1.txt
echo in_temp_offset: >> 1.txt
adb shell "cat /sys/bus/i2c/devices/1-005b/iio:device2/in_temp_offset" >> 1.txt
echo in_temp_scale: >> 1.txt
adb shell "cat /sys/bus/i2c/devices/1-005b/iio:device2/in_temp_scale" >> 1.txt
