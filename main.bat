echo off
title binboesfix
color 1f
:VBSDynamicBuild
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{F11}"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
CSCRIPT //nologo "%TempVBSFile%"
:menu
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                                                                        I============================I
echo                                                                                                        I binboes 11 fix             I
echo                                                                                                        I============================I
echo                                                                                                        I   1. start debloating      I
echo                                                                                                        I   2. Extra                 I
echo                                                                                                        I   3. exit                  I
echo                                                                                                        I============================I
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                                                                    type the number of the action to start it
set /p choice=

if /i "%choice%"=="1" (
    goto begin
)

if /i "%choice%"=="2" (
    goto credits
)

if /i "%choice%"=="3" (
    exit
)


)
cls

:credits
cls
echo made by XdragonianX
echo Discord: xdragonianx
echo.
echo.
echo.
pause.
goto main

:begin
echo starting procces 
TIMEOUT /T 2 /NOBREAK>nul



rem disable telemetry and tracking

:: Remove Metadata Tracking
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /f

:: Disable Nvidia Telemetry
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\NvControlPanel2\Client" /v OptInOrOutPreference /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID44231 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID64640 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\FTS" /v EnableRID66610 /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NvTelemetryContainer" /v Start /t REG_DWORD /d 4 /f
for %%i in (NvTmMon NvTmRep NvProfile) do for /f "tokens=1 delims=," %%a in ('schtasks /query /fo csv^| findstr /v "TaskName"^| findstr "%%~i"') do schtasks /change /tn "%%a" /disable >nul 2>&1

:: Enforce Security-Only Telemetry (disable other kinds of Telemetry)
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

:: Disable Application Telemetry
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v AITEnable /t REG_DWORD /d 0 /f

:: Disable inking and typing recognition data sending
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Input\TIPC" /v Enabled /t REG_DWORD /d 0 /f

:: Disable app usage tracking
REG ADD "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\EdgeUI" /v DisableMFUTracking /t REG_DWORD /d 1 /f

:: Disable more data collection on explorer
REG ADD "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoInstrumentation /t REG_DWORD /d 1 /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoInstrumentation /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v PreventHandwritingErrorReports /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowDeviceNameInTelemetry /t REG_DWORD /d 0 /f

:: Disable more error reports
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v DoReport /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v ShowUI /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\PCHealth\ErrorReporting" /v DoReport /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\PCHealth\ErrorReporting" /v ShowUI /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d "Off" /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" /v EnabledV9 /t REG_DWORD /d 0 /f
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v HideRecentlyAddedApps /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v NoActiveHelp /t REG_DWORD /d 1 /f

:: Disable crash telemetry
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl\StorageTelemetry" /v DeviceDumpEnabled /t REG_DWORD /d 0 /f

:: Disable telemetry collector
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CompatTelRunner.exe" /v Debugger /t REG_SZ /d "%windir%\System32\taskkill.exe" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeviceCensus.exe" /v Debugger /t REG_SZ /d "%windir%\System32\taskkill.exe" /f



rem settings

:: vs to main
:: Set the path to VSCode executable
set "VSCodePath=E:\VSCode"

:: Define common registry key strings
set "regKeyHKCR=HKEY_CLASSES_ROOT"
set "regKeyCustomShell=%regKeyHKCR%\*\shell\Custom\shell\VsCode"
set "regKeyDirectoryShell=%regKeyHKCR%\Directory\shell\vscode"
set "regKeyDirectoryBackgroundShell=%regKeyHKCR%\Directory\Background\shell\vscode"

:: Add/Edit registry keys for editing with VSCode
reg add "%regKeyCustomShell%" /ve /d "Edit with VSCode" /f
reg add "%regKeyCustomShell%" /v Icon /d "%VSCodePath%\Code.exe,0" /f
reg add "%regKeyCustomShell%\command" /ve /d "\"%VSCodePath%\Code.exe\" \"%1\"" /f

:: Add/Edit registry keys for opening folder as VS Code project
reg add "%regKeyDirectoryShell%" /ve /d "Open Folder as VS Code Project" /f
reg add "%regKeyDirectoryShell%" /v Icon /d "%VSCodePath%\Code.exe,0" /f
reg add "%regKeyDirectoryShell%\command" /ve /d "\"%VSCodePath%\Code.exe\" \"%1\"" /f

:: Add/Edit registry keys for opening folder in VS Code project (background)
reg add "%regKeyDirectoryBackgroundShell%" /ve /d "Open Folder in VS Code Project" /f
reg add "%regKeyDirectoryBackgroundShell%" /v Icon /d "%VSCodePath%\Code.exe,0" /f
reg add "%regKeyDirectoryBackgroundShell%\command" /ve /d "\"%VSCodePath%\Code.exe\" \"%V\"" /f


