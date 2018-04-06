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
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private

  public
    { Public declarations }
    f1: TextFile;
    last, i: integer;
    a, a1, a2, a3, a4, a5, year: String;
  end;

var
  Form1: TForm1;
  SearchRec: TSearchRec;
  Messengge: TMessengge;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('create table IF NOT EXISTS year2015 (id int NOT NULL AUTO_INCREMENT, ip varchar(30), date varchar(30), url text, code varchar(10), size varchar(30), PRIMARY KEY (id))');
  ADOQuery1.ExecSQL;

  AssignFile(f1, 'C:\Users\EldarNikel\Desktop\access.log');
  reset(f1);
  Form1.ProgressBar1.Max := 4820221;
  Form1.ProgressBar1.Min := 1;
  Form1.ProgressBar1.Visible := true;
  Memo1.Visible := true;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('INSERT year2015 (ip,date,url,code,size) values ("' + a1 +
    '", "' + a2 + '","' + a3 + '","' + a4 + '","' + a5 + '") ;');
  repeat
    readln(f1, a);
    Form1.ProgressBar1.Position := Form1.ProgressBar1.Position + 1;
    a2 := Messengge.MyAddIp('- - \[(.*?) ', a);
    year := Messengge.MyAddIp('\/(20..):', a2);
    if year = '2015' then
    begin
      a1 := Messengge.MyAddIp('^(.*?) ', a);
      a3 := Messengge.MyAddIp('"(.*?)" (200|400|403|501)', a);
      a4 := Messengge.MyAddIp('".*?" (.*?) ', a);
      a5 := Messengge.MyAddIp('" \d+ (.*?)$', a);
      ADOQuery1.ExecSQL;
    end;
  until eof(f1);
  CloseFile(f1);
  Form1.ProgressBar1.Visible := False;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('create table IF NOT EXISTS year2016 (id int NOT NULL AUTO_INCREMENT, ip varchar(30), date varchar(30), url text, code varchar(10), size varchar(30), PRIMARY KEY (id))');
  ADOQuery1.ExecSQL;

  AssignFile(f1, 'C:\Users\EldarNikel\Desktop\access.log');
  reset(f1);
  Form1.ProgressBar1.Max := 4820221;
  Form1.ProgressBar1.Min := 1;
  Form1.ProgressBar1.Visible := true;
  Memo1.Visible := true;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('INSERT year2016 (ip,date,url,code,size) values ("' + a1 +
    '", "' + a2 + '","' + a3 + '","' + a4 + '","' + a5 + '") ;');
  repeat
    readln(f1, a);
    Form1.ProgressBar1.Position := Form1.ProgressBar1.Position + 1;
    a2 := Messengge.MyAddIp('- - \[(.*?) ', a);
    year := Messengge.MyAddIp('\/(20..):', a2);
    if year = '2016' then
    begin
      a1 := Messengge.MyAddIp('^(.*?) ', a);
      a3 := Messengge.MyAddIp('"(.*?)" (200|400|403|501)', a);
      a4 := Messengge.MyAddIp('".*?" (.*?) ', a);
      a5 := Messengge.MyAddIp('" \d+ (.*?)$', a);
      ADOQuery1.ExecSQL;
    end;
  until eof(f1);
  CloseFile(f1);
  Form1.ProgressBar1.Visible := False;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('create table IF NOT EXISTS year2017 (id int NOT NULL AUTO_INCREMENT, ip varchar(30), date varchar(30), url text, code varchar(10), size varchar(30), PRIMARY KEY (id))');
  ADOQuery1.ExecSQL;

  AssignFile(f1, 'C:\Users\EldarNikel\Desktop\access.log');
  reset(f1);
  Form1.ProgressBar1.Max := 4820221;
  Form1.ProgressBar1.Min := 1;
  Form1.ProgressBar1.Visible := true;
  Memo1.Visible := true;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('INSERT year2017 (ip,date,url,code,size) values ("' + a1 +
    '", "' + a2 + '","' + a3 + '","' + a4 + '","' + a5 + '") ;');
  repeat
    readln(f1, a);
    Form1.ProgressBar1.Position := Form1.ProgressBar1.Position + 1;
    a2 := Messengge.MyAddIp('- - \[(.*?) ', a);
    year := Messengge.MyAddIp('\/(20..):', a2);
    if year = '2017' then
    begin
      a1 := Messengge.MyAddIp('^(.*?) ', a);
      a3 := Messengge.MyAddIp('"(.*?)" (200|400|403|501)', a);
      a4 := Messengge.MyAddIp('".*?" (.*?) ', a);
      a5 := Messengge.MyAddIp('" \d+ (.*?)$', a);
      ADOQuery1.ExecSQL;
    end;
  until eof(f1);
  CloseFile(f1);
  Form1.ProgressBar1.Visible := False;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0:
      begin
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add
          ('select count(*) as kol from stable where url like ''%GET%'';');
        ADOQuery1.Open;
        Label2.Visible := true;
        DBGrid1.Visible := true;
        Label2.caption := inttostr(ADOQuery1.FieldByName('kol').AsInteger);
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add
          ('select count(*) as kol1 from stable where url like ''%POST%'';');
        ADOQuery1.Open;
        Label4.Visible := true;
        Label4.caption := inttostr(ADOQuery1.FieldByName('kol1').AsInteger);
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add
          ('select count(*) as kol2 from stable where url like ''%PDF%'';');
        ADOQuery1.Open;
        Label9.Visible := true;
        Label9.caption := inttostr(ADOQuery1.FieldByName('kol2').AsInteger);
        DBGrid1.Visible := False;
      end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  // подключение к базе
  { ADOConnection1.ConnectionString :=
    'Provider=MSDASQL.1;Persist Security Info=False;Extended Properties="Driver=MySQL ODBC 5.3 ANSI Driver;SERVER=192.168.125.253;UID=statistic;DATABASE=statistic;PORT=3306;COLUMN_SIZE_S32=1";Initial Catalog=statistic';
  } ADOConnection1.Connected := true;
  //
  Messengge := TMessengge.Create;
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  last := Ini.ReadInteger('Form', 'last', 4820221);
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
    Ini.WriteInteger('Form', 'last', last);
  finally
    Ini.Free;
  end;
end;

end.
