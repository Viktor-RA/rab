@ECHO OFF
GOTO %1

:CONNECT
@ECHO ON
sqlcmd -S PARSECPC\PARSEC4 -i D:\Scripts\SEL1CONNECT
@ECHO OFF
GOTO END

:POWER
@ECHO ON
sqlcmd -S PARSECPC\PARSEC4 -i D:\Scripts\SEL1POWER
@ECHO OFF
GOTO END

:COVER
@ECHO ON
sqlcmd -S PARSECPC\PARSEC4 -i D:\Scripts\SEL1COVER
@ECHO OFF
GOTO END

:END