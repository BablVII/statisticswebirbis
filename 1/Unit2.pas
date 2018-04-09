unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles, Data.DB,
  Data.Win.ADODB, Vcl.ComCtrls,
  RegExpr, UMessengge, ComObj, Vcl.Grids, Data.DBXMySQL, Data.SqlExpr,
  Vcl.DBGrids, Vcl.Menus, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOTable1: TADOTable;
    Button1: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    ProgressBar1: TProgressBar;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    last: integer;
    f1: TextFile;
    a, a1, year: string;
    { Public declarations }
  end;

var
  Form2: TForm2;
  SearchRec: TSearchRec;
  Messengge: TMessengge;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.Button1Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('create table IF NOT EXISTS year2016 (id int NOT NULL AUTO_INCREMENT, ip varchar(30), date varchar(30), url text, code varchar(10), size varchar(30), PRIMARY KEY (id))');
  ADOQuery1.ExecSQL;

  AssignFile(f1, 'C:\Users\EldarNikel\Desktop\access.log');
  reset(f1);
  ProgressBar1.Max := 4820221;
  ProgressBar1.Min := 1;
  ProgressBar1.Visible := true;
  repeat
    readln(f1, a);
    ProgressBar1.Position := ProgressBar1.Position + 1;
    a1 := Messengge.MyAddIp('- - \[(.*?) ', a);
    year := Messengge.MyAddIp('\/(20..):', a1);
    if year = '2016' then
    begin
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('insert into year2016(ip,date,url,code,size) values("' +
        Messengge.MyAddIp('^(.*?) ', a) + '", "' +
        Messengge.MyAddIp('- - \[(.*?) ', a) + '", "' +
        Messengge.MyAddIp('"(.*?)" (200|400|403|501)', a) + '", "' +
        Messengge.MyAddIp('".*?" (.*?) ', a) + '", "' +
        Messengge.MyAddIp('" \d+ (.*?)$', a) + '");');
      ADOQuery1.ExecSQL;
    end;
  until eof(f1);
  CloseFile(f1);
  ProgressBar1.Visible := False;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
  StringGrid1.Visible := true;
  { case ComboBox1.ItemIndex of
    0:
    begin
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(ip) DISTINCT ip from stable where url like ''%pdf%'';');
    ADOQuery1.Open;
    end;
    end; }
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  Form1.hide;
end;

procedure TForm2.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  ADOConnection1.ConnectionString :=
    'Provider=MSDASQL.1;Password=1234;Persist Security Info=True;User ID=root;Extended Properties="Driver=MySQL ODBC 5.3 ANSI Driver;UID=root;PWD=1234;DATABASE=statistic;PORT=3306;COLUMN_SIZE_S32=1";Initial Catalog=statistic';
  ADOConnection1.Connected := true;
  Messengge := TMessengge.Create;
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  last := Ini.ReadInteger('Form', 'last', 4820221);
  StringGrid1.Cells[0, 0] := 'Запрос';
  StringGrid1.Cells[1, 0] := 'Количество';

  StringGrid1.Cells[0, 1] := 'Кол-во уникальных ip(pdf)';
  StringGrid1.Cells[0, 2] := 'Кол-во обращений';
  StringGrid1.Cells[0, 3] := 'Кол-во уникальных ip';
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

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini: TIniFile;
begin
  Form1.Close;
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    Ini.WriteInteger('Form', 'Top', Top);
    Ini.WriteInteger('Form', 'Left', Left);
    Ini.WriteString('Form', 'Caption', caption);
    Ini.WriteBool('Form', 'InitMax', WindowState = wsMaximized);
    Ini.WriteInteger('Form', 'last', last);
  finally
    Ini.Free;
  end;
end;

end.
