
SET TARGET=x64
::SET TARGET=x86
call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /%TARGET% /release
::set INCLUDE=D:\work\luars232\librs232.git\include;E:\luajit\x64;%INCLUDE%
set INCLUDE=..\include;E:\luajit\%TARGET%;%INCLUDE%
mkdir build%TARGET%
cd build%TARGET%
cl /O2 /homeparams /DUNICODE /D_UNICODE /DWIN32 /DRS232_EXPORT ..\bindings\lua\luars232.c ..\src\rs232.c ..\src\rs232_windows.c E:\luajit\%TARGET%\lua51.lib /O2 /LD /link /dll
pause
copy ..\bindings\lua\test.lua .
E:\luajit\%TARGET%\luajit test.lua
pause