:: disable auto update force stuff and auto apps
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v OemPreInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEnabled /t REG_DWORD /d 0 /f


rem debloating 


powershell "Get-AppxPackage -Allusers *Microsoft.BingWeather* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Getstarted* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *OfficeHub* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.BioEnrollment* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MicrosoftEdgeDevToolsClient* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Windows.ParentalControls* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.People* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.PeopleExperienceHost* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.SkypeApp* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Windows.Photos* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsAlarms* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsCamera* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *microsoft.windowscommunicationsapps* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsMaps* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *WindowsPhone* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.ZuneVideo* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.StorePurchaseApp* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *3DBuilder* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.YourPhone* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *StickyNotes* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *OneCalendar* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *OneConnect* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *ACG* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *CandyCrush* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *Facebook* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *Plex* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *Spotify* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *Twitter* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *Viber* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *3d* | Remove-AppxPackage"
powershell "Get-AppxPackage -AllUsers *Reader* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.GetHelp* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MixedReality.Portal* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Wallet* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Windows.NarratorQuickStart* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.XboxGameCallableUI* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Todos* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *OneDrive* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Windows.CallingShellApp* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.549981C3F5F10* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Minecraft* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MicrosoftEdge* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MicrosoftEdge.Stable* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *sway* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *holographic* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Office.OneNote* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *WebExperience* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.ScreenSketch* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *PowerAutomateDesktop* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Appconnector* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *CommsPhone* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *ConnectivityStore* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Messaging* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *MicrosoftPowerBIForWindows* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *NetworkSpeedTest* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Print3D* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Whiteboard* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *WindowsReadingList* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Clipchamp.Clipchamp* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *MicrosoftWindows.Client.WebExperience* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Windows.CBSPreview* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *MicrosoftTeams* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsFeedback* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Windows.ContactSupport* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WindowsStore* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *SpotifyMusic* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.ZuneVideo* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *ACGMediaPlayer* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *ActiproSoftwareLLC* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *AdobePhotoshopExpress* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Amazon.com.Amazon* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Asphalt8Airborne* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *AutodeskSketchBook* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *BubbleWitch3Saga* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *CaesarsSlotsFreeCasino* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *COOKINGFEVER* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *CyberLinkMediaSuiteEssentials* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *DisneyMagicKingdoms* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Disney* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Dolby* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *DrawboardPDF* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Duolingo-LearnLanguagesforFree* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *EclipseManager* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *FarmVille2CountryEscape* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *FitbitCoach* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Flipboard* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *HiddenCity* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Hulu* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *iHeartRadio* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Keeper* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *LinkedInforWindows* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *MarchofEmpires* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Netflix* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *NYTCrossword* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *PandoraMediaInc* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *PhototasticCollage* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *PicsArt-PhotoStudio* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Plex* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *PolarrPhotoEditorAcademicEdition* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *RoyalRevolt* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Shazam* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Sidia.LiveWallpaper* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *SlingTV* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Speed Test* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *TuneInRadio* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *WinZipUniversal* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Wunderlist* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *XING* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *SAMSUNGELECTRONICSCO* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Advertising.Xaml* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.PrintDialog* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WebpImageExtension* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.WebMediaExtensions* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.VP9VideoExtensions* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.HEIFImageExtension* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Windows.CBSPreview* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.Windows.ContentDeliveryManager* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.BingNews* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.GamingApp* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.ZuneMusic* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *Microsoft.OneDrive* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *MicrosoftCorporationII.QuickAssist* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *SpotifyAB.SpotifyMusic* | Remove-AppxPackage"
powershell "Get-AppxPackage -Allusers *WebExperience* | Remove-AppxPackage"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.ScreenSketch* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MicrosoftStickyNotes* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.GetHelp* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.WindowsFeedbackHub* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *MicrosoftWindows.Client.WebExperience* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.YourPhone* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.BingWeather* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.Getstarted* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.Microsoft3DViewer* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MicrosoftEdge.Stable* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MicrosoftOfficeHub* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.549981C3F5F10* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MicrosoftStickyNotes* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MixedReality.Portal* | Remove-AppxProvisionedPackage -online"
:: powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.MSPaint* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.Office.OneNote* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.People* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.StorePurchaseApp* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.SkypeApp* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.Wallet* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.Windows.Photos* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.WindowsAlarms* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.WindowsCamera* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *microsoft.windowscommunicationsapps* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.WindowsSoundRecorder* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.WindowsStore* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.ZuneMusic* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.ZuneVideo* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.BingNews* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.GamingApp* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Clipchamp.Clipchamp* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.PowerAutomateDesktop* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.Todos* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *Microsoft.WindowsMaps* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *MicrosoftCorporationII.QuickAssist* | Remove-AppxProvisionedPackage -online"
powershell "Get-AppxProvisionedPackage -online | Where PackageName -like *MicrosoftTeams* | Remove-AppxProvisionedPackage -online"
powershell "Get-WindowsPackage -Online | Where PackageName -like *QuickAssist* | Remove-WindowsPackage -Online -NoRestart"
powershell "Get-WindowsPackage -Online | Where PackageName -like *Hello-Face* | Remove-WindowsPackage -Online -NoRestart"
powershell "Get-WindowsOptionalFeature -Online | Where FeatureName -eq *WindowsMediaPlayer* | Disable-WindowsOptionalFeature -Online -NoRestart -WarningAction SilentlyContinue | Out-Null"
powershell "Get-WindowsOptionalFeature -Online | Where FeatureName -eq *WorkFolders-Client* | Disable-WindowsOptionalFeature -Online -NoRestart -WarningAction SilentlyContinue | Out-Null"
powershell "Get-WindowsOptionalFeature -Online | Where FeatureName -eq *Printing-XPSServices-Features* | Disable-WindowsOptionalFeature -Online -NoRestart -WarningAction SilentlyContinue | Out-Null"
powershell "Get-WindowsOptionalFeature -Online | Where FeatureName -eq *FaxServicesClientPackage* | Disable-WindowsOptionalFeature -Online -NoRestart -WarningAction SilentlyContinue | Out-Null"
powershell "Remove-Printer -Name "Fax" -ErrorAction SilentlyContinue"
powershell "Get-WindowsCapability -Online | Where Name -like *Media.WindowsMediaPlayer* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *MathRecognizer* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *Hello.Face* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *OpenSSH.Client* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *OpenSSH.Server* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *Print.Fax.Scan* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *Print.Management.Console* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *Microsoft.Windows.WordPad* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *App.StepsRecorder* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *OneCoreUAP.OneSync* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-WindowsCapability -Online | Where Name -like *Microsoft.Windows.PowerShell.ISE* | Remove-WindowsCapability -Online | Out-Null"
powershell "Get-AppPackage -Allusers *MicrosoftWindows.Client.CBS* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.Windows.SecureAssessmentBrowser* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.CredDialogHost* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.Windows.ParentalControls* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.MicrosoftEdgeDevToolsClient* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.Windows.PeopleExperienceHost* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.Windows.NarratorQuickStart* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.Win32WebViewHost* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.Windows.XGpuEjectDialog* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Windows.PrintDialog* | Remove-AppPackage"
powershell "Get-AppPackage -Allusers *Microsoft.MicrosoftEdge* | Remove-AppPackage"
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.XboxGamingOverlay_2.34.28001.0_neutral_~_8wekyb3d8bbwe
DISM /Online /Remove-ProvisionedAppxPackage /PackageName:Microsoft.WindowsMaps_2019.716.2316.0_neutral_~_8wekyb3d8bbwe





