echo off
:again

rem  ===========================================================  1 - CONNECT ==============================================================
SET /a NUM = 1
SET TYPE=CONNECT
 echo ============ Test controller %NUM% - %TYPE% ==========
SET SOUR='call SELECT_%NUM%.bat %TYPE%'
REM echo SOUR = %SOUR%
FOR /F "tokens=1,2" %%o in (hw%NUM%%TYPE%.log) do (
    SET /a PREV=%%o
    SET /a N1Con=%%p
)
IF %N1Con% == 65667 (
    SET HW1Con=OK      
)
IF %N1Con% == 65540 (
    SET HW1Con=Error   
)

REM echo Prev saved event ID %PREV%
FOR /F "eol=( skip=2 tokens=1,4,5,6,7" %%i in (%SOUR%) do (
    SET tokeni=%%i
    SET tokenj=%%j
    SET tokenk=%%k
    SET tokenl=%%l
    SET tokenm=%%m
)
REM ECHO Find %tokeni% %tokenj% %tokenk% %tokenl% %tokenm%
IF NOT %PREV% == %tokeni% (
    echo %tokeni% %tokenj% %tokenk% %tokenl% %tokenm% >> hardware.log
)
IF NOT %PREV% == %tokeni% (
    echo %tokeni% %tokenm% > hw%NUM%%TYPE%.log
    REM echo hw%NUM%%TYPE%.log writen
)
IF NOT %PREV% == %tokeni% echo HW1 %TYPE% changed



rem timeout 2 /nobreak >> nul

REM ===========================================================  1 - POWER ==============================================================
SET /a NUM = 1
SET TYPE=POWER
echo ============ Test controller %NUM% - %TYPE% ============
SET SOUR='call SELECT_%NUM%.bat %TYPE%'
REM echo SOUR = %SOUR%
FOR /F "tokens=1,2" %%o in (hw%NUM%%TYPE%.log) do (
    SET /a PREV=%%o
    SET /a N1Pow=%%p
)
IF %N1Pow% == 66325 (
    SET HW1Pow=OK      
)
IF %N1Pow% == 66324 (
    SET HW1Pow=Error   
)



rem echo Prev saved event ID %PREV%
FOR /F "eol=( skip=2 tokens=1,4,5,6,7" %%i in (%SOUR%) do (
    SET tokeni=%%i
    SET tokenj=%%j
    SET tokenk=%%k
    SET tokenl=%%l
    SET tokenm=%%m
)
rem ECHO Find %tokeni% %tokenj% %tokenk% %tokenl% %tokenm%
IF NOT %PREV% == %tokeni% echo %tokeni% %tokenj% %tokenk% %tokenl% %tokenm% >> hardware.log
IF NOT %PREV% == %tokeni% echo %tokeni% %tokenm% > hw%NUM%%TYPE%.log
IF NOT %PREV% == %tokeni% (echo HW1 %TYPE% changed)

rem timeout 2 /nobreak >> nul

REM ===========================================================  1 - COVER ==============================================================
SET /a NUM = 1
SET TYPE=COVER
echo ============ Test controller %NUM% - %TYPE% ============
SET SOUR='call SELECT_%NUM%.bat %TYPE%'
rem echo SOUR = %SOUR%
FOR /F "tokens=1,2" %%o in (hw%NUM%%TYPE%.log) do (
    SET /a PREV=%%o
    SET /a N1Cov=%%p
)
IF %N1Cov% == 66309 (
    SET HW1Cov=OK      
)
IF %N1Cov% == 66308 (
    SET HW1Cov=Error   
)

rem echo Prev saved event ID %PREV%
FOR /F "eol=( skip=2 tokens=1,4,5,6,7" %%i in (%SOUR%) do (
    SET tokeni=%%i
    SET tokenj=%%j
    SET tokenk=%%k
    SET tokenl=%%l
    SET tokenm=%%m
)
rem ECHO Find %tokeni% %tokenj% %tokenk% %tokenl% %tokenm%
IF NOT %PREV% == %tokeni% echo %tokeni% %tokenj% %tokenk% %tokenl% %tokenm% >> hardware.log
IF NOT %PREV% == %tokeni% echo %tokeni% %tokenm% > hw%NUM%%TYPE%.log
IF NOT %PREV% == %tokeni% (echo HW1 %TYPE% changed)


REM ======================================================= 2 - CONNECT =============================================

rem timeout 2 /nobreak >> nul

