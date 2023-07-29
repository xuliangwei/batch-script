@echo off
setlocal enabledelayedexpansion

echo 列出当前目录下的.torrent文件：
echo ---------------------------------------

rem 获取当前目录路径
for /f "tokens=*" %%i in ('cd') do set "current_dir=%%i"

rem 列出当前目录下的.torrent文件（包括隐藏属性的）
dir /b /a:-d /s "%current_dir%\*.torrent" 2>nul > "%temp%\torrent_list.txt"

rem 检查是否找到.torrent文件
if %errorlevel% neq 0 (
    echo 没有找到.torrent文件！
    pause
    exit
)

rem 显示找到的.torrent文件
type "%temp%\torrent_list.txt"

rem 确认是否删除
set /p "choice=是否删除以上文件？(y/N): "
if /i "%choice%"=="y" (
    for /f "delims=" %%f in (%temp%\torrent_list.txt) do (
        rem 获取文件属性
        for /f "tokens=1 delims=" %%a in ('attrib "%%f"') do (
            set "attr=%%a"
        )
        
        rem 检查是否是隐藏文件，如果是则加上 /ah 参数
        if "!attr:~4,1!"=="H" (
            del /ah "%%f"
            echo 已删除隐藏文件: "%%f"
        ) else (
            del "%%f"
            echo 已删除文件: "%%f"
        )
    )
) else (
    echo 操作已取消，没有删除任何文件。
)

rem 删除临时文件
del "%temp%\torrent_list.txt"

pause

