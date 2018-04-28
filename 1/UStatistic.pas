unit UStatistic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JPEG,
  Data.DB, Data.Win.ADODB, RegExpr, UMessengge, ComObj, Vcl.Grids,
  Data.DBXMySQL, Data.SqlExpr, Vcl.ComCtrls, Vcl.Samples.Gauges, Vcl.DBGrids;

type
  TForm2 = class(TForm)
    Menu: TPanel;
    Head: TPanel;
    Title_1: TLabel;
    Title_2: TLabel;
    Statistic: TLabel;
    Diagramm: TLabel;
    Update: TLabel;
    Exit: TLabel;
    Year2015: TLabel;
    Year2016: TLabel;
    Year2017: TLabel;
    Year2018: TLabel;
    Icon1_Statistic: TImage;
    Icon2_Diag: TImage;
    Icon3_Update: TImage;
    Icon4_Exit: TImage;
    Excel: TLabel;
    Icon5_Excel: TImage;
    Body: TPanel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ProgressBar1: TProgressBar;
    DBGrid1: TDBGrid;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure StatisticMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ExitMouseLeave(Sender: TObject);
    procedure UpdateClick(Sender: TObject);
    procedure StatisticClick(Sender: TObject);
    procedure DiagrammClick(Sender: TObject);
    procedure HeadMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Year2015Click(Sender: TObject);
    procedure Year2016Click(Sender: TObject);
    procedure Year2017Click(Sender: TObject);
    procedure Year2018Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    f1: TextFile;
    jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec: string;
    i: Integer;
  end;

var
  Form2: TForm2;
  Messengge: TMessengge;

implementation

{$R *.dfm}

uses UAuthorization, UInterface;

procedure TForm2.FormActivate(Sender: TObject);
begin
  Form1.hide;
  ADOConnection1.ConnectionString :=
    'Provider=MSDASQL.1;Password=1234;Persist Security Info=True;User ID=root;Extended Properties="Driver=MySQL ODBC 5.3 ANSI Driver;UID=root;PWD=1234;DATABASE=statistic;PORT=3306;COLUMN_SIZE_S32=1";Initial Catalog=statistic';
  ADOConnection1.Connected := true;
  Messengge := TMessengge.Create;
end;

procedure TForm2.UpdateClick(Sender: TObject);
var
  a, a1, a2, a3, a4, a5, year: string;
begin
  { ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('create table IF NOT EXISTS stable1 (id int NOT NULL AUTO_INCREMENT, ip varchar(30), date varchar(30), url text, code varchar(10), size varchar(30), PRIMARY KEY (id))');
    ADOQuery1.ExecSQL;

    AssignFile(f1, 'C:\Users\Svetyxa\Desktop\Диплом\Apache-2.4_queriesa.log');
    reset(f1);
    ProgressBar1.Max := 580003;
    ProgressBar1.Min := 1;
    ProgressBar1.Visible := true;
    for i := 1 to 580003 do
    begin
    readln(f1, a);
    Memo1.Lines.Add(inttostr(i));
    ProgressBar1.Position := ProgressBar1.Position + 1;
    a1 := Messengge.MyAddIp('alias: (.*?) ', a);
    a2 := Messengge.MyAddIp('\[(.*?) ', a);
    a3 := Messengge.MyAddIp('"(.*?)" (200|400|403|501|404)', a);
    a4 := Messengge.MyAddIp('\w" (.*?) (\w|-)', a); }
  // a5 := Messengge.MyAddIp('" \d{3} (.*?) "', a);
  { ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('insert into stable1 (ip, date, url, code, size) values("'
    + a1 + '", "' + a2 + '", "' + a3 + '", "' + a4 + '", "' + a5 + '")');
    ADOQuery1.ExecSQL;
    end;
    CloseFile(f1);
    ProgressBar1.Visible := False; }
end;

procedure TForm2.Year2015Click(Sender: TObject);
var
  b: Integer;
begin
  FakeButton_Click(Sender);
  Excel.visible := true;
  Icon5_Excel.visible := true;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select Statistic, January, February, March, April, May, June, Jule, August, September, October, November, December from year2015');
  ADOTable1.Active := true;
  ADOQuery1.Active := true;
  DBGrid1.visible := true;
  DBGrid1.Columns[0].Width := 210;
  for b := 1 to 12 do
    DBGrid1.Columns.Items[b].Width := 55;
