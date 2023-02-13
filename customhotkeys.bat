@echo off

setlocal
call :setESC

:init
adb push homescript.sh /data/local/tmp/homescript.sh

:startscript
cls
echo.
echo Go to desired screen
pause
echo.
for /f "tokens=1,2 delims= " %%a in ('adb shell sh /data/local/tmp/homescript.sh') do (
  set package= %ESC%[92m%%a%ESC%[0m
  set class=%ESC%[92m%%b%ESC%[0m
  set rawpkg=%%a
  set rawclass=%%b 
)
echo Package Name: %package%
echo Activity Name: %class%
echo.
echo 1. Dpad Up
echo 2. Dpad Down
echo 3. Dpad Left
echo 4. Dpad Right
%SystemRoot%\System32\choice.exe /C 1234 /N /M "Choose a shortcut key to customize [1-4]: "
if errorlevel 4 set "key=right" && goto test
if errorlevel 3 set "key=left" && goto test
if errorlevel 2 set "key=down" && goto test
if errorlevel 1 set "key=up" && goto test
if not errorlevel 1 goto starterror

:starterror
echo Not a valid choice, try again
pause
goto startscript 

:test
echo.
echo %ESC%[94mSetting the %key% key to:%package%/%class%%ESC%[0m
adb shell settings put system hotkey_%key%_class %rawclass%
adb shell settings put system hotkey_%key%_package %rawpackage%
adb shell am force-stop com.lge.fphome
echo %ESC%[94mDONE!!! %ESC%[0m
pause
:confirm
%SystemRoot%\System32\choice.exe /C YN /N /M "Set another key? [Y/N]: "
if errorlevel 2 pause && exit /b
if errorlevel 1 goto startScript
if not errorlevel 1 goto confirmError
exit /b

:confirmError
echo Not a valid choice, try again
pause
goto confirm 

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  )