rem gui and gui settings



rem modding



rem patches
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense" /f



rem mkdir 

rem Create folders in Pictures directory
set "pictures_dir=%USERPROFILE%\Pictures"
mkdir "%pictures_dir%\screenshots"
mkdir "%pictures_dir%\geforce experience"
mkdir "%pictures_dir%\random memes"
mkdir "%pictures_dir%\smaller"
mkdir "%pictures_dir%\2024"

rem Create folders in Videos directory
set "videos_dir=%USERPROFILE%\Videos"
mkdir "%videos_dir%\video editor"
mkdir "%videos_dir%\geforce experience"
mkdir "%videos_dir%\random memes"
mkdir "%videos_dir%\movies"
mkdir "%videos_dir%\2024"

rem Create folders in Documents directory
set "documents_dir=%USERPROFILE%\Documents"
mkdir "%documents_dir%\books"
mkdir "%documents_dir%\tutorial"
mkdir "%documents_dir%\listsandmakingrandomstuff"

rem Create Musicstuff in Music directory
set "music_dir=%USERPROFILE%\Music"
mkdir "%music_dir%\Halo Music" 2>nul
mkdir "%music_dir%\Other Music" 2>nul
mkdir "%music_dir%\Sound Effects" 2>nul

rem Create Steam in user directory
set "steam_dir=%USERPROFILE%\Steam"
mkdir "%steam_dir%" 2>nul
mkdir "%steam_dir%\Steam Library" 2>nul
mkdir "%steam_dir%\Other Games" 2>nul
mkdir "%steam_dir%\Steam" 2>nul

rem Create Computerstuff in user directory
set "computer_stuff_dir=%USERPROFILE%\Computer Stuff"
mkdir "%computer_stuff_dir%" 2>nul

rem Hide OneDrive Folder
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowBreadcrumbs /t REG_DWORD /d 1 /f

pause
goto menu