SET /a NUM = 2
SET TYPE=CONNECT
echo ============ Test controller %NUM% - %TYPE% ==========
SET SOUR='call SELECT_%NUM%.bat %TYPE%'
rem echo SOURCE = %SOUR%
FOR /F "tokens=1,2" %%o in (hw%NUM%%TYPE%.log) do (
    SET /a PREV=%%o
    SET /a N2Con=%%p
)
IF %N2Con% == 65667 (
    SET HW2Con=OK      
)
IF %N2Con% == 65540 (
    SET HW2Con=Error   
)

rem echo Prev saved event ID %PREV%
FOR /F "eol=( skip=2 tokens=1,4,5,6,7" %%i in (%SOUR%) do (
    SET tokeni=%%i
    SET tokenj=%%j
    SET tokenk=%%k
    SET tokenl=%%l
    SET tokenm=%%m
)
REM ECHO Find %tokeni% %tokenj% %tokenk% %tokenl% %tokenm%
IF NOT %PREV% == %tokeni% (echo %tokeni% %tokenj% %tokenk% %tokenl% %tokenm% >> hardware.log)
IF NOT %PREV% == %tokeni% (echo %tokeni% %tokenm% > hw%NUM%%TYPE%.log)
IF NOT %PREV% == %tokeni% (echo HW2 %TYPE% changed)


REM ======================================================= 2 - POWER =============================================

rem timeout 2 /nobreak >> nul

SET /a NUM = 2
SET TYPE=POWER
echo ============ Test controller %NUM% - %TYPE% ============
SET SOUR='call SELECT_%NUM%.bat %TYPE%'
rem echo SOURCE = %SOUR%
FOR /F "tokens=1,2" %%o in (hw%NUM%%TYPE%.log) do (
    SET /a PREV=%%o
    SET /a N2Pow=%%p
)
IF %N2Pow% == 66325 (
    SET HW2Pow=OK      
)
IF %N2Pow% == 66324 (
    SET HW2Pow=Error   
)

rem echo Prev saved event ID %PREV%
FOR /F "eol=( skip=2 tokens=1,4,5,6,7" %%i in (%SOUR%) do (
    SET tokeni=%%i
    SET tokenj=%%j
    SET tokenk=%%k
    SET tokenl=%%l
    SET tokenm=%%m
)
REM ECHO Find %tokeni% %tokenj% %tokenk% %tokenl% %tokenm%
IF NOT %PREV% == %tokeni% echo %tokeni% %tokenj% %tokenk% %tokenl% %tokenm% >> hardware.log
IF NOT %PREV% == %tokeni% echo %tokeni% %tokenm% > hw%NUM%%TYPE%.log
IF NOT %PREV% == %tokeni% (echo HW2 %TYPE% changed)

REM ======================================================= 2 - COVER =============================================

rem timeout 2 /nobreak >> nul

SET /a NUM = 2
SET TYPE=COVER
echo ============ Test controller %NUM% - %TYPE% ============
SET SOUR='call SELECT_%NUM%.bat %TYPE%'
rem echo SOURCE = %SOUR%
FOR /F "tokens=1,2" %%o in (hw%NUM%%TYPE%.log) do (
    SET /a PREV=%%o
    SET /a N2Cov=%%p
)
IF %N2Cov% == 66309 (
    SET HW2Cov=OK      
)
IF %N2Cov% == 66308 (
    SET HW2Cov=Error   
)

rem echo Prev saved event ID %PREV%
FOR /F "eol=( skip=2 tokens=1,4,5,6,7" %%i in (%SOUR%) do (
    SET tokeni=%%i
    SET tokenj=%%j
    SET tokenk=%%k
    SET tokenl=%%l
    SET tokenm=%%m
)
rem ECHO Find %tokeni% %tokenj% %tokenk% %tokenl% %tokenm%
IF NOT %PREV% == %tokeni% echo %tokeni% %tokenj% %tokenk% %tokenl% %tokenm% >> hardware.log
IF NOT %PREV% == %tokeni% echo %tokeni% %tokenm% > hw%NUM%%TYPE%.log
IF NOT %PREV% == %tokeni% (echo HW2 %TYPE% changed)

timeout 1 /nobreak >> nul

REM =============================================== TABLE ================================
cls
ECHO =======================================
ECHO    ParSEC N1000 Controllers status       
ECHO =======================================
ECHO            1             2      
ECHO Connect    %HW1Con%      %HW2Con%    
ECHO Power      %HW1Pow%      %HW2Pow%    
ECHO Cover      %HW1Cov%      %HW2Cov%    
ECHO =======================================






















GOTO again