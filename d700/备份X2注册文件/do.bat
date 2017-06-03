@echo off
@setlocal

:start



@REM =============== ��ο����Զ������� begin ===============
adb shell "seustubtest mkdir -p /persist/SuperBackup"
if not %errorlevel% == 0 goto failed

set ADB_TEMP_FILE=adb-temp.txt
echo > %ADB_TEMP_FILE%
adb shell "seustubtest cp /storage/sdcard0/sdLicense /persist/SuperBackup/" >  %ADB_TEMP_FILE%
findstr cp %ADB_TEMP_FILE%
if %errorlevel% == 0 (
	if exist %ADB_TEMP_FILE% del %ADB_TEMP_FILE%
	goto failed
)
if exist %ADB_TEMP_FILE% del %ADB_TEMP_FILE%
goto success

@REM =============== ��ο����Զ������� end   ===============



:success
@REM �ɹ�����ʾΪ��ɫ
@color 0a
@echo;
@echo ********************* ���: �ɹ� :-)  *********************
@echo;
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
