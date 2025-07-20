;
; Novium Installer Script File
; Created June 30th, 2025
;
; PLEASE MAKE SURE YOU CHANGE THE APP ID BEFORE COMPILING THE SCRIPT FILE!
; 

#define NoviumAppVer "2.0"
#define NoviumPublisher "HauberDevs"
#define NoviumExeName "Novium.exe"
#define InstallDirPath "C:"
#define NoviumDistPath = "C:\path\to\your\novium\binaries"
       
[Setup]
AppId=(replace with a unique app id by going to Tools -> Generate GUID)
AppName=Novium
AppVersion={#NoviumAppVer}
AppVerName=Novium {#NoviumAppVer}
AppPublisher={#NoviumPublisher}
DefaultDirName={#InstallDirPath}\Novium
DisableProgramGroupPage=yes
LicenseFile=novium_license.txt
OutputDir=installerbin\{#NoviumAppVer}
OutputBaseFilename=Novium-{#NoviumAppVer}-Setup-win32
SetupIconFile={#NoviumDistPath}\icon.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"

[Components]
Name: "vcredist"; Description: "{cm:VCComponent}"; Types: full compact custom; Flags: fixed
Name: "wininst31"; Description: "{cm:Wininst31Component}"; Types: full compact custom; Flags: fixed

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
; app files
Source: "{#NoviumDistPath}\novium.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\_bz2.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\_ctypes.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\_decimal.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\_hashlib.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\_lzma.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\_socket.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\_ssl.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\_tkinter.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\cacert.pem"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\novium.cfg"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\icon.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\novium.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\PIL._imaging.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\PIL._imagingcms.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\PIL._imagingft.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\PIL._imagingmath.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\PIL._imagingmorph.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\PIL._imagingtk.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\PIL._webp.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\pyexpat.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\python34.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\select.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\tcl86t.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\tk86t.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\unicodedata.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#NoviumDistPath}\images\*"; DestDir: "{app}\images"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#NoviumDistPath}\tcl\*"; DestDir: "{app}\tcl"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#NoviumDistPath}\fonts\*"; DestDir: "{app}\fonts"; Flags: ignoreversion recursesubdirs createallsubdirs
;Visual C++ Redistributale 2010 (32bit) dependency
Source: "Deps/VC Redist 2010 x86/vc_red.msi"; DestDir: "{tmp}"; Flags: deleteafterinstall; Components: vcredist
Source: "Deps/VC Redist 2010 x86/vc_red.cab"; DestDir: "{tmp}"; Flags: deleteafterinstall; Components: vcredist
;Windows Installer 3.1 v2 (KB893803) x86 dependency
Source: "Deps/Windows Installer 3.1 (KB893803)/windowsinstaller-kb893803-v2-x86.exe"; DestDir: "{tmp}"; Flags: deleteafterinstall; Components: wininst31

[CustomMessages]
english.StatusInstallingVC = Installing the Visual C++ 2010 Redistributable (x86)... This may take a moment.
german.StatusInstallingVC = Visual C++ 2010 Redistributable (32bit) wird installiert... Das kann einen Moment dauern
english.VCComponent=Visual C++ 2010 Redistributable (x86)
german.VCComponent=Visual C++ 2010 Redistributable (32bit)
english.Wininst31Component=Windows Installer 3.1 v2 (KB893803, x86)
german.Wininst31Component=Windows Installer 3.1 v2 (KB893803, 32bit)

[Code]
function NeedsMSIUpdate: Boolean;
var
  Version: string;
begin
  Result := True;
  if RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Installer', 'Version', Version) then
  begin
    if CompareStr(Version, '3.1.4000.2435') >= 0 then
      Result := False; 
  end;
end;

function NeedsVC2010Redist: Boolean;
var
  success: Boolean;
  keyExists: Boolean;
begin
  keyExists := RegKeyExists(HKLM, 'SOFTWARE\Microsoft\VisualStudio\10.0\VC\VCRedist\x86');
  Result := not keyExists;
end;

[Icons]
Name: "{commonprograms}\Novium"; Filename: "{app}\{#NoviumExeName}"
Name: "{commondesktop}\Novium"; Filename: "{app}\{#NoviumExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\Novium"; Filename: "{app}\{#NoviumExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\Novium"; Description: "{cm:LaunchProgram,{#StringChange("Novium", '&', '&&')}}"; Flags: nowait postinstall skipifsilent
; Run Windows Installer 3.1 if needed
Filename: "{tmp}\WindowsInstaller-KB893803-v2-x86.exe"; Parameters: "/quiet /norestart"; \
  Check: NeedsMSIUpdate; StatusMsg: "Updating Windows Installer..."
; install vc redist 2010 if needed
Filename: "msiexec.exe"; \
  Parameters: "/i ""{tmp}\vc_red.msi"" /quiet /norestart"; \
  StatusMsg: "{cm:StatusInstallingVC}"; Components: vcredist; \
  Check: NeedsVC2010Redist
