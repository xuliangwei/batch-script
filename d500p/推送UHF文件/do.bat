@echo off
@setlocal

:start
@echo ���ļ�ϵͳ����Ϊ�ɶ�д
adb root
adb remount | find "succeeded"
if not %errorlevel% == 0 goto failed



@REM =============== ��ο����Զ������� begin ===============
@echo adb push WCNSS_qcom_wlan_nv.bin /persist/
adb push x:/qcom/msm8916-lollipop/out/target/product/msm8916_d500p/system/lib/librfid_r2000.so /system/lib/ | find "100"
adb push x:/qcom/msm8916-lollipop/out/target/product/msm8916_d500p/system/lib64/librfid_r2000.so /system/lib64/ | find "100"
adb push x:/qcom/msm8916-lollipop/out/target/product/msm8916_d500p/system/app/UHFServer /system/app/ | find "100"
adb push x:/qcom/msm8916-lollipop/out/target/product/msm8916_d500p/system/framework/uhf.jar /system/framework/ | find "100"
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
