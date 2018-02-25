unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles, Data.DB,
  Data.Win.ADODB, Vcl.ComCtrls,
  RegExpr, UMessengge, ComObj, Vcl.Grids, Data.DBXMySQL, Data.SqlExpr,
  Vcl.DBGrids;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    Button1: TButton;
    ProgressBar1: TProgressBar;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Clic(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

procedure TForm1.Button1Clic(Sender: TObject);

var
  MyStringList: TStringList;
  i, k, r, c, l, m: integer;
  reg, reg2, reg3, reg4, reg5: TregExpr;
  f1: TextFile;
  a1, a2, a3, a4, a5, a: ShortString;
  ExlApp, Sheet: OLEVariant;

begin

  AssignFile(f1, 'C:\Users\Svetyxa\Desktop\stat1\Win32\Debug\access.log'); //
  reset(f1);

  for i := 1 to 10 do
  begin
    readln(f1, a);
    ProgressBar1.Max := i;
    Form1.ProgressBar1.Position := Form1.ProgressBar1.Position + 1;
    a1 := Messengge.MyAddIp('^(.*?) ', a, i);
    a2 := Messengge.MyAddIp('- - \[(.*?) ', a, i);
    a3 := Messengge.MyAddIp('"(.*?)"', a, i);
    a4 := Messengge.MyAddIp('" (.*?) ', a, i);
    a5 := Messengge.MyAddIp('" \d+ (.*?)$', a, i);
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('insert into stable(ip, date, url, code, size) values("' +
      a1 + '", "' + a2 + '", "' + a3 + '", "' + a4 + '", "' + a5 + '")');
    ADOQuery1.ExecSQL;

    { Memo1.lines.Add(Messengge.MyAddIp('- - \[(.*?) ', a, i));
      Memo1.lines.Add(Messengge.MyAddIp('"(.*?)"', a, i));
      Memo1.lines.Add(Messengge.MyAddIp('" (.*?) ', a, i));
      Memo1.lines.Add(Messengge.MyAddIp('" \d+ (.*?)$', a, i)); }
  end;
  CloseFile(f1);

end;

procedure TForm1.Button2Click(Sender: TObject);
var i:integer;
begin
  for i := 1 to 10 do
  begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from stable;');
  ADOQuery1.active:=true;
  end;
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
