@echo off
@setlocal



@REM =============== ��ο����Զ������� begin ===============
@echo adb shell am broadcast -a com.seuic.server.BOOT_COMPLETED -f 32
adb shell am broadcast -a com.seuic.server.BOOT_COMPLETED -f 32
if not %errorlevel% == 0 goto failed
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
