SETLOCAL

SET VERSION=1.2.1
IF not "%1" == "" (
SET VERSION=%1
)
SET PROCESSOR="D:\Android\sdk\build-tools\30.0.2\dx.bat"
SET SOURCEFILE="e:\work\software\androidapps-9.0\ScannerApi\scanner\build\libs\ScannerAPI-v%VERSION%.jar"
SET TARGETFILE="r:\ScannerAPI-v%VERSION%.jar"

%PROCESSOR% --dex --output=%TARGETFILE% %SOURCEFILE%

PAUSE
ENDLOCAL
