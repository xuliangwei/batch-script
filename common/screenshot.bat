setlocal
set filename=screenshot-%date:~0,4%%date:~5,2%%date:~8,2%-%time:~0,2%%time:~3,2%%time:~6,2%.png
set irfanview=d:\Program Files\IrfanView\i_view64.exe
adb shell "/system/bin/screencap -p /sdcard/screenshot.png"
adb pull /sdcard/screenshot.png "%filename%"
"%irfanview%" "%filename%" /resize_long=640 /aspectratio /resample /convert="%filename%"
