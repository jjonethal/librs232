call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /x64 /release
::set INCLUDE=D:\work\luars232\librs232.git\include;E:\luajit\x64;%INCLUDE%
set INCLUDE=D:\work\luars232\librs232.git\include;E:\luajit\x64;%INCLUDE%
mkdir buildx64
cd buildx64
cl /O2 /homeparams /DUNICODE /D_UNICODE /DWIN32 /DRS232_EXPORT ..\bindings\lua\luars232.c ..\src\rs232.c ..\src\rs232_windows.c E:\luajit\x64\lua51.lib /O2 /LD /link /dll
pause
copy ..\bindings\lua\test.lua .
E:\luajit\x64\luajit test.lua
pause

