program Project1;

uses
  Vcl.Forms,
  UAuthorization in 'UAuthorization.pas' {Form1},
  UStatistic in 'UStatistic.pas' {Form2},
  UInterface in 'UInterface.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
