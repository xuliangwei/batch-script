@echo off
@setlocal

:start
@echo ���ļ�ϵͳ����Ϊ�ɶ�д
adb root
adb remount | find "succeeded"
if not %errorlevel% == 0 goto failed



@REM =============== ��ο����Զ������� begin ===============
adb push x:/meige/msm8939-meige2/out/target/product/d700/system/app/ScanKeyServer /system/app/ | find "100"
adb push x:/meige/msm8939-meige2/out/target/product/d700/system/framework/scankey.jar /system/framework/ | find "100"
adb push x:/meige/msm8939-meige2/out/target/product/d700/system/lib/libhardkey.so /system/lib/ | find "100"
adb push x:/meige/msm8939-meige2/out/target/product/d700/system/lib64/libhardkey.so /system/lib64/ | find "100"
adb push x:/meige/msm8939-meige2/out/target/product/d700/system/etc/permissions/com.seuic.scankey.xml /system/etc/permissions/ | find "100"

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
