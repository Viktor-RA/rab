echo off
:again
timeout 10 /nobreak >> nul
SET /a NUM = 1
echo ============ Test controller %NUM% ============
SET SOUR='call SELECT_%NUM%.bat'
rem echo SOUR = %SOUR%
FOR /F "tokens=1,2" %%o in (hw%NUM%laststate.log) do SET /a PREV=%%o
echo Prev saved event ID %PREV%
FOR /F "eol=( skip=2 tokens=1,4,5,6,7" %%i in (%SOUR%) do (
    SET tokeni=%%i
    SET tokenj=%%j
    SET tokenk=%%k
    SET tokenl=%%l
    SET tokenm=%%m
)
ECHO Find %tokeni% %tokenj% %tokenk% %tokenl% %tokenm%
IF NOT %PREV% == %tokeni% echo %tokeni% %tokenj% %tokenk% %tokenl% %tokenm% >> hardware.log
IF NOT %PREV% == %tokeni% echo %tokeni% %tokenm% > hw%NUM%laststate.log
IF NOT %PREV% == %tokeni% (echo HW1 changed)

timeout 10 /nobreak >> nul
SET /a NUM = 2
echo ============ Test controller %NUM% ============
SET SOUR='call SELECT_%NUM%.bat'
rem echo SOURCE = %SOUR%
FOR /F "tokens=1,2" %%o in (hw%NUM%laststate.log) do SET /a PREV = %%o
echo Prev saved event ID %PREV%
rem обработчик свежих сообщений
FOR /F "eol=( skip=2 tokens=1,4,5,6,7" %%i in (%SOUR%) do (
    SET tokeni=%%i
    SET tokenj=%%j
    SET tokenk=%%k
    SET tokenl=%%l
    SET tokenm=%%m
)
ECHO Find %tokeni% %tokenj% %tokenk% %tokenl% %tokenm%
IF NOT %PREV% == %tokeni% (echo %tokeni% %tokenj% %tokenk% %tokenl% %tokenm% >> hardware.log)
IF NOT %PREV% == %tokeni% echo %tokeni% %tokenm% > hw%NUM%laststate.log
IF NOT %PREV% == %tokeni% (echo HW2 changed)
GOTO again