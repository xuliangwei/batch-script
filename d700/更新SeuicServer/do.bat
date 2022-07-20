@echo off
@setlocal

@echo ��¼debug�汾��boot���Ա������ļ�
adb reboot bootloader
fastboot flash boot boot-debug.img
fastboot reboot

@echo �ȴ�ϵͳ����...
:wait
adb get-state > nul 2>nul
if %errorlevel% == 0 goto start
ping -n 2 127.0.0.1 > nul 2>nul
goto wait

:start
@echo ���ļ�ϵͳ����Ϊ�ɶ�д
adb root
adb remount | find "succeeded"
if not %errorlevel% == 0 goto failed



@REM =============== ��ο����Զ������� begin ===============
@echo adb shell rm -rf /system/app/SeuicServer
adb shell rm -rf /system/app/SeuicServer
if not %errorlevel% == 0 goto failed
@echo adb push SeuicServer /system/app/
adb push SeuicServer /system/app/ | find "100"
if not %errorlevel% == 0 goto failed
@REM =============== ��ο����Զ������� end   ===============



:success
@REM �ɹ�����ʾΪ��ɫ
@color 0a
@echo;
@echo ********************* ���: �ɹ� :-)  *********************
@echo;
@echo ��¼��ԭuser�汾��boot
adb reboot bootloader
fastboot flash boot boot.img
fastboot reboot
goto end

:failed:
@REM ʧ�ܺ���ʾΪ��ɫ
@color 0c
@echo;
@echo ********************* ���: ʧ�� :-(  *********************
@echo;
goto end

:end
pause
@color
@endlocal
