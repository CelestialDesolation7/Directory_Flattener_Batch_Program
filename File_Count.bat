@echo off
cd /d %~dp0
setlocal enabledelayedexpansion
pause
for /d %%i in (*) do (
    set layer1_directory_now=%%i
    set file_number=0
    pushd !layer1_directory_now! 2>nul
    if !errorlevel! geq 1 (
        echo.
        echo Warning.The following directory name is illegal.
        echo ------------------------------------------------
        echo !layer1_directory_now!
        echo ------------------------------------------------
        echo.
    ) else (
        for /f "delims=" %%a in ('dir /a-d/b/s 2^>nul') do (
            set /a file_number=!file_number!+1
        )
        if !file_number! geq 1 (
            echo too much file ^(!file_number! count^) in directory %%~fi
            echo.
        )
    )
    popd
)
pause