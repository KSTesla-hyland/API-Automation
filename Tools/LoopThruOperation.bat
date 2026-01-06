::
:: Simple tool to run something a certain amount of time continuously
::
:: Configure "numberOfAttempt" below to the number of loops that needs to run
:: Add the command to run, followed by " >> %LOG% 2>&1" in the proper section below
:: The errorlevel of the command is used to detect failure. Stop on first failure.
:: The log is created fresh for each run
::
:: Usage: Make a copy of the tool and edit it to the purpose, eventually change the log name
::
@echo off
setlocal enabledelayedexpansion
set numberOfAttempt=10
set LOG=RunSomethingLooping.log

set PYTHONUNBUFFERED=TRUE
set count=%numberOfAttempt%
echo Start on %date%,%time:~0,8%
echo Logging to: %LOG%
echo Start on %date%,%time:~0,8% > %LOG%
:loop
set /a currentAttempt=%numberOfAttempt%-%count%+1
echo Attempt: %currentAttempt% / %numberOfAttempt%
echo Attempt: %currentAttempt% / %numberOfAttempt% >> %LOG% 2>&1
call:timer
:: Run something here, pipe output to  >> %LOG% 2>&1

robocopy.exe /copyall /E /NP "c:\Software\18_1_0\18,1,0,81\Thick\Utils" "c:\temp" >> %LOG% 2>&1
del c:\temp\CHECK.DAT
del c:\temp\DBUtil.exe

:: End run something here...
if !errorlevel! neq 0 (
    echo Failure detected, errorlevel: !errorlevel!
	echo Review console output in file: %LOG%
	echo Failure detected, errorlevel: !errorlevel! >> %LOG%
	goto done
)
call:timer elapsed_time
echo Attempt: %currentAttempt% / %numberOfAttempt%: duration: %elapsed_time%s
echo Attempt: %currentAttempt% / %numberOfAttempt%: duration: %elapsed_time%s >> %LOG% 2>&1

:: Add a sleep time in between runs if needed
:: waitfor SomethingNotHappening /T 2 2> NUL

set /a count-=1
if %count% GTR 0 goto loop

:done
echo Finished on %date%,%time:~0,8%
echo Finished on %date%,%time:~0,8% >> %LOG%

::SUBROUTINES
goto :eof
:: Elapsed Time Function
:: -----------------------------------------------------------------------
:: Return the value of elapsed time in seconds (rounded down to the
:: nearest whole integer) since timer was reset.
:: Call the function without any parameters to reset the starting time
::
::  Parameters:
::             <return>  the returned value in seconds
::
:: Example:
::
:: call:timer
:: ping 1.1.1.1 -n 1 -w 2000 >NUL
:: call:timer elapsed_time
:: echo elapsed time: %elapsed_time%s
:: -----------------------------------------------------------------------
:timer <return>
    setLocal EnableExtensions EnableDelayedExpansion

    set _t=%time%
    set _t=%_t::0=: %
    set _t=%_t:,0=, %
    set _t=%_t:.0=. %
    set _t=%_t:~0,2% * 360000 + %_t:~3,2% * 6000 + %_t:~6,2% * 100 + %_t:~9,2%
    set /a _t=%_t%

    :: if we call the function without parameters it defines initial time
    set _r=%~1
    if not defined _r (
        EndLocal & set TIMER_START_TIME=%_t% & goto :EOF
    )
    :: in centiseconds
    set /a _t=%_t% - %TIMER_START_TIME%
	:: in full seconds
	set /a "_t=%_t% / 100"

    EndLocal & set %~1=%_t%
goto :eof