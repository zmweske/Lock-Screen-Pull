: Written by zmweske
@echo off
REM setup location
SET DIRECTORY="%USERPROFILE%\Pictures"
SET LOCATION="Lock Screens\"

cd "%DIRECTORY%"
if not exist "%LOCATION%" 		mkdir "%LOCATION%"
if exist "%~dp0\imgInfo.bat" 	move "%~dp0\imgInfo.bat" %LOCATION%

cd "%LOCATION%"
if not exist "dump\" 			mkdir "dump\"
if not exist "temp" 			mkdir "temp\"
if not exist "horizontal\" 		mkdir "horizontal\"
if not exist "vertical\" 		mkdir "vertical\"

@copy "%AppData%\..\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets\*" ".\temp" >nul 2>nul
cd "temp"
ren * *.jpeg

REM Deleting known files
for /f "delims=" %%f in (..\trash.txt) do @del "%%f" 2>nul
REM adding processed files to trash.txt
for /r %%i in (*) do echo %%i >> ..\trash.txt

for /f %%f in ('dir /b .') do @(
	REM echo %%f
	REM for /f "delims=? tokens=2" %%a in ('call ..\toolTipInfo.bat %%f ^|find "Dimensions:"')  do (
	@for /f "delims=" %%a in ('call ..\imgInfo.bat %%f')  do (
		REM echo %%a
		@if "%%a" == "1920 x 1080" @move %%f ..\horizontal\
		@if "%%a" == "1080 x 1920" @move %%f ..\vertical\
	)
)
cd ..
move "temp\*" "dump\"
rmdir "temp\"
REM CALL explorer.exe .

