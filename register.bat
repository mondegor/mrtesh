@echo off
rem Registration of Mrtesh Tool for Windows GitBash
rem https://www.tutorialspoint.com/batch_script/
rem https://ss64.com/nt/syntax-substring.html

set MRTESH_PATH=%cd:\=/%
set MRTESH_PATH=/%MRTESH_PATH::=%/test.sh
set MRTESH_DIR_BIN=%USERPROFILE%\AppData\Local\Mrcmd
set MRTESH_PATH_BIN=%MRTESH_DIR_BIN%\mrtesh

if not exist %MRTESH_DIR_BIN% (
  mkdir %MRTESH_DIR_BIN%
)

echo #!/usr/bin/env bash > %MRTESH_PATH_BIN%
echo %MRTESH_PATH% "$@" >> %MRTESH_PATH_BIN%

set REG_KEY=HKCU\Environment
for /f "tokens=2*" %%a IN ('Reg.exe query "%REG_KEY%" /v Path') DO set USER_PATH=%%~b

set lastChar=%USER_PATH:~-1%

if not "%lastChar%" == ";" (
  set USER_PATH=%USER_PATH%;
)

call set _USER_PATH=%%USER_PATH:%MRTESH_DIR_BIN%;=%%

if "%USER_PATH%" == "%_USER_PATH%" (
  set USER_PATH=%USER_PATH%%MRTESH_DIR_BIN%;
  goto :success
) else (
  echo Mrtesh Tool has been updated in %MRTESH_PATH_BIN%
  goto :ok
)

:success
Reg.exe add "%REG_KEY%" /v Path /t REG_EXPAND_SZ /d "%USER_PATH%" /f
echo Mrtesh Tool has been successfully registered in %MRTESH_PATH_BIN%

:ok
rem echo See User Environment Variables:
rem echo User PATH: %USER_PATH%

pause