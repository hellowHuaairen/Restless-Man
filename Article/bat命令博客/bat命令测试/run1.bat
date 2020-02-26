@echo off
setlocal enabledelayedexpansion
set id=%1
set name=%2%
set age=%3
echo %1 %2 %3
echo %id% %name% %age%
set /a ip=a
set /a username=b
set /a passwd=c
for /f "tokens=1-2 delims=:" %%i in (propreties.txt) do (
set BL1=%%i
set BL2=%%j
if "ip"=="!BL1!" (set ip=%%j)
if "username"=="!BL1!" (set username=%%j)
if "passwd"=="!BL1!" (set passwd=%%j)
 )
echo %ip% %username% %passwd%
mysql -u%username% -p%passwd% -h %ip% efo -e   " insert person (id,name,age) value (%id%,'%name%',%age%) ">>out.txt
Pause