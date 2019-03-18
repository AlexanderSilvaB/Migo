; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Robot One"
#define MyAppVersion "0.1"
#define MyAppPublisher "Alexander Silva Barbosa"
#define MyAppExeName "Robot One.exe"
;#define FilesFolder "C:\Users\alexa\Documents\Robot-One"
#define FilesFolder "..\.."

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{2E3CAF25-634D-46E0-A5B8-71B7946F3238}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
;OutputDir=C:\Users\alexa\Documents\Robot-One\src\installer\Windows
OutputDir=.
OutputBaseFilename=RobotOneSetup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
;Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1
Name: "install_python"; Description: "Install Python support"; GroupDescription: "API:";  Flags: checkedonce
Name: "install_matlab"; Description: "Install Matlab support (Not supported in 32 bit systems due Matlab restrictions)"; GroupDescription: "API:";  Flags: checkedonce

[Files]
Source: "{#FilesFolder}\build\Windows\Robot One.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#FilesFolder}\build\Windows\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#FilesFolder}\src\examples\*"; DestDir: "{app}\examples"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#FilesFolder}\softwares\modpath.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#FilesFolder}\softwares\matlab.bat"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#FilesFolder}\docs\*"; DestDir: "{app}\docs"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#FilesFolder}\softwares\python-2.7.16.msi"; DestDir: "{tmp}"; Tasks: install_python; Flags: ignoreversion deleteafterinstall
Source: "{#FilesFolder}\softwares\lib\robotOne.py"; DestDir: "{tmp}"; Tasks: install_python; Flags: ignoreversion deleteafterinstall
;Source: "{#FilesFolder}\softwares\python-2.7.16.amd64.msi"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall
Source: "{#FilesFolder}\softwares\unzip.exe"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall
Source: "{#FilesFolder}\softwares\gcc-8.2.0-x86.zip"; DestDir: "{tmp}"; Tasks: install_python; Flags: ignoreversion deleteafterinstall
;Source: "{#FilesFolder}\softwares\gcc-4.9.2-x86.zip"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall
Source: "{#FilesFolder}\softwares\gcc-4.9.2-x64.zip"; DestDir: "{tmp}"; Tasks: install_matlab; Flags: ignoreversion deleteafterinstall
;Source: "{#FilesFolder}\softwares\gcc-5.3.0-x86.zip"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall
Source: "{#FilesFolder}\softwares\gcc-5.3.0-x64.zip"; DestDir: "{tmp}"; Tasks: install_matlab; Flags: ignoreversion deleteafterinstall
;Source: "{#FilesFolder}\softwares\gcc-6.3.0-x86.zip"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall
Source: "{#FilesFolder}\softwares\gcc-6.3.0-x64.zip"; DestDir: "{tmp}"; Tasks: install_matlab; Flags: ignoreversion deleteafterinstall
Source: "{#FilesFolder}\softwares\lib\lib-x64.zip"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall
Source: "{#FilesFolder}\softwares\lib\lib-x86.zip"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

