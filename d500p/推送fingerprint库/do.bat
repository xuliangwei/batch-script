@echo off
@setlocal

:start
@echo ���ļ�ϵͳ����Ϊ�ɶ�д
adb root
adb remount | find "succeeded"
if not %errorlevel% == 0 goto failed



@REM =============== ��ο����Զ������� begin ===============
adb push 32/finger_print.msm8916.so /system/lib/hw/ | find "100"
adb push 64/finger_print.msm8916.so /system/lib64/hw/ | find "100"
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
goto end

:end
pause
@color
@endlocal
