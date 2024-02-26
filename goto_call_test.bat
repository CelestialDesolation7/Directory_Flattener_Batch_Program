@echo off
setlocal enabledelayedexpansion
set time=0
goto :main_structure

:sub_batch

echo sub_batch called.continue.
pause

:lable0
echo lable0 is being executed.
set /a time=!time!+1
echo timenow is !time!
echo.
pause
if !time! LEQ 5 (
    echo executing goto command.
    pause
    goto :lable0
)
echo going to eof
goto :eof

echo IF you see this,goto interrupted call command.
pause

:main_structure
call :sub_batch
echo coming to end.
pause
