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
    Label1: TLabel;
    Label2: TLabel;
    Button5: TButton;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

  private

  public
    { Public declarations }
    last: int64;
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
  i, j, k: int64;
  a, a1, a2, a3, a4, a5: String;
begin
  AssignFile(f1, 'C:\Users\Svetyxa\Desktop\access.log');
  reset(f1);
  Form1.ProgressBar1.Visible := true;
  Memo1.Visible := true;
  for i := 1 to 10 do
  begin
    readln(f1, a);
    Form1.ProgressBar1.Position := Form1.ProgressBar1.Position + 1;
    Memo1.Lines.Clear;
    Memo1.Lines.Add(inttostr(i));
    a1 := Messengge.MyAddIp('^(.*?) ', a);
    a2 := Messengge.MyAddIp('- - \[(.*?) ', a);
    a3 := Messengge.MyAddIp('"(.*?)" (200|400|403|501)', a);
    a4 := Messengge.MyAddIp('".*?" (.*?) ', a);
    a5 := Messengge.MyAddIp('" \d+ (.*?)$', a);
    ADOquery1.sql.text := 'select count(ip) from test where ip=:a1';
    ADOquery1.parameters.params[0].value := a1;
    ADOquery1.open;

    if ADOquery1.isempty then // в count(ip) получили null, значит совпадений нет
    begin
      // тут код для добавления
      ADOquery1.sql.text := 'insert test (ip) values (:a1)';
      ADOquery1.parameters.params[0].value := a1;
      ADOquery1.ExecSQL;
      Showmessage('Добавили');
    end
    else
      Showmessage(query.fields[0].asString); // выводим количество повторов

    { ADOQuery1.SQL.Add
      ('insert  into test (ip, date, url, code, size) values("' +
      Messengge.MyAddIp('^(.*?) ', a) + '", "' +
      Messengge.MyAddIp('- - \[(.*?) ', a) + '", "' +
      Messengge.MyAddIp('"(.*?)" (200|400|403|501)', a) + '", "' +
      Messengge.MyAddIp('".*?" (.*?) ', a) + '", "' +
      Messengge.MyAddIp('" \d+ (.*?)$', a) + '")'); }
    { for j := 1 to 10 do }

  end;
  CloseFile(f1);
  Form1.ProgressBar1.Visible := False;
end;

// кнопка 2 выводит таблицу
procedure TForm1.Button2Click(Sender: TObject);
begin
  ADOQuery1.sql.Clear;
  ADOQuery1.sql.Add('select * from test;');
  ADOQuery1.active := true;
  DBGrid1.Visible := true;
  Label1.Visible := true;
  Label1.caption := inttostr(DBGrid1.DataSource.DataSet.RecordCount);
end;

// 5 кнопка подсчет строк в файле
procedure TForm1.Button5Click(Sender: TObject);
begin
  AssignFile(f1, 'C:\Users\Svetyxa\Desktop\access.log');
  reset(f1);
  k := 0;
  while not(Eof(f1)) do
  begin
    readln(f1);
    inc(k);
  end;
  Label5.Visible := true;
  Label5.caption := inttostr(k);
  last := k;
  CloseFile(f1);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0:
      begin
        ADOQuery1.sql.Clear;
        ADOQuery1.sql.Add
          ('select count(*) as kol from stable where url like ''%GET%'';');
        ADOQuery1.open;
        Label2.Visible := true;
        Label2.caption := inttostr(ADOQuery1.FieldByName('kol').AsInteger);
        ADOQuery1.sql.Clear;
        ADOQuery1.sql.Add
          ('select count(*) as kol1 from stable where url like ''%POST%'';');
        ADOQuery1.open;
        Label4.Visible := true;
        Label4.caption := inttostr(ADOQuery1.FieldByName('kol1').AsInteger);
      end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  // подключение к базе
  ADOConnection1.ConnectionString :=
    'Provider=MSDASQL.1;Password=1234;Persist Security Info=True;User ID=root;Extended Properties="DSN=statistic;UID=root;PWD=1234;DATABASE=statistic;PORT=3306";Initial Catalog=statistic';
  ADOConnection1.Connected := true;
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
