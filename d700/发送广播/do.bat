@echo off
@setlocal



@REM =============== 这段可以自定义命令 begin ===============
@echo adb shell am broadcast -a com.seuic.server.BOOT_COMPLETED -f 32
adb shell am broadcast -a com.seuic.server.BOOT_COMPLETED -f 32
if not %errorlevel% == 0 goto failed
@REM =============== 这段可以自定义命令 end   ===============



:success
@REM 成功后显示为绿色
@color 0a
@echo;
@echo ********************* 结果: 成功 :-)  *********************
@echo;
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
