@echo off

set args=

:arg1
    set arg=%~1
:arg2
    if exist "%arg%" goto arg3
    shift /1
    if "%~1" == "" goto end
    set arg=%arg%　%~1
    goto arg2
:arg3
    set args=%args% "%arg%"
    shift /1
    if not "%~1" == "" goto arg1

title ts-renamer

for %%i in (%args%) do (
    setlocal
    call :rename "%%~i"
    endlocal
)
goto end

:rename
    echo.
    echo ### "%~1"

    node "%~dp0../cli.js" --input "%~1" --dir "${firstStartYYYY}_Q${firstStartQuarter}/${title}" --file "${title}([ 第${count2}話])([ 「${subTitle}」])([ (${channelUserName})])"
    call :log "%~1" %%errorlevel%%

    goto :eof

:log
    if %2 == 0 (
        echo OK: "%~1" >> "%~dp0../log/rename.log"
    ) else (
        echo NG: "%~1" >> "%~dp0../log/rename.log"
    )

    goto :eof

:end
    echo done
    pause
