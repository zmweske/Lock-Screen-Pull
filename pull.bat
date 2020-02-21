: Written by zmweske
@echo off
REM setup location
SET DIRECTORY="%USERPROFILE%\Pictures"

cd "%DIRECTORY%"
if not exist "lock screens\" 			mkdir "lock screens\"
if not exist "lock screens\dump\" 		mkdir "lock screens\dump\"
if not exist "lock screens\temp" 	mkdir "lock screens\temp\"

REM remove two following lines if the horizontal and vertical folders are not used
if not exist "lock screens\horizontal\" 	mkdir "lock screens\horizontal\"
if not exist "lock screens\vertical\" 		mkdir "lock screens\vertical\"

@copy "%AppData%\..\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets\*" "%DIRECTORY%\lock screens\temp" >nul 2>nul
cd "%DIRECTORY%\lock screens\temp"
ren * *.jpeg

REM Deleting known files
for /f "delims=" %%f in (..\trash.txt) do @del "%%f" 2>nul
REM adding processed files to trash.txt
for /r %%i in (*) do echo %%i >> ..\trash.txt

move "%DIRECTORY%\lock screens\temp\*" "%DIRECTORY%\lock screens\dump\"
cd "%DIRECTORY%\lock screens"
REM CALL explorer.exe "%DIRECTORY%\lock screens\"
