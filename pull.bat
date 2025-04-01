: Written by zmweske
@echo off

echo Creating/checking directories...
if not exist "dump\" 			mkdir "dump\"
if not exist "temp" 			mkdir "temp\"
if not exist "horizontal\" 		mkdir "horizontal\"
if not exist "vertical\" 		mkdir "vertical\"

echo Copying and renaming files into jpeg...
@copy "%AppData%\..\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets\*" ".\temp" >nul 2>nul
cd "%~dp0\temp\"
ren * *.jpeg

echo Deleting known files...
for /f "delims=" %%f in ("%~dp0\trash.txt") do @del "%%f" 2>nul

echo Recording processed files...
for %%a in (*) do @echo %%a >> "%~dp0\trash.txt"

echo Sorting horizontal and vertical pictures
for /f %%f in ('dir /b .') do @(
	@for /f "delims=" %%a in ('call "%~dp0\imgInfo.bat" %%f')  do (
		REM echo %%a
		@if "%%a" == "1920 x 1080" @move %%f "%~dp0\horizontal\"
		@if "%%a" == "1080 x 1920" @move %%f "%~dp0\vertical\"
	)
)

echo Cleaning up...
cd "%~dp0"
rd "%~dp0\temp\"
if exist "%~dp0\temp\"  move "%~dp0\temp\*" "%~dp0\dump\"
if exist "%~dp0\temp\"  rmdir "%~dp0\temp\"

REM CALL explorer.exe .

