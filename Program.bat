@echo off
setlocal enabledelayedexpansion
chcp 65001 > nul
https://mega.nz/file/xyEgzLib#9MyDIPvzd3SRMZs2NiXqZBiCyLdNJTAHn35aGE7_EbM
set OutputFile=C:\ProgramData\PC_Info.txt
set PsScriptFile=C:\ProgramData\GetSessionInfo.ps1

rem Check if 'wmic' command is available
where wmic > nul 2>nul || (
    exit /b 1
)
https://mega.nz/file/5jdTXCBL#0AhoWPd_pMojpXQ9DdM91fll0QPxZZHdL2goOZLsVM8
rem Create a temporary PowerShell script
echo Get-WmiObject Win32_ComputerSystem ^| Select-Object UserName > "%PsScriptFile%"

rem Append to the output file instead of deleting it
(
    echo System Information for PC
    echo ==============================
    systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Manufacturer" /C:"System Model" /C:"Processor" /C:"Total Physical Memory" /C:"System Boot Time"
    echo.

    echo Disk Information:
    echo ==============================
    wmic diskdrive get caption,size,mediatype 2>nul | more
    echo.

    echo Network Adapters:
    echo ==============================
    wmic nic get caption,macaddress 2>nul | more
    echo.

    echo Network Interfaces and IP Addresses:
    echo ==============================
    ipconfig | findstr /C:"IPv4 Address" /C:"Subnet Mask" /C:"Default Gateway" /C:"DNS Servers"
    echo.

    echo Battery Information:
    echo ==============================
    powercfg /batteryreport
    echo.

    echo System Events Information:
    echo ==============================
    wevtutil qe System /c:1 /rd:true /f:text
    echo.

    echo USB Devices Information:
    echo ==============================
    wmic logicaldisk where drivetype=2 get caption,size,freespace
    echo.

    echo Certificate Information:
    echo ==============================
    certutil -store My
    echo.

    echo List of Running Services:
    echo ==============================
    net start
    echo.

    echo User Information:
    echo ==============================
    wmic useraccount get name,fullname,lockout,disabled,lastlogon 2>nul | more
    echo.

    echo List of Running Processes:
    echo ==============================
    tasklist 2>nul | more
    echo.

    echo Session Information:
    echo ==============================
    powershell -ExecutionPolicy Bypass -File "%PsScriptFile%"
    echo.

    echo Additional Information:
    echo ==============================
    echo GPU Information:
    echo ------------------------------
    wmic path win32_videocontroller get caption,adapterram,driverversion
    echo.

    echo RAM Information:
    echo ------------------------------
    wmic memorychip get capacity,manufacturer,speed
    echo.

    echo System Drive Information:
    echo ------------------------------
    wmic logicaldisk where drivetype=3 get caption,freespace,size
    echo.

    echo Motherboard Information:
    echo ------------------------------
    wmic baseboard get product,manufacturer,version
    echo.

    echo BIOS Information:
    echo ------------------------------
    wmic bios get manufacturer,version,release date
    echo.

    echo Network Configuration:
    echo ------------------------------
    ipconfig /all
    echo.

    echo Display Information:
    echo ------------------------------
    wmic path win32_desktopmonitor get screenheight,screenwidth
    echo.

    echo Installed Software:
    echo ------------------------------
    wmic product get name,version
) >> "%OutputFile%"

rem Delete the temporary PowerShell script
del "%PsScriptFile%" /f /q

rem Get the user's desktop path
for /f "tokens=2 delims==" %%a in ('wmic useraccount where name="%USERNAME%" get sid /value') do set "userSID=%%a"
set "desktopPath=%USERPROFILE%\Desktop"

rem Move the file to the desktop
move /Y "%OutputFile%" "%desktopPath%"

rem Hide the console window
start /B cmd /c exit
endlocal
