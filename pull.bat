: Written by Zach Weske
@echo off
SET DIRECTORY="%USERPROFILE%\Pictures"
cd "%DIRECTORY%"
if not exist "lock screens\" 			mkdir "lock screens\"
if not exist "lock screens\dump\" 		mkdir "lock screens\dump\"
if not exist "lock screens\working folder" 	mkdir "lock screens\working folder\"
if not exist "lock screens\horizontal\" 	mkdir "lock screens\horizontal\"
if not exist "lock screens\vertical" 		mkdir "lock screens\vertical\"

@copy "%AppData%\..\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets\*" "%DIRECTORY%\lock screens\working folder" >nul 2>nul
cd "%DIRECTORY%\lock screens\working folder"
ren * *.jpeg

:REM CALL ..\trash.bat
: Deleting known files
for /f "delims=" %%f in (..\trash.txt) do @del "%%f" 2>nul
for /r %%i in (*) do echo %%i >> ..\trash.txt

move "%DIRECTORY%\lock screens\working folder\*" "%DIRECTORY%\lock screens\dump\"
cd "%DIRECTORY%\lock screens"
:REM CALL explorer.exe "%DIRECTORY%\lock screens\"
