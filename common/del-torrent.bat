@echo off
setlocal enabledelayedexpansion

echo �г���ǰĿ¼�µ�.torrent�ļ���
echo ---------------------------------------

rem ��ȡ��ǰĿ¼·��
for /f "tokens=*" %%i in ('cd') do set "current_dir=%%i"

rem �г���ǰĿ¼�µ�.torrent�ļ��������������Եģ�
dir /b /a:-d /s "%current_dir%\*.torrent" 2>nul > "%temp%\torrent_list.txt"

rem ����Ƿ��ҵ�.torrent�ļ�
if %errorlevel% neq 0 (
    echo û���ҵ�.torrent�ļ���
    pause
    exit
)

rem ��ʾ�ҵ���.torrent�ļ�
type "%temp%\torrent_list.txt"

rem ȷ���Ƿ�ɾ��
set /p "choice=�Ƿ�ɾ�������ļ���(y/N): "
if /i "%choice%"=="y" (
    for /f "delims=" %%f in (%temp%\torrent_list.txt) do (
        rem ��ȡ�ļ�����
        for /f "tokens=1 delims=" %%a in ('attrib "%%f"') do (
            set "attr=%%a"
        )
        
        rem ����Ƿ��������ļ������������� /ah ����
        if "!attr:~4,1!"=="H" (
            del /ah "%%f"
            echo ��ɾ�������ļ�: "%%f"
        ) else (
            del "%%f"
            echo ��ɾ���ļ�: "%%f"
        )
    )
) else (
    echo ������ȡ����û��ɾ���κ��ļ���
)

rem ɾ����ʱ�ļ�
del "%temp%\torrent_list.txt"

pause

