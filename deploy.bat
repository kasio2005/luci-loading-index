@echo off
if "%~x1" neq ".htm" (
    if "%~x1" neq ".html" (
        echo This is not html file!
        echo Press any key to exit
        pause >nul
        exit /b 1
    )
)
set /p targetip = Please enter OpenWRT router IP address (also is default gateway): 
echo Transmitting new LuCI index file...
scp %1 root@%targetip%:/tmp/index.html
echo Executing replacment shell script, DO NOT TERMINATE!...
ssh root@%targetip% curl https://gist.githubusercontent.com/rk0cc/ff9482864b2c11559b26ea5532959134/raw/f57a3945c1bf146d6f272c6d2ed969aaeb0d4a7c/pagesetup.sh -o /tmp/luciidx.sh; chmod +x /tmp/luciidx.sh; /tmp/luciidx.sh
echo LuCI index page has been changed!
echo Press any key to exit
exit /b 0