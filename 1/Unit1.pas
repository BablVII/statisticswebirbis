unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles, Data.DB,
  Data.Win.ADODB, Vcl.ComCtrls,
  RegExpr, UMessengge, ComObj, Vcl.Grids, Data.DBXMySQL, Data.SqlExpr,
  Vcl.DBGrids, Vcl.Menus, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button5: TButton;
    ComboBox1: TComboBox;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

  private

  public
    { Public declarations }
    first, last: integer;
    f1: TextFile;
    k: integer;
  end;

var
  Form1: TForm1;
  SearchRec: TSearchRec;
  Messengge: TMessengge;

implementation

{$R *.dfm}

// 1 кнопка обновляет данные
procedure TForm1.Button1Click(Sender: TObject);
var
  i, j: integer;
  a1, a2, a3, a4, a5, a: String;
begin
  AssignFile(f1, 'C:\Users\Svetyxa\Desktop\stat1\Win32\Debug\access.log'); //
  reset(f1);
  ProgressBar1.Max := last;
  Form1.ProgressBar1.Visible := true;
  if first<>1 then for j  := 1 to first-1 do
  readln(f1);
  if first <> last then
    for i := first to last do
    begin
      readln(f1, a);
      Form1.ProgressBar1.Position := Form1.ProgressBar1.Position + 1;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add
        ('insert into stable(ip, date, url, code, size) values("' +
        Messengge.MyAddIp('^(.*?) ', a, i) + '", "' +
        Messengge.MyAddIp('- - \[(.*?) ', a, i) + '", "' +
        Messengge.MyAddIp('"(.*?)"', a, i) + '", "' +
        Messengge.MyAddIp('" (.*?) ', a, i) + '", "' +
        Messengge.MyAddIp('" \d+ (.*?)$', a, i) + '")');
      ADOQuery1.ExecSQL;
    end;
  CloseFile(f1);
  sleep(10);
  first := last+1;
  Form1.ProgressBar1.Visible := False;
end;

// кнопка 2 выводит таблицу
procedure TForm1.Button2Click(Sender: TObject);

begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from stable;');
  ADOQuery1.active := true;
  DBGrid1.Visible := true;
  Label1.caption := inttostr(DBGrid1.DataSource.DataSet.RecordCount);
end;

// 3 кнопка создает таблицу если не создана
procedure TForm1.Button3Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('create table IF NOT EXISTS stable ( ip varchar(30), date varchar(30), url text, code varchar(10),size varchar(30))');
  ADOQuery1.ExecSQL;
end;

// 4 кнопка удаляет таблицу
procedure TForm1.Button4Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('drop table stable;');
  ADOQuery1.ExecSQL;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin

  AssignFile(f1, 'C:\Users\Svetyxa\Desktop\stat1\Win32\Debug\access.log'); //
  reset(f1);
  k := 0;
  ProgressBar1.Max := last;
  Form1.ProgressBar1.Visible := true;
  while not(eof(f1)) do
  begin
    readln(f1);
    Form1.ProgressBar1.Position := Form1.ProgressBar1.Position + 1;
    inc(k);
  end;
  Form1.ProgressBar1.Visible := False;
  Label2.caption := inttostr(k);
  last := k;
  CloseFile(f1);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0:
      Label3.caption := '1';
    1:
      Label3.caption := '2';
    2:
      Label3.caption := '3';
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  // подключение к базе
  ADOConnection1.ConnectionString :=
    'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Extended Properties="DSN=statistic;UID=root;DATABASE=statistic;PORT=3306";Initial Catalog=statistic';
  ADOConnection1.Connected := true;
  //
  Messengge := TMessengge.Create;
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  first := Ini.ReadInteger('Form', 'first', 1);
  last := Ini.ReadInteger('Form', 'last', 100);
  try
    Top := Ini.ReadInteger('Form', 'Top', 100);
    Left := Ini.ReadInteger('Form', 'Left', 100);
    caption := Ini.ReadString('Form', 'Caption', 'New Form');
    if Ini.ReadBool('Form', 'InitMax', False) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;
  finally
    Ini.Free;
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
    Ini.WriteString('Form', 'Caption', caption);
    Ini.WriteBool('Form', 'InitMax', WindowState = wsMaximized);
    Ini.WriteInteger('Form', 'first', first);
    Ini.WriteInteger('Form', 'last', last);
  finally
    Ini.Free;
  end;
end;

end.
