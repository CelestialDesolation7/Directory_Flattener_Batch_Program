@echo off
title Directory_Flattener_Self_Destruct_Version_4
cd /d %~dp0
setlocal enabledelayedexpansion
set "rootDir=%~dp0"
echo Warning:Please Check If Your Desired Working Directory Is
echo ----------------------------------------------------------
echo !rootDir!
echo ----------------------------------------------------------
echo This batch program will change your files in computer forever and cannot withdraw its effect.
echo Make sure there's no system file in the working directory and get your data backuped.
echo.
echo If you encountered error in the execution process,Please don't panic.
echo After the execution is over,don't close the window immediately
echo and check all the error reports displayed in the window.
echo Most errors happen simply because there exist illegal characters ^(such as '^^!'^) in filenames or paths.
echo You can move all the files that are not dealt with successfully manually.
echo.
pause

goto main_process

:name_changer
set possible_duplicator=.\!file_name_now!^(!duplicate_index!^)!file_extension_now!
set /a duplicate_index=!duplicate_index!+1
IF EXIST "!possible_duplicator!" call :name_changer
goto :eof

:mover
IF EXIST "!possible_duplicator!" (
    call :name_changer
)
attrib -h "!original_location!"
move "!original_location!" "!possible_duplicator!" 2>nul
if errorlevel 1 (
    echo Error happened when dealing with directory:
    echo -------------------------------------------
    echo !layer1_directory_now!
    echo -------------------------------------------
    echo.
)
goto :eof

:main_loop_for_each_directory
    for /f "delims=" %%a in ('dir /a-d/b/s 2^>nul') do (
        set file_name_now=%%~na
        set file_extension_now=%%~xa
        set possible_duplicator=.\!file_name_now!!file_extension_now!
        set original_location=%%~fa
        set original_path=%%~dpa
        if not "!layer1_path_now!"=="!original_path!" (
            set duplicate_index=1
            call :mover
        )
    )
    for /d %%m in (*) do (
        attrib -h "%%m" 1>nul 2>nul
        dir "%%m" /a-d /s 1>nul 2>nul
        if errorlevel 1 (
            rmdir /s /q "%%m" 2>nul || (
               echo.
               echo Error happened when removing directory:
               echo --------------------------------------------
               echo %%~fm
               echo --------------------------------------------
               echo It's path may have illegal characters.
               echo.
            )
        ) else (
            echo.
            echo Warning.The following directory isn't empty.
            echo --------------------------------------------
            echo %%~fm
            echo --------------------------------------------
            echo.
        )
    )
goto :eof

:main_process
for /d %%i in (*) do (
    set layer1_directory_now=%%i
    set layer1_path_now=%%~fi\
    pushd !layer1_directory_now! 2>nul
    if !errorlevel! geq 1 (
        echo.
        echo Warning.The following directory name is illegal.
        echo ------------------------------------------------
        echo !layer1_directory_now!
        echo ------------------------------------------------
        echo.
    ) else (
        call :main_loop_for_each_directory
    )
    popd
)
echo Flatten completed.
echo Self-destruction ready to engage.
pause
del %0