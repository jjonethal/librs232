mkdir build

IF "%TARGET%"  == "" SET TARGET=x86
IF '%WIN_SDK%' == '' SET WIN_SDK="C:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd"
IF "%LUA_LIB%" == "" SET LUA_LIB=c:\app\lua
::call %WIN_SDK% /%TARGET% /release
call %WIN_SDK% %TARGET% || exit /B 1
:: call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

::set INCLUDE=D:\work\luars232\librs232.git\include;E:\luajit\x86;E:\luajit\luajit-2.0\src;%INCLUDE%
set INCLUDE=%CD%\include;%LUA_LIB%;%INCLUDE%;%LUA_LIB%\include
echo INCLUDE_PATH: %INCLUDE%
pushd build
cl /O2 /DUNICODE /DluaL_reg=luaL_Reg /D_UNICODE /DWIN32 /DRS232_EXPORT ..\bindings\lua\luars232.c ..\src\rs232.c ..\src\rs232_windows.c %LUA_LIB%\lua51.lib /O2 /LD /link /dll || exit /B 1
copy luars232.dll "%LUA_LIB%"
pause
copy ..\bindings\lua\test.lua .
::E:\luajit\x86\luajit test.lua
%LUA_LIB%\luajit test.lua
popd 
pause

