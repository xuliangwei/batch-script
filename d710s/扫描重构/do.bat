@echo off
@setlocal

:start
@echo 将文件系统挂载为可读写
adb root
ping -n 3 127.0.0.1 > nul 2>nul
adb remount

@REM =============== 这段可以自定义命令 begin ===============
@echo adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\vendor\lib64\hw\scanx3.mt6765.so /vendor/lib64/hw/
adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\vendor\lib64\hw\scanx3.mt6765.so /vendor/lib64/hw/ | find "100"
@echo adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\vendor\lib64\hw\vendor.hardware.scanner@1.0-impl.so /vendor/lib64/hw/
adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\vendor\lib64\hw\vendor.hardware.scanner@1.0-impl.so /vendor/lib64/hw/ | find "100"
@echo adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\vendor\lib64\libScanDevice.so /vendor/lib64/ 
adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\vendor\lib64\libScanDevice.so /vendor/lib64/ | find "100"
@rem echo adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\vendor\lib64\vendor.hardware.scanner@1.0-adapter-helper.so /vendor/lib64/ | find "100"
@rem adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\vendor\lib64\vendor.hardware.scanner@1.0-adapter-helper.so /vendor/lib64/ | find "100"
@echo adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\vendor\lib64vendor.hardware.scanner@1.0.so /vendor/lib64/ | find "100"
adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\vendor\lib64vendor.hardware.scanner@1.0.so /vendor/lib64/ | find "100"
@echo adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\vendor\bin\hw\vendor.hardware.scanner@1.0-service /vendor/bin/hw/ | find "100"
adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\vendor\bin\hw\vendor.hardware.scanner@1.0-service /vendor/bin/hw/ | find "100"
@rem echo adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\system\lib64\vendor.hardware.scanner@1.0-adapter-helper.so /system/lib64/ | find "100"
@rem adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\system\lib64\vendor.hardware.scanner@1.0-adapter-helper.so /system/lib64/ | find "100"
@echo adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\system\lib64\libScannerInterface.so /system/lib64/
adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\system\lib64\libScannerInterface.so /system/lib64/
@echo adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\system\lib64\vendor.hardware.scanner@1.0.so /system/lib64/
adb push v:\mtk\d710s\out\target\product\bird_k62v1_64_bsp\system\lib64\vendor.hardware.scanner@1.0.so /system/lib64/
@REM =============== 这段可以自定义命令 end   ===============

:success
@REM 成功后显示为绿色
@color 0a
@echo;
@echo ********************* 结果: 成功 :-)  *********************
@echo;
@echo 重新启动
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
