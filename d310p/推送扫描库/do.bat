@echo off
@setlocal

adb disconnect

@echo �ȴ�ϵͳ����...
:wait
adb get-state > nul 2>nul
if %errorlevel% == 0 goto start
ping -n 2 127.0.0.1 > nul 2>nul
goto wait

:start
@echo ���ļ�ϵͳ����Ϊ�ɶ�д
adb root
ping -n 5 127.0.0.1 > nul 2>nul
adb remount | find "succeeded"
if not %errorlevel% == 0 goto failed



@REM =============== ��ο����Զ������� begin ===============
copy /y w:\qcom\yc\d310p\out\target\product\d310p\system\lib\hw\scan56xx.msm8937.so lib\hw\
@echo adb push lib  /system/
adb push lib  /system/ | find "100"
if not %errorlevel% == 0 goto failed
@REM =============== ��ο����Զ������� end   ===============



:success
@REM �ɹ�����ʾΪ��ɫ
@color 0a
@echo;
@echo ********************* ���: �ɹ� :-)  *********************
@echo;
adb reboot
goto end

:failed:
@REM ʧ�ܺ���ʾΪ��ɫ
@color 0c
@echo;
@echo ********************* ���: ʧ�� :-(  *********************
@echo;
adb reboot
goto end

:end
pause
@color
@endlocal
