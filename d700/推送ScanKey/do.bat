@echo off
@setlocal

:start
@echo ���ļ�ϵͳ����Ϊ�ɶ�д
adb root
adb remount | find "succeeded"
if not %errorlevel% == 0 goto failed



@REM =============== ��ο����Զ������� begin ===============
adb push x:/meige/LA.BR.1.2.4-05310-8x16.0/out/target/product/d700/system/app/ScanKeyServer /system/app/ | find "100"
adb push x:/meige/LA.BR.1.2.4-05310-8x16.0/out/target/product/d700/system/framework/scankey.jar /system/framework/ | find "100"
adb push x:/meige/LA.BR.1.2.4-05310-8x16.0/out/target/product/d700/system/lib/libkeypad.so /system/lib/ | find "100"
adb push x:/meige/LA.BR.1.2.4-05310-8x16.0/out/target/product/d700/system/lib64/libkeypad.so /system/lib64/ | find "100"
adb push x:/meige/LA.BR.1.2.4-05310-8x16.0/out/target/product/d700/system/etc/permissions/com.seuic.scankey.xml /system/etc/permissions/ | find "100"

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
