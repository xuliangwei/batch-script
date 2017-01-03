@ECHO OFF
@setlocal enableDelayedExpansion
REM 默认白色字符 黑色背景；烧录过程出错，会以变为红色字符警告，成功则变为绿色字符
color
SET ADB_TMP_FILE=adb_tmp_.txt
SET CMD_TMP_FILE=cmd_tmp_.txt

@ECHO 切换到fastboot模式。。。
@adb reboot bootloader

REM 延时5S预留机器重启时间，否则下面的烧写命令都失效
@ping 127.0.0.1 -n 3 >nul
@ECHO 如有提示安装驱动，请先安装驱动再点击任意键
pause


title 物联网移动终端烧录工具
@echo                   前提：必须先进入bootloader模式才能运行本脚本！
@echo                   注意：    如遇到错误，字体都会变为红色！
@echo .
@echo                        ==============================
@echo                           【物联网移动终端烧录工具】
@echo                              当前支持型号：D700
@echo                        ==============================
@echo .
@echo 待烧写镜像所在目录      %~dp0

:start
ECHO .
ECHO ______________________
ECHO 步骤一：检测设备。。。
ECHO .
fastboot devices >%ADB_TMP_FILE%
@findstr "fastboot" %ADB_TMP_FILE%
IF !ERRORLEVEL! EQU 0 ( ECHO 设备----已连接 ) else ( echo 错误：请检查设备连接？？？ & goto failed_proc )
ECHO .
ECHO ______________________
ECHO 步骤二：烧录各分区镜像
ECHO .
REM 已烧写分区数统计
@set /a tatal=0

if exist NON-HLOS.bin (
	@echo flash modem ...
	@fastboot flash modem NON-HLOS.bin>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo modem----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo modem--OK-- && set /a tatal+=1) else (echo modem----Failed---- && goto failed_proc)
)
if exist sbl1.mbn (
	@echo flash sbl1 ...
	@fastboot flash sbl1 sbl1.mbn>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo sbl1----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo sbl1--OK-- && set /a tatal+=1) else (echo sbl1----Failed---- && goto failed_proc)
)
if exist sdi.mbn (
	@echo flash sdi ...
	@fastboot flash sdi sdi.mbn>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo sdi----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo sdi--OK-- && set /a tatal+=1) else (echo sdi----Failed---- && goto failed_proc)
)
if exist rpm.mbn (
	@echo flash rpm ...
	@fastboot flash rpm rpm.mbn>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo rpm----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo rpm--OK-- && set /a tatal+=1) else (echo rpm----Failed---- && goto failed_proc)
)
if exist tz.mbn (
	@echo flash tz ...
	@fastboot flash tz tz.mbn>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo tz----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo tz--OK-- && set /a tatal+=1) else (echo tz----Failed---- && goto failed_proc)
)

if exist emmc_appsboot.mbn (
	@echo flash aboot ...
	@fastboot flash aboot emmc_appsboot.mbn>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo aboot----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo aboot--OK-- && set /a tatal+=1) else (echo aboot----Failed---- && goto failed_proc)
)
if exist boot.img (
	@echo flash boot ...
	@fastboot flash boot boot.img>%CMD_TMP_FILE% 2>&1
	@findstr /I "Failed" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo boot----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo boot--OK-- && set /a tatal+=1) else (echo boot----Failed---- && goto failed_proc)
)
if exist recovery.img (
	@echo flash recovery ...
	@fastboot flash recovery recovery.img>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo recovery----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo recovery--OK-- && set /a tatal+=1) else (echo recovery----Failed---- && goto failed_proc)
)
if exist persist.img (
	@echo flash persist ...
	@fastboot flash persist persist.img>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo persist----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo persist--OK-- && set /a tatal+=1) else (echo persist----Failed---- && goto failed_proc)
)
if exist usbdisk.img (
	@echo flash usbmsc ...
	@fastboot flash usbmsc usbdisk.img>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo usbmsc----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo usbmsc--OK-- && set /a tatal+=1) else (echo usbmsc----Failed---- && goto failed_proc)
)
if exist oem.img (
	@echo flash oem ...
	@fastboot flash oem oem.img>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo oem----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo oem--OK-- && set /a tatal+=1) else (echo oem----Failed---- && goto failed_proc)
)
if exist splash.img (
	@echo flash splash ...
	@fastboot flash splash splash.img>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo splash----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo splash--OK-- && set /a tatal+=1) else (echo splash----Failed---- && goto failed_proc)
)
if exist pad.bin (
	@echo flash splash ...
	@fastboot flash pad pad.bin>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo pad----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo pad--OK-- && set /a tatal+=1) else (echo pad----Failed---- && goto failed_proc)
)
if exist cache.img (
	@echo flash cache ...
	@fastboot flash cache cache.img>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo cache----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo cache--OK-- && set /a tatal+=1) else (echo cache----Failed---- && goto failed_proc)
)
if exist userdata.img (
	@echo flash userdata ...
	@fastboot flash userdata userdata.img>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo userdata----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo userdata--OK-- && set /a tatal+=1) else (echo userdata----Failed---- && goto failed_proc)
)
if exist system.img (
	@echo flash system ...
	@fastboot flash system system.img>%CMD_TMP_FILE% 2>&1
	@findstr /I "FAILED" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo system----Failed---- && goto failed_proc)
	@findstr /I "finished" %CMD_TMP_FILE%
	IF !ERRORLEVEL! EQU 0 (echo system--OK-- && set /a tatal+=1) else (echo system----Failed---- && goto failed_proc)
)

@fastboot erase config
@fastboot erase devinfo

REM 下面这2个没有分区表,Ignored
REM @fastboot flash PrimaryGPT gpt_main0.bin
REM @fastboot flash BackupGPT gpt_backup0.bin

REM 烧录成功，字体显示为绿色
@color 0a
ECHO .
ECHO ._______________Burned %tatal% images______________
ECHO .=======================OK=========================烧录完成！
ECHO .
call :delete_temp_files
REM 正常模式重启
ECHO 确定全部完成再点击任意键，机器即重启
@fastboot reboot
goto end

:delete_temp_files
REM 删除临时产生的文件
del %ADB_TMP_FILE%
del %CMD_TMP_FILE%
exit /b

REM 烧录过程出错,会以红色字体显示
:failed_proc
@color 0c
ECHO .
ECHO ._______________Burned %tatal% images______________
@echo.=======================FAILED=====================烧写过程出错!!!
ECHO .
@call :delete_temp_files

:end
pause

@endlocal



