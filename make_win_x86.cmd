mkdir build
call "C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /x86 /release
::set INCLUDE=D:\work\luars232\librs232.git\include;E:\luajit\x86;E:\luajit\luajit-2.0\src;%INCLUDE%
set INCLUDE=D:\work\luars232\librs232.git\include;E:\luajit\x86;%INCLUDE%
cd build
cl /O2 /DUNICODE /D_UNICODE /DWIN32 /DRS232_EXPORT ..\bindings\lua\luars232.c ..\src\rs232.c ..\src\rs232_windows.c E:\luajit\x86\lua51.lib /O2 /LD /link /dll
pause
copy ..\bindings\lua\test.lua .
::E:\luajit\x86\luajit test.lua
E:\luajit\x64\luajit test.lua
pause

