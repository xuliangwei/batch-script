@echo off
@setlocal

:start
@echo 将文件系统挂载为可读写
adb root
adb remount | find "succeeded"
if not %errorlevel% == 0 goto failed



@REM =============== 这段可以自定义命令 begin ===============
@echo adb push WCNSS_qcom_wlan_nv.bin /persist/
adb push x:/qcom/msm8916-lollipop/out/target/product/msm8916_d500p/system/lib/librfid_r2000.so /system/lib/ | find "100"
adb push x:/qcom/msm8916-lollipop/out/target/product/msm8916_d500p/system/lib64/librfid_r2000.so /system/lib64/ | find "100"
adb push x:/qcom/msm8916-lollipop/out/target/product/msm8916_d500p/system/app/UHFServer /system/app/ | find "100"
adb push x:/qcom/msm8916-lollipop/out/target/product/msm8916_d500p/system/framework/uhf.jar /system/framework/ | find "100"
if not %errorlevel% == 0 goto failed
@REM =============== 这段可以自定义命令 end   ===============



:success
@REM 成功后显示为绿色
@color 0a
@echo;
@echo ********************* 结果: 成功 :-)  *********************
@echo;
adb reboot
goto end

:failed:
@REM 失败后显示为红色
@color 0c
@echo;
@echo ********************* 结果: 失败 :-(  *********************
@echo;
goto end

:end
pause
@color
@endlocal
