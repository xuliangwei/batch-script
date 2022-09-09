# 脚本说明

| 脚本                       | 作用                                                         |
| -------------------------- | ------------------------------------------------------------ |
| convert-scannerapi-jar.bat | 将Android Studio编译出来的ScannerAPI-va.b.c.jar<br/>转换成Android系统平台编译可识别的格式 |
| push-scannerapi-jar.bat    | 将ScannerAPI-va.b.c.jar推到设备，替换原来的ScannerAPI.jar<br/>前提：将ScannerAPI从boot jar中移除，编译并烧录userdebug版本，然后将文件系统设置为可读写。<br/>文件系统设置可读写 操作方法见设备文件系统可读写设置<br/> |
| log-scannerapi-jar.bat     | 清除log缓冲区中的日志，将新日志保存到当前目录下的1.txt文件中 |
| debug-scannerapi-jar.bat   | 调整日志打印级别                                             |
|                            |                                                              |

## 设备文件系统可读写设置

```bash
adb reboot bootloader
fastboot flashing unlock
...
adb root
adb disable-verity
adb reboot
```