;[Registry]
;Root: "HKCU"; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers\"; ValueType: String; ValueName: "{app}\matlab.bat"; ValueData: "RUNASADMIN"; Flags: uninsdeletekeyifempty uninsdeletevalue; MinVersion: 0,6.1

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Library settings"; Filename: "{app}\matlab.bat"; WorkingDir: "{app}"; Check: IsWin64()
Name: "{group}\Examples"; Filename: "{app}\examples"
Name: "{group}\Docs"; Filename: "{app}\docs"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
;Filename: "msiexec.exe"; Parameters: "/i ""{tmp}\python-2.7.16.msi"" /qn TARGETDIR=C:\robot-one\python"; StatusMsg: "Installing Python 2.7"; Check: not IsWin64(); Tasks: install_python; Flags: skipifsilent
Filename: "msiexec.exe"; Parameters: "/i ""{tmp}\python-2.7.16.msi"" /qn TARGETDIR=C:\robot-one\python"; StatusMsg: "Python support: Installing Python 2.7"; Tasks: install_python; Flags: skipifsilent
;Filename: "msiexec.exe"; Parameters: "/i ""{tmp}\python-2.7.16.amd64.msi"" /qn TARGETDIR=C:\robot-one\python"; StatusMsg: "Installing Python 2.7"; Check: IsWin64(); Tasks: install_python; Flags: skipifsilent
Filename: "{app}\modpath.exe"; Parameters: "/add ""C:\robot-one\python"""; Tasks: install_python; StatusMsg: "Python support: Adding Python to path"; Flags: skipifsilent
Filename: "{tmp}\unzip.exe"; Parameters: "-n -qq {tmp}\gcc-8.2.0-x86.zip -d C:\robot-one\python-gcc"; Tasks: install_python; StatusMsg: "Python support: Installing GCC 8.2.0"; Flags: runhidden 
Filename: "{app}\modpath.exe"; Parameters: "/add ""C:\robot-one\python-gcc\gcc-8.2.0\bin"""; StatusMsg: "Python support: Adding GCC 8.2.0 to path"; Tasks: install_python;
Filename: "xcopy.exe"; Parameters: "{tmp}\robotOne.py C:\robot-one\python\Lib\site-packages /y"; Tasks: install_python; StatusMsg: "Python support: Installing library"; Flags: runhidden
;Filename: "{tmp}\unzip.exe"; Parameters: "-n -qq {tmp}\gcc-4.9.2-x86.zip -d C:\robot-one\mingw"; Tasks: install_matlab; Check: not IsWin64(); StatusMsg: "Installing MinGW 4.9.2"; Flags: runhidden 
Filename: "{tmp}\unzip.exe"; Parameters: "-n -qq {tmp}\gcc-4.9.2-x64.zip -d C:\robot-one\mingw"; Tasks: install_matlab; Check: IsWin64(); StatusMsg: "Matlab support: Installing MinGW 4.9.2"; Flags: runhidden 
;Filename: "{tmp}\unzip.exe"; Parameters: "-n -qq {tmp}\gcc-5.3.0-x86.zip -d C:\robot-one\mingw"; Tasks: install_matlab; Check: not IsWin64(); StatusMsg: "Installing MinGW 5.3.0"; Flags: runhidden  
Filename: "{tmp}\unzip.exe"; Parameters: "-n -qq {tmp}\gcc-5.3.0-x64.zip -d C:\robot-one\mingw"; Tasks: install_matlab; Check: IsWin64(); StatusMsg: "Matlab support: Installing MinGW 5.3.0"; Flags: runhidden  
;Filename: "{tmp}\unzip.exe"; Parameters: "-n -qq {tmp}\gcc-6.3.0-x86.zip -d C:\robot-one\mingw"; Tasks: install_matlab; Check: not IsWin64(); StatusMsg: "Installing MinGW 6.3.0"; Flags: runhidden  
Filename: "{tmp}\unzip.exe"; Parameters: "-n -qq {tmp}\gcc-6.3.0-x64.zip -d C:\robot-one\mingw"; Tasks: install_matlab; Check: IsWin64(); StatusMsg: "Matlab support: Installing MinGW 6.3.0"; Flags: runhidden         
Filename: "{app}\matlab.bat"; Tasks: install_matlab; Check: IsWin64(); StatusMsg: "Matlab support: Configuring version"; Flags: skipifsilent 
Filename: "{tmp}\unzip.exe"; Parameters: "-n -qq {tmp}\lib-x64.zip -d C:\robot-one\lib"; Check: IsWin64(); StatusMsg: "Installing libraries"; Flags: runhidden    
Filename: "{tmp}\unzip.exe"; Parameters: "-n -qq {tmp}\lib-x86.zip -d C:\robot-one\lib"; Check: not IsWin64(); StatusMsg: "Installing libraries"; Flags: runhidden
Filename: "{app}\modpath.exe"; Parameters: "/add ""C:\robot-one\lib"""; StatusMsg: "Adding libraries to path";  
Filename: "xcopy.exe"; Parameters: "C:\robot-one\lib\librobotOne.dll C:\robot-one\python\Lib\site-packages /y"; Tasks: install_python; StatusMsg: "Python support: Merging libraries"; Flags: runhidden
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