end;

procedure TForm2.Year2016Click(Sender: TObject);
var
  b: Integer;
begin
  FakeButton_Click(Sender);
  Excel.visible := true;
  Icon5_Excel.visible := true;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select Statistic, January, February, March, April, May, June, Jule, August, September, October, November, December from year2016');
  ADOTable1.Active := true;
  ADOQuery1.Active := true;
  DBGrid1.visible := true;
  DBGrid1.Columns[0].Width := 210;
  for b := 1 to 12 do
    DBGrid1.Columns.Items[b].Width := 55;
end;

procedure TForm2.Year2017Click(Sender: TObject);
var
  b: Integer;
begin
  FakeButton_Click(Sender);
  Excel.visible := true;
  Icon5_Excel.visible := true;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select Statistic, January, February, March, April, May, June, Jule, August, September, October, November, December from year2017');
  ADOTable1.Active := true;
  ADOQuery1.Active := true;
  DBGrid1.visible := true;
  DBGrid1.Columns[0].Width := 210;
  for b := 1 to 12 do
    DBGrid1.Columns.Items[b].Width := 55;
end;

procedure TForm2.Year2018Click(Sender: TObject);
var
  b: Integer;
begin
  FakeButton_Click(Sender);
  Excel.visible := true;
  Icon5_Excel.visible := true;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select Statistic, January, February, March, April, May, June, Jule, August, September, October, November, December from year2018');
  ADOTable1.Active := true;
  ADOQuery1.Active := true;
  DBGrid1.visible := true;
  DBGrid1.Columns[0].Width := 210;
  for b := 1 to 12 do
    DBGrid1.Columns.Items[b].Width := 55;

  { Обновление значений
    ProgressBar1.Max := 1;
    ProgressBar1.Min := 0;
    ProgressBar1.visible := true;

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Jan/2018%'' ;');
    ADOQuery1.Open;
    jan := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Feb/2018%'' ;');
    ADOQuery1.Open;
    feb := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Mar/2018%'' ;');
    ADOQuery1.Open;
    mar := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Apr/2018%'' ;');
    ADOQuery1.Open;
    apr := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/May/2018%'' ;');
    ADOQuery1.Open;
    may := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Jun/2018%'' ;');
    ADOQuery1.Open;
    jun := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Jul/2018%'' ;');
    ADOQuery1.Open;
    jul := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Aug/2018%'' ;');
    ADOQuery1.Open;
    aug := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Sep/2018%'' ;');
    ADOQuery1.Open;
    sep := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Oct/2018%'' ;');
    ADOQuery1.Open;
    oct := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Nov/2018%'' ;');
    ADOQuery1.Open;
    nov := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Dec/2018%'' ;');
    ADOQuery1.Open;
    dec := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('update year2018 set January = January + "' + jan +
    '",February = February + "' + feb + '",March= March + "' + mar +
    '",April = April + "' + apr + '",May=May + "' + may + '",June= June + "' +
    jun + '",Jule = Jule + " ' + jul + ' ", August = August + " ' + aug + ' ", September = September + " ' + sep + '",October = October + "' + oct + '",November = November + "' + nov +
    '",December = December + "' + dec + '" where id = 1;');
    ADOQuery1.ExecSQL;


    // 2

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Jan/2018%'';');
    ADOQuery1.Open;
    jan := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Feb/2018%'';');
    ADOQuery1.Open;
    feb := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Mar/2018%'';');
    ADOQuery1.Open;
    mar := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Apr/2018%'';');
    ADOQuery1.Open;
    apr := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/May/2018%'';');
    ADOQuery1.Open;
    may := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Jun/2017%'';');
    ADOQuery1.Open;
    jun := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Jul/2017%'';');
    ADOQuery1.Open;
    jul := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Aug/2017%'';');
    ADOQuery1.Open;
    aug := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Sep/2017%'';');
    ADOQuery1.Open;
    sep := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Oct/2018%'';');
    ADOQuery1.Open;
    oct := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Nov/2018%'';');
    ADOQuery1.Open;
    nov := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Dec/2018%'';');
    ADOQuery1.Open;
    dec := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('update year2018 set January = January + "' + jan +
    '",February = February + "' + feb + '",March= March + "' + mar +
    '",April = April + "' + apr + '",May=May + "' + may + '",June= June + "' +
    jun + '",Jule = Jule + " ' + jul + ' ", August = August + " ' + aug + ' ", September = September + " ' + sep + '",October = October + "' + oct + '",November = November + "' + nov +
    '",December = December + "' + dec + '" where id = 2;');
    ADOQuery1.ExecSQL;

    // 3

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Jan/2018%'';');
    ADOQuery1.Open;
    jan := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Feb/2018%'';');
    ADOQuery1.Open;
    feb := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Mar/2018%'';');
    ADOQuery1.Open;
    mar := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Apr/2018%'';');
    ADOQuery1.Open;
    apr := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/May/2018%'';');
    ADOQuery1.Open;
    may := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Jun/2018%'';');
    ADOQuery1.Open;
    jun := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Jul/2018%'';');
    ADOQuery1.Open;
    jul := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Aug/2018%'';');
    ADOQuery1.Open;
    aug := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Sep/2018%'';');
    ADOQuery1.Open;
    sep := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Oct/2018%'';');
    ADOQuery1.Open;
    oct := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Nov/2018%'';');
    ADOQuery1.Open;
    nov := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Dec/2018%'';');
    ADOQuery1.Open;
    dec := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('update year2018 set January = January + "' + jan +
    '",February = February + "' + feb + '",March= March + "' + mar +
    '",April = April + "' + apr + '",May=May + "' + may + '",June= June + "' +
    jun + '",Jule = Jule + " ' + jul + ' ", August = August + " ' + aug + ' ", September = September + " ' + sep + '",October = October + "' + oct + '",November = November + "' + nov +
    '",December = December + "' + dec + '" where id = 3;');
    ADOQuery1.ExecSQL;

    // 4

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Jan/2018%'';');
    ADOQuery1.Open;
    jan := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Feb/2018%'';');
    ADOQuery1.Open;
    feb := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Mar/2018%'';');
    ADOQuery1.Open;
    mar := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Apr/2018%'';');
    ADOQuery1.Open;
    apr := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/May/2018%'';');
    ADOQuery1.Open;
    may := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Jun/2018%'';');
    ADOQuery1.Open;
    jun := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Jul/2018%'';');
    ADOQuery1.Open;
    jul := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Aug/2018%'';');
    ADOQuery1.Open;
    aug := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Sep/2018%'';');
    ADOQuery1.Open;
    sep := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from  stable1 where date like ''%/Oct/2018%'';');
    ADOQuery1.Open;
    oct := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Nov/2018%'';');
    ADOQuery1.Open;
    nov := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Dec/2018%'';');
    ADOQuery1.Open;
    dec := inttostr(ADOQuery1.Fields[0].AsInteger);

    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('update year2018 set January = January + "' + jan +
    '",February = February + "' + feb + '",March= March + "' + mar +
    '",April = April + "' + apr + '",May=May + "' + may + '",June= June + "' +
    jun + '",Jule = Jule + " ' + jul + ' ", August = August + " ' + aug + ' ", September = September + " ' + sep + '",October = October + "' + oct + '",November = November + "' + nov +
    '",December = December + "' + dec + '" where id = 4;');
    ADOQuery1.ExecSQL;

    ProgressBar1.Position := 1;
    showmessage('Done');
    ProgressBar1.Position := 0; }
end;

procedure TForm2.StatisticClick(Sender: TObject);
begin
  Year2015.visible := true;
  Year2016.visible := true;
  Year2017.visible := true;
  Year2018.visible := true;
end;

procedure TForm2.DiagrammClick(Sender: TObject);
begin
  Excel.visible := False;
  Year2015.visible := False;
  Year2016.visible := False;
  Year2017.visible := False;
  Year2018.visible := False;
  Icon5_Excel.visible := False;
   ADOTable1.Active := False;
  ADOQuery1.Active := False;
  DBGrid1.visible := False;
end;




// интерфейс

procedure TForm2.HeadMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SysCommand, $F012, 0);
end;

procedure TForm2.StatisticMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  FakeButton_MouseMove(Sender);
end;

procedure TForm2.ExitMouseLeave(Sender: TObject);
begin
  FakeButton_MouseLeave(Sender);
end;

procedure TForm2.ExitClick(Sender: TObject);
begin
  Form1.Close;
  ADOConnection1.Connected := False;
end;

end.
