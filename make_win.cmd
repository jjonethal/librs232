mkdir build

IF "%TARGET%"  == "" SET TARGET=x86
IF '%WIN_SDK%' == '' SET WIN_SDK="C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd"
IF "%LUA_LIB%" == "" SET LUA_LIB=E:\luajit\%TARGET%
call %WIN_SDK% /%TARGET% /release

::set INCLUDE=D:\work\luars232\librs232.git\include;E:\luajit\x86;E:\luajit\luajit-2.0\src;%INCLUDE%
set INCLUDE=%CD%\include;%LUA_LIB%;%INCLUDE%
pushd build
cl /O2 /DUNICODE /D_UNICODE /DWIN32 /DRS232_EXPORT ..\bindings\lua\luars232.c ..\src\rs232.c ..\src\rs232_windows.c %LUA_LIB%\lua51.lib /O2 /LD /link /dll
pause
copy ..\bindings\lua\test.lua .
::E:\luajit\x86\luajit test.lua
%LUA_LIB%\luajit test.lua
popd 
pause
