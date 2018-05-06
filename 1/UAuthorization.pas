unit UAuthorization;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    Authorization: TLabel;
    Head: TPanel;
    icon1_user: TImage;
    Authorization_user: TImage;
    Authorization_password: TImage;
    Edit_login: TEdit;
    Edit_password: TEdit;
    Enter: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure EnterMouseLeave(Sender: TObject);
    procedure EnterMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Edit_loginClick(Sender: TObject);
    procedure Edit_passwordClick(Sender: TObject);
    procedure EnterClick(Sender: TObject);

  private
    { Private declarations }
  public
    login, pass: string;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses UStatistic, UInterface;

procedure TForm1.EnterClick(Sender: TObject);
begin
  if (Edit_login.Text = login) and (Edit_password.Text = pass) then
    Form2.Show
  else
    Form1.close;
end;
// интерфейс

procedure TForm1.Edit_loginClick(Sender: TObject);
begin
  Edit_login.ReadOnly := false;
  Edit_login.Text := '';
  Edit_login.Font.Color := clblack;
end;

procedure TForm1.Edit_passwordClick(Sender: TObject);
begin
  Edit_password.ReadOnly := false;
  Edit_password.Text := '';
  Edit_password.Font.Color := clblack;
  Edit_password.PasswordChar := '*';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  login := '¬ведите логин'; // 'login';
  pass := '¬ведите пароль'; // '1234';
end;

procedure TForm1.EnterMouseLeave(Sender: TObject);
begin
  ButtonAuthorizationLeave;
end;

procedure TForm1.EnterMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ButtonAuthorizationMove;
end;

end.
