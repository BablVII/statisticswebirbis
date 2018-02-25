unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles, Data.DB,
  Data.Win.ADODB, Vcl.ComCtrls,
  RegExpr, UMessengge, ComObj, Vcl.Grids;

type
  TForm1 = class(TForm)

    Memo1: TMemo;
    StatusBar1: TStatusBar;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ProgressBar1: TProgressBar;
    ADOConnection1: TADOConnection;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Xls_Save;
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  SearchRec: TSearchRec;
  Messengge: TMessengge;

implementation

{$R *.dfm}

procedure TForm1.Xls_Save;
const
  xlExcel9795 = $0000002B;
  xlExcel8 = 56;

var
  MyStringList: TStringList;
  i, k, r, c, l, m: integer;
  reg, reg2, reg3, reg4, reg5: TregExpr;
  f1: TextFile;
  a: ShortString;
  ExlApp, Sheet: OLEVariant;

begin

  AssignFile(f1, 'C:\Users\Svetyxa\Desktop\stat1\Win32\Debug\access.log'); //
  reset(f1);

  for i := 1 to 2 do
  begin
    readln(f1, a);
    Memo1.lines.Add(Messengge.MyAddIp('^(.*?) ', a, i));
    Memo1.lines.Add(Messengge.MyAddIp('- - \[(.*?) ', a, i));
    Memo1.lines.Add(Messengge.MyAddIp('"(.*?)"', a, i));
    Memo1.lines.Add(Messengge.MyAddIp('" (.*?) ', a, i));
    Memo1.lines.Add(Messengge.MyAddIp('" \d+ (.*?)$', a, i));
  end;
  CloseFile(f1);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Xls_Save;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    Ini.WriteInteger('Form', 'Top', Top);
    Ini.WriteInteger('Form', 'Left', Left);
    Ini.WriteString('Form', 'Caption', Caption);
    Ini.WriteBool('Form', 'InitMax', WindowState = wsMaximized);
  finally
    Ini.Free;
  end;

  // Str1.Free;
  // Reader1.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  Messengge := TMessengge.Create;
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    Top := Ini.ReadInteger('Form', 'Top', 100);
    Left := Ini.ReadInteger('Form', 'Left', 100);
    Caption := Ini.ReadString('Form', 'Caption', 'New Form');
    if Ini.ReadBool('Form', 'InitMax', false) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;
  finally
    Ini.Free;
  end;
end;

end.
