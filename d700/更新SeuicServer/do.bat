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



@REM =============== 这段可以自定义命令 begin ===============
@echo adb shell rm -rf /system/app/SeuicServer
adb shell rm -rf /system/app/SeuicServer
if not %errorlevel% == 0 goto failed
@echo adb push SeuicServer /system/app/
adb push SeuicServer /system/app/ | find "100"
if not %errorlevel% == 0 goto failed
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
