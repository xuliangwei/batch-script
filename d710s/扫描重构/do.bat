@echo off
@setlocal

:start
@echo ���ļ�ϵͳ����Ϊ�ɶ�д
adb root
ping -n 3 127.0.0.1 > nul 2>nul
adb remount

@REM =============== ��ο����Զ������� begin ===============
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
@REM =============== ��ο����Զ������� end   ===============

:success
@REM �ɹ�����ʾΪ��ɫ
@color 0a
@echo;
@echo ********************* ���: �ɹ� :-)  *********************
@echo;
@echo ��������
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
