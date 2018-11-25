unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  ShellAPI, ComObj, ActiveX;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    procedure ShellExecute(const AWnd: HWND;
      const AOperation, AFileName: String; const AParameters: String = '';
      const ADirectory: String = ''; const AShowCmd: Integer = SW_SHOWNORMAL);
    procedure WinExec(const ACmdLine: String;
      const ACmdShow: UINT = SW_SHOWNORMAL);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'cmd.exe', '/?', '', SW_SHOW);
  // ShellExecute(Handle, 'open', 'C:\Users\farid\php-7.2.4-nts-Win32-VC15-x86\php.exe', '-v', '', SW_SHOWNORMAL);
end;

procedure TForm1.ShellExecute(const AWnd: HWND; const AOperation, AFileName,
  AParameters, ADirectory: String; const AShowCmd: Integer);
var
  ExecInfo: TShellExecuteInfo;
  NeedUnitialize: Boolean;
begin
  Assert(AFileName <> '');

  NeedUnitialize := Succeeded(CoInitializeEx(nil, COINIT_APARTMENTTHREADED or
    COINIT_DISABLE_OLE1DDE));
  try
    FillChar(ExecInfo, SizeOf(ExecInfo), 0);
    ExecInfo.cbSize := SizeOf(ExecInfo);

    ExecInfo.Wnd := AWnd;
    ExecInfo.lpVerb := Pointer(AOperation);
    ExecInfo.lpFile := PChar(AFileName);
    ExecInfo.lpParameters := Pointer(AParameters);
    ExecInfo.lpDirectory := Pointer(ADirectory);
    ExecInfo.nShow := AShowCmd;
    ExecInfo.fMask :=
      SEE_MASK_NOASYNC { = SEE_MASK_FLAG_DDEWAIT для старых версий Delphi }
      or SEE_MASK_FLAG_NO_UI;
{$IFDEF UNICODE}
    // Необязательно, см. http://www.transl-gunsmoker.ru/2015/01/what-does-SEEMASKUNICODE-flag-in-ShellExecuteEx-actually-do.html
    ExecInfo.fMask := ExecInfo.fMask or SEE_MASK_UNICODE;
{$ENDIF}
{$WARN SYMBOL_PLATFORM OFF}
    Win32Check(ShellExecuteEx(@ExecInfo));
{$WARN SYMBOL_PLATFORM ON}
  finally
    if NeedUnitialize then
      CoUninitialize;
  end;
end;

procedure TForm1.WinExec(const ACmdLine: String; const ACmdShow: UINT);
var
  SI: TStartupInfo;
  PI: TProcessInformation;
  CmdLine: String;
begin
  Assert(ACmdLine <> '');

  CmdLine := ACmdLine;
  UniqueString(CmdLine);

  FillChar(SI, SizeOf(SI), 0);
  FillChar(PI, SizeOf(PI), 0);
  SI.cb := SizeOf(SI);
  SI.dwFlags := STARTF_USESHOWWINDOW;
  SI.wShowWindow := ACmdShow;

  SetLastError(ERROR_INVALID_PARAMETER);
{$WARN SYMBOL_PLATFORM OFF}
  Win32Check(CreateProcess(nil, PChar(CmdLine), nil, nil, False,
    CREATE_DEFAULT_ERROR_MODE
{$IFDEF UNICODE} or CREATE_UNICODE_ENVIRONMENT{$ENDIF}, nil, nil, SI, PI));
{$WARN SYMBOL_PLATFORM ON}
  CloseHandle(PI.hThread);
  CloseHandle(PI.hProcess);
end;

end.
