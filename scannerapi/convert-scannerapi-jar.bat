SETLOCAL

SET VERSION=1.2.3
IF not "%1" == "" (
SET VERSION=%1
)
SET PROCESSOR="c:\Users\xuliangwei\AppData\Local\Android\Sdk\build-tools\30.0.2\dx.bat"
SET SOURCEFILE="e:\work\software\androidapps-9.0\ScannerApi\scanner\build\libs\ScannerAPI-v%VERSION%.jar"
SET TARGETFILE="ScannerAPI-v%VERSION%.jar"

%PROCESSOR% --dex --output=%TARGETFILE% %SOURCEFILE%

PAUSE
ENDLOCAL
