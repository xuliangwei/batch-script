@echo off
@setlocal

:start
@echo ���ļ�ϵͳ����Ϊ�ɶ�д
adb root
adb remount | find "succeeded"
if not %errorlevel% == 0 goto failed



@REM =============== ��ο����Զ������� begin ===============
@echo adb push x:/meige/msm8939-meige2/out/target/product/d700/system/framework/services.jar /system/framework/
adb push x:/meige/msm8939-meige2/out/target/product/d700/system/framework/services.jar /system/framework/ | find "100"
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
