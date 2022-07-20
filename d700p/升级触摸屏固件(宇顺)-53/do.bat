@echo off
@setlocal

@echo 烧录debug版本的boot，以便推入文件
adb reboot bootloader
fastboot flash boot boot-debug.img
fastboot reboot

@echo 等待系统启动...
:wait
adb get-state > nul 2>nul
if %errorlevel% == 0 goto start
ping -n 2 127.0.0.1 > nul 2>nul
goto wait

:start
@echo 将文件系统挂载为可读写
adb root
adb remount | find "succeeded"
if not %errorlevel% == 0 goto failed

@echo 请解锁屏幕后，输入任意键进入升级阶段
pause

@REM =============== 这段可以自定义命令 begin ===============
@echo adb push PRXXX_fw.img /system/etc/firmware/
adb push PRXXX_fw.img /system/etc/firmware/ | find "100"
if not %errorlevel% == 0 goto failed
set ADB_TEMP_FILE=adb-temp.txt
echo init > %ADB_TEMP_FILE%
for /l %%i in (0,1,20) do call :find_device_and_update_firmware %%i
findstr updated %ADB_TEMP_FILE%
if not %errorlevel% == 0 (
	if exist %ADB_TEMP_FILE% del %ADB_TEMP_FILE%
	goto failed
)
if exist %ADB_TEMP_FILE% del %ADB_TEMP_FILE%
goto success

:find_device_and_update_firmware
adb shell cat /sys/class/input/input%~1/config_id | find "72.83.48."
if %errorlevel% == 0 (
	@echo 正在升级触摸固件，时间稍长，请耐心等待...
	adb shell "echo 1 > /sys/class/input/input"%~1"/force_update_fw"
	adb shell cat /sys/class/input/input%~1/config_id | find "72.83.48.53"
)
if %errorlevel% == 0 echo updated > %ADB_TEMP_FILE%
exit /b
@REM =============== 这段可以自定义命令 end   ===============



:success
@REM 成功后显示为绿色
@color 0a
@echo;
@echo ********************* 结果: 成功 :-)  *********************
@echo;
@echo 烧录回原user版本的boot
adb reboot bootloader
fastboot flash boot boot.img
fastboot reboot
goto end

:failed:
@REM 失败后显示为红色
@color 0c
@echo;
@echo ********************* 结果: 失败 :-(  *********************
@echo;
goto end

:end
pause
@color
@endlocal
