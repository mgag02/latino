; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Latino"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "Lenguaje Latino"
#define MyAppURL "http://lenguaje-latino.org/"
#define MyAppExeName "latino.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{887BAB8B-D5EC-4D62-8224-DC99F3629CB4}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile="..\LICENSE.txt"
OutputDir="..\InnoSetup"
OutputBaseFilename=setup
SetupIconFile="..\InnoSetup\bin\latino.ico"
Compression=lzma
SolidCompression=yes
ChangesEnvironment=yes

[CustomMessages]
AppAddPath=Agregar aplicacion a la variable de entorno PATH (requerido)

[Languages]
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\InnoSetup\bin\*"; DestDir: "{app}\bin\"; Flags: ignoreversion
Source: "..\InnoSetup\lib\*"; DestDir: "{app}\lib\"; Flags: ignoreversion
Source: "..\include\*.h"; DestDir: "{app}\include\"; Flags: ignoreversion
;Source: "..\ejemplos\*"; DestDir: "{app}\ejemplos\"; Flags: ignoreversion recursesubdirs createallsubdirs

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\bin\{#MyAppExeName}"; IconFilename: "{app}\bin\latino.ico"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\bin\{#MyAppExeName}"; IconFilename: "{app}\bin\latino.ico"; Tasks: desktopicon

[Run]
Filename: "{app}\bin\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\bin;{app}\lib"
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "LATINO_PATH"; ValueData: "{app}"; Flags: preservestringtype
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "LATINO_LIBC"; ValueData: "{app}\lib\"; Flags: preservestringtype
Root: HKCU; Subkey: "Environment"; ValueType:string; ValueName: "LATINO_LIB"; ValueData: "{app}\stdlib\"; Flags: preservestringtype

[Tasks]
Name: modifypath; Description:{cm:AppAddPath};

[Code]
const
    ModPathName = 'modifypath';
    ModPathType = 'system';

function ModPathDir(): TArrayOfString;
begin
    setArrayLength(Result, 1)
    Result[0] := ExpandConstant('{app}');
end;

#include "modpath.iss"
