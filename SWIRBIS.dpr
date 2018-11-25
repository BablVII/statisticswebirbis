program SWIRBIS;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UMainController in 'UMainController.pas',
  UFileApache in 'UFileApache.pas',
  UMainConstant in 'UMainConstant.pas',
  UMainLog in 'UMainLog.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
