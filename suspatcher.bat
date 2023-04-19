@echo off

set /a choice=0
color 09
title SUSPATCHER

:start
call :logo
echo Welche Config soll aktiv sein?
echo [1] CYP Custom Server (Beinhaltet auch die Default Server)
echo [2] Default Among Us Server
echo [3] Exit
echo.
set /p choice=Nummer: 
if %choice%==1 goto :setcustom
if %choice%==2 goto :setdefault
if %choice%==3 cls && exit
goto :start

:checkfolder
echo Among Us Ordner suchen...
if exist "%USERPROFILE%\AppData\LocalLow\Innersloth\Among Us" (
	echo Ordner gefunden!
	exit /b 0
) else (
	call :error
)

:setcustom
call :logo
call :checkfolder
echo Custom Server File schreiben...
echo {"CurrentRegionIdx":3,"Regions":[{"$type":"StaticHttpRegionInfo, Assembly-CSharp","Name":"North America","PingServer":"matchmaker.among.us","Servers":[{"Name":"Http-1","Ip":"https://matchmaker.among.us","Port":443,"UseDtls":true,"Players":0,"ConnectionFailures":0}],"TranslateName":289},{"$type":"StaticHttpRegionInfo, Assembly-CSharp","Name":"Europe","PingServer":"matchmaker-eu.among.us","Servers":[{"Name":"Http-1","Ip":"https://matchmaker-eu.among.us","Port":443,"UseDtls":true,"Players":0,"ConnectionFailures":0}],"TranslateName":290},{"$type":"StaticHttpRegionInfo, Assembly-CSharp","Name":"Asia","PingServer":"matchmaker-as.among.us","Servers":[{"Name":"Http-1","Ip":"https://matchmaker-as.among.us","Port":443,"UseDtls":true,"Players":0,"ConnectionFailures":0}],"TranslateName":291},{"$type":"StaticHttpRegionInfo, Assembly-CSharp","Name":"chooseyourpath","PingServer":"among-us.buettner.tech","Servers":[{"Name":"http-1","Ip":"http://among-us.buettner.tech","Port":80,"UseDtls":false,"Players":0,"ConnectionFailures":0}],"TranslateName":1003}]} > "%USERPROFILE%\AppData\LocalLow\Innersloth\Among Us\regionInfo.json"
pause
goto start

:setdefault
call :logo
call :checkfolder
echo Default Server File schreiben...
echo {"CurrentRegionIdx":1,"Regions":[{"$type":"StaticHttpRegionInfo, Assembly-CSharp","Name":"North America","PingServer":"matchmaker.among.us","Servers":[{"Name":"Http-1","Ip":"https://matchmaker.among.us","Port":443,"UseDtls":true,"Players":0,"ConnectionFailures":0}],"TranslateName":289},{"$type":"StaticHttpRegionInfo, Assembly-CSharp","Name":"Europe","PingServer":"matchmaker-eu.among.us","Servers":[{"Name":"Http-1","Ip":"https://matchmaker-eu.among.us","Port":443,"UseDtls":true,"Players":0,"ConnectionFailures":0}],"TranslateName":290},{"$type":"StaticHttpRegionInfo, Assembly-CSharp","Name":"Asia","PingServer":"matchmaker-as.among.us","Servers":[{"Name":"Http-1","Ip":"https://matchmaker-as.among.us","Port":443,"UseDtls":true,"Players":0,"ConnectionFailures":0}],"TranslateName":291}]} > "%USERPROFILE%\AppData\LocalLow\Innersloth\Among Us\regionInfo.json"
pause
goto start

:error
color 0c
call :logo
echo Der Among Us Ordner konnte nicht gefunden werden..
echo Bitte frag jemanden nach Hilfe
pause

:logo
cls
echo.
echo.
echo .d8888. db    db .d8888. d8888b.  .d8b.  d888888b  .o88b. db   db d88888b d8888b. 
echo 88'  YP 88    88 88'  YP 88  `8D d8' `8b `~~88~~' d8P  Y8 88   88 88'     88  `8D 
echo `8bo.   88    88 `8bo.   88oodD' 88ooo88    88    8P      88ooo88 88ooooo 88oobY' 
echo   `Y8b. 88    88   `Y8b. 88~~~   88~~~88    88    8b      88~~~88 88~~~~~ 88`8b   
echo db   8D 88b  d88 db   8D 88      88   88    88    Y8b  d8 88   88 88.     88 `88. 
echo `8888Y' ~Y8888P' `8888Y' 88      YP   YP    YP     `Y88P' YP   YP Y88888P 88   YD 
echo.
echo.
exit /b 0