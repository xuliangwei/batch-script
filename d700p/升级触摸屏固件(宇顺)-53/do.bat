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

@echo �������Ļ��������������������׶�
pause

@REM =============== ��ο����Զ������� begin ===============
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
	@echo �������������̼���ʱ���Գ��������ĵȴ�...
	adb shell "echo 1 > /sys/class/input/input"%~1"/force_update_fw"
	adb shell cat /sys/class/input/input%~1/config_id | find "72.83.48.53"
)
if %errorlevel% == 0 echo updated > %ADB_TEMP_FILE%
exit /b
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
