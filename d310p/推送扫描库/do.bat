@echo off
@setlocal

adb disconnect

@echo 等待系统启动...
:wait
adb get-state > nul 2>nul
if %errorlevel% == 0 goto start
ping -n 2 127.0.0.1 > nul 2>nul
goto wait

:start
@echo 将文件系统挂载为可读写
adb root
ping -n 5 127.0.0.1 > nul 2>nul
adb remount | find "succeeded"
if not %errorlevel% == 0 goto failed



@REM =============== 这段可以自定义命令 begin ===============
copy /y w:\qcom\yc\d310p\out\target\product\d310p\system\lib\hw\scan56xx.msm8937.so lib\hw\
@echo adb push lib  /system/
adb push lib  /system/ | find "100"
if not %errorlevel% == 0 goto failed
@REM =============== 这段可以自定义命令 end   ===============



:success
@REM 成功后显示为绿色
@color 0a
@echo;
@echo ********************* 结果: 成功 :-)  *********************
@echo;
adb reboot
goto end

:failed:
@REM 失败后显示为红色
@color 0c
@echo;
@echo ********************* 结果: 失败 :-(  *********************
@echo;
adb reboot
goto end

:end
pause
@color
@endlocal
