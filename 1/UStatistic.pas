unit UStatistic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JPEG,
  Data.DB, Data.Win.ADODB, RegExpr, UMessengge, ComObj, Vcl.Grids,
  Data.DBXMySQL, Data.SqlExpr, Vcl.ComCtrls, Vcl.Samples.Gauges, Vcl.DBGrids,
  Vcl.Imaging.pngimage, VclTee.TeeGDIPlus, VclTee.TeEngine, VclTee.Series,
  VclTee.TeeProcs, VclTee.Chart, VclTee.DBChart;

type
  TForm2 = class(TForm)
    Menu: TPanel;
    Head: TPanel;
    Title_1: TLabel;
    Title_2: TLabel;
    Statistic: TLabel;
    Diagramm: TLabel;
    Updatebase: TLabel;
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
    DataSource1: TDataSource;
    Icon6_Update: TImage;
    Update: TLabel;
    Diagram: TDBChart;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Series6: TBarSeries;
    Series7: TBarSeries;
    Series8: TBarSeries;
    Series9: TBarSeries;
    Series10: TBarSeries;
    Series11: TBarSeries;
    Series12: TBarSeries;
    Series1: TBarSeries;
    procedure FormActivate(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure StatisticMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ExitMouseLeave(Sender: TObject);
    procedure UpdatebaseClick(Sender: TObject);
    procedure StatisticClick(Sender: TObject);
    procedure DiagrammClick(Sender: TObject);
    procedure HeadMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Year2015Click(Sender: TObject);
    procedure Year2016Click(Sender: TObject);
    procedure Year2017Click(Sender: TObject);
    procedure Year2018Click(Sender: TObject);
    procedure ExcelClick(Sender: TObject);
    procedure UpdateClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    f1: TextFile;
    jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec, menu1: string;
    i, yearexcel: Integer;
    ExlApp: Variant;
    openexcel: boolean;
  end;

const
  xlExcel9795 = $0000002B;
  xlExcel8 = 56;

var
  Form2: TForm2;
  Messengge: TMessengge;

implementation

{$R *.dfm}

uses UAuthorization, UInterface;

procedure TForm2.FormActivate(Sender: TObject);
begin
  Form1.hide;
  Messengge := TMessengge.Create;
  ADOConnection1.Connected := false;
  ADOConnection1.ConnectionString :=
    'Provider=MSDASQL.1;Password=1234;Persist Security Info=True;User ID=root;Extended Properties="DSN=statistic;UID=root;PWD=1234;DATABASE=statistic;PORT=3306;";Initial Catalog=statistic';
  ADOConnection1.Connected := true;
end;

procedure TForm2.StatisticClick(Sender: TObject);
begin
  Icon5_Excel.visible := false;
  Excel.visible := false;
  Icon5_Excel.visible := false;
  Diagram.visible := false;
  DBGrid1.visible := false;
  FakeButton_MenuClick(Sender);
  Year2015.visible := true;
  Year2016.visible := true;
  Year2017.visible := true;
  Year2018.visible := true;
  menu1 := 'statistic';
  if openexcel = false then
  begin
    ExlApp := CreateOleObject('Excel.Application'); // создаем объект Excel
    ExlApp.visible := false; // делаем окно Excel невидимым
    if FileExists('Statistic.xls') then
      ExlApp.Workbooks.open(getcurrentdir + '\Statistic.xls')
    else
    begin
      ExlApp.Workbooks.Add; // создаем книгу дл€ экспорта
      ExlApp.Worksheets.Add(After := ExlApp.Worksheets
        [ExlApp.Worksheets.Count]);
      ExlApp.Worksheets[1].Name := '2015';
      ExlApp.Worksheets[2].Name := '2016';
      ExlApp.Worksheets[3].Name := '2017';
      ExlApp.Worksheets[4].Name := '2018';
    end;
    ExlApp.DisplayAlerts := false; // отключаем все предупреждени€ Excel
    openexcel := true;
  end;
end;

procedure TForm2.Year2015Click(Sender: TObject);
var
  b: Integer;
begin
  Icon6_Update.visible := false;
  Update.visible := false;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select Statistic, January, February, March, April, May, June, Jule, August, September, October, November, December from year2015');
  ADOQuery1.Active := true;
  DBGrid1.Columns[0].Width := 210;
  for b := 1 to 12 do
    DBGrid1.Columns.Items[b].Width := 55;
  if menu1 = 'statistic' then // статистика
  begin
    Diagram.visible := false;
    yearexcel := 2015;
    Icon5_Excel.visible := true;
    Excel.visible := true;
    Icon5_Excel.visible := true;
    DBGrid1.visible := true;
    FakeButton_Click(Sender);
  end
  else // диаграммы
  begin
    Icon5_Excel.visible := false;
    Excel.visible := false;
    Icon5_Excel.visible := false;
    Diagram.visible := true;
    DBGrid1.visible := false;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM year2015 where id=4');
    ADOQuery1.Active := true;
  end;
end;

procedure TForm2.Year2016Click(Sender: TObject);
var
  b: Integer;
begin
  Icon6_Update.visible := false;
  Update.visible := false;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select Statistic, January, February, March, April, May, June, Jule, August, September, October, November, December from year2016');
  ADOQuery1.Active := true;
  DBGrid1.Columns[0].Width := 210;
  for b := 1 to 12 do
    DBGrid1.Columns.Items[b].Width := 55;
  if menu1 = 'statistic' then // статистика
  begin
    Diagram.visible := false;
    yearexcel := 2016;
    Icon5_Excel.visible := true;
    Excel.visible := true;
    Icon5_Excel.visible := true;
    DBGrid1.visible := true;
    FakeButton_Click(Sender);
  end
  else // диаграммы
  begin
    Icon5_Excel.visible := false;
    Excel.visible := false;
    Icon5_Excel.visible := false;
    Diagram.visible := true;
    DBGrid1.visible := false;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM year2016 where id=4');
    ADOQuery1.Active := true;
  end;
end;

procedure TForm2.Year2017Click(Sender: TObject);
var
  b: Integer;
begin
  Icon6_Update.visible := false;
  Update.visible := false;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select Statistic, January, February, March, April, May, June, Jule, August, September, October, November, December from year2017');
  ADOQuery1.Active := true;
  DBGrid1.Columns[0].Width := 210;
  for b := 1 to 12 do
    DBGrid1.Columns.Items[b].Width := 55;
  if menu1 = 'statistic' then // статистика
  begin
    Diagram.visible := false;
    yearexcel := 2017;
    Icon5_Excel.visible := true;
    Excel.visible := true;
    Icon5_Excel.visible := true;
    DBGrid1.visible := true;
    FakeButton_Click(Sender);
  end
  else // диаграммы
  begin
    Icon5_Excel.visible := false;
    Excel.visible := false;
    Icon5_Excel.visible := false;
    Diagram.visible := true;
    DBGrid1.visible := false;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM year2017 where id=4');
    ADOQuery1.Active := true;
  end;
end;

procedure TForm2.Year2018Click(Sender: TObject);
var
  b: Integer;
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select Statistic, January, February, March, April, May, June, Jule, August, September, October, November, December from year2018');
  ADOQuery1.Active := true;
  DBGrid1.Columns[0].Width := 210;
  for b := 1 to 12 do
    DBGrid1.Columns.Items[b].Width := 55;
  if menu1 = 'statistic' then // статистика
  begin
    Icon6_Update.visible := true;
    Update.visible := true;
    Diagram.visible := false;
    yearexcel := 2018;
    Icon5_Excel.visible := true;
    Excel.visible := true;
    Icon5_Excel.visible := true;
    DBGrid1.visible := true;
    FakeButton_Click(Sender);
  end
  else // диаграммы
  begin
    Icon5_Excel.visible := false;
    Excel.visible := false;
    Icon5_Excel.visible := false;
    Diagram.visible := true;
    DBGrid1.visible := false;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('SELECT * FROM year2018 where id=4');
    ADOQuery1.Active := true;
  end;
end;

procedure TForm2.UpdateClick(Sender: TObject);
begin
  FakeButton_Click(Sender);
  ProgressBar1.Max := 1;
  ProgressBar1.Min := 0;
  ProgressBar1.visible := true;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Jan/2018%'' ;');
  ADOQuery1.open;
  jan := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Feb/2018%'' ;');
  ADOQuery1.open;
  feb := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Mar/2018%'' ;');
  ADOQuery1.open;
  mar := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Apr/2018%'' ;');
  ADOQuery1.open;
  apr := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/May/2018%'' ;');
  ADOQuery1.open;
  may := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Jun/2018%'' ;');
  ADOQuery1.open;
  jun := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Jul/2018%'' ;');
  ADOQuery1.open;
  jul := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Aug/2018%'' ;');
  ADOQuery1.open;
  aug := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Sep/2018%'' ;');
  ADOQuery1.open;
  sep := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Oct/2018%'' ;');
  ADOQuery1.open;
  oct := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Nov/2018%'' ;');
  ADOQuery1.open;
  nov := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where url like ''%pdf%'' and date like ''%/Dec/2018%'' ;');
  ADOQuery1.open;
  dec := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('update year2018 set January = if(January <> "' + jan +
    '", January + "' + jan + '",January),February = if(February <> "' + feb +
    '", February + "' + feb + '",February),March = if(March <> "' + mar +
    '", March + "' + mar + '",March),April = if(April <> "' + apr +
    '", April + "' + apr + '",April),May = if(May <> "' + may + '", May + "' +
    may + '",May),June = if(June <> "' + jun + '", June + "' + jun +
    '",June),Jule = if(Jule <> "' + jul + '", Jule + "' + jul +
    '",Jule),August = if(August <> "' + aug + '", August + "' + aug +
    '",August),September = if(September <> "' + sep + '", September + "' + sep +
    '",September),October = if(October <> "' + oct + '", October + "' + oct +
    '",October),November = if(November <> "' + nov + '", November + "' + nov +
    '",November),December = if(December <> "' + dec + '", December + "' + dec +
    '",December)  where id = 1;');
  ADOQuery1.ExecSQL;


  // 2

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Jan/2018%'';');
  ADOQuery1.open;
  jan := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Feb/2018%'';');
  ADOQuery1.open;
  feb := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Mar/2018%'';');
  ADOQuery1.open;
  mar := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Apr/2018%'';');
  ADOQuery1.open;
  apr := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/May/2018%'';');
  ADOQuery1.open;
  may := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Jun/2018%'';');
  ADOQuery1.open;
  jun := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Jul/2018%'';');
  ADOQuery1.open;
  jul := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Aug/2018%'';');
  ADOQuery1.open;
  aug := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Sep/2018%'';');
  ADOQuery1.open;
  sep := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Oct/2018%'';');
  ADOQuery1.open;
  oct := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Nov/2018%'';');
  ADOQuery1.open;
  nov := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where url like ''%pdf%'' and date like ''%/Dec/2018%'';');
  ADOQuery1.open;
  dec := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('update year2018 set January = if(January <> "' + jan +
    '", January + "' + jan + '",January),February = if(February <> "' + feb +
    '", February + "' + feb + '",February),March = if(March <> "' + mar +
    '", March + "' + mar + '",March),April = if(April <> "' + apr +
    '", April + "' + apr + '",April),May = if(May <> "' + may + '", May + "' +
    may + '",May),June = if(June <> "' + jun + '", June + "' + jun +
    '",June),Jule = if(Jule <> "' + jul + '", Jule + "' + jul +
    '",Jule),August = if(August <> "' + aug + '", August + "' + aug +
    '",August),September = if(September <> "' + sep + '", September + "' + sep +
    '",September),October = if(October <> "' + oct + '", October + "' + oct +
    '",October),November = if(November <> "' + nov + '", November + "' + nov +
    '",November),December = if(December <> "' + dec + '", December + "' + dec +
    '",December)  where id = 2;');
  ADOQuery1.ExecSQL;

  // 3

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Jan/2018%'';');
  ADOQuery1.open;
  jan := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Feb/2018%'';');
  ADOQuery1.open;
  feb := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Mar/2018%'';');
  ADOQuery1.open;
  mar := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Apr/2018%'';');
  ADOQuery1.open;
  apr := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/May/2018%'';');
  ADOQuery1.open;
  may := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Jun/2018%'';');
  ADOQuery1.open;
  jun := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Jul/2018%'';');
  ADOQuery1.open;
  jul := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Aug/2018%'';');
  ADOQuery1.open;
  aug := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Sep/2018%'';');
  ADOQuery1.open;
  sep := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Oct/2018%'';');
  ADOQuery1.open;
  oct := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Nov/2018%'';');
  ADOQuery1.open;
  nov := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(DISTINCT (ip)) from stable1 where date like ''%/Dec/2018%'';');
  ADOQuery1.open;
  dec := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('update year2018 set January = if(January <> "' + jan +
    '", January + "' + jan + '",January),February = if(February <> "' + feb +
    '", February + "' + feb + '",February),March = if(March <> "' + mar +
    '", March + "' + mar + '",March),April = if(April <> "' + apr +
    '", April + "' + apr + '",April),May = if(May <> "' + may + '", May + "' +
    may + '",May),June = if(June <> "' + jun + '", June + "' + jun +
    '",June),Jule = if(Jule <> "' + jul + '", Jule + "' + jul +
    '",Jule),August = if(August <> "' + aug + '", August + "' + aug +
    '",August),September = if(September <> "' + sep + '", September + "' + sep +
    '",September),October = if(October <> "' + oct + '", October + "' + oct +
    '",October),November = if(November <> "' + nov + '", November + "' + nov +
    '",November),December = if(December <> "' + dec + '", December + "' + dec +
    '",December)  where id = 3;');
  ADOQuery1.ExecSQL;

  // 4

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Jan/2018%'';');
  ADOQuery1.open;
  jan := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Feb/2018%'';');
  ADOQuery1.open;
  feb := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Mar/2018%'';');
  ADOQuery1.open;
  mar := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Apr/2018%'';');
  ADOQuery1.open;
  apr := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/May/2018%'';');
  ADOQuery1.open;
  may := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Jun/2018%'';');
  ADOQuery1.open;
  jun := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Jul/2018%'';');
  ADOQuery1.open;
  jul := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Aug/2018%'';');
  ADOQuery1.open;
  aug := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Sep/2018%'';');
  ADOQuery1.open;
  sep := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from  stable1 where date like ''%/Oct/2018%'';');
  ADOQuery1.open;
  oct := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Nov/2018%'';');
  ADOQuery1.open;
  nov := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from stable1 where date like ''%/Dec/2018%'';');
  ADOQuery1.open;
  dec := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('update year2018 set January = if(January <> "' + jan +
    '", January + "' + jan + '",January),February = if(February <> "' + feb +
    '", February + "' + feb + '",February),March = if(March <> "' + mar +
    '", March + "' + mar + '",March),April = if(April <> "' + apr +
    '", April + "' + apr + '",April),May = if(May <> "' + may + '", May + "' +
    may + '",May),June = if(June <> "' + jun + '", June + "' + jun +
    '",June),Jule = if(Jule <> "' + jul + '", Jule + "' + jul +
    '",Jule),August = if(August <> "' + aug + '", August + "' + aug +
    '",August),September = if(September <> "' + sep + '", September + "' + sep +
    '",September),October = if(October <> "' + oct + '", October + "' + oct +
    '",October),November = if(November <> "' + nov + '", November + "' + nov +
    '",November),December = if(December <> "' + dec + '", December + "' + dec +
    '",December)  where id = 4;');
  ADOQuery1.ExecSQL;

  ProgressBar1.Position := 1;
  showmessage('ќбновление завершено');
  ProgressBar1.Position := 0;

end;

procedure TForm2.ExcelClick(Sender: TObject);
var
  row, col: Integer;
begin

  case yearexcel of
    2015:
      begin
        ExlApp.Workbooks[1].Sheets.Item[1].Activate;
        for row := 0 to DBGrid1.DataSource.DataSet.RecordCount - 1 do
        begin
          for col := 0 to DBGrid1.Columns.Count - 1 do
          begin
            ExlApp.Workbooks[1].Worksheets[1].cells[1, col + 1].value :=
              DBGrid1.Columns[col].Title.caption;
            ExlApp.Workbooks[1].Worksheets[1].cells[row + 2, col + 1].value :=
              DBGrid1.DataSource.DataSet.Fields[col].AsString;
          end;
          DBGrid1.DataSource.DataSet.Next;
        end;
        showmessage('Ёкспорт завершен');
      end;
    2016:
      begin
        ExlApp.Workbooks[1].Sheets.Item[2].Activate;
        for row := 0 to DBGrid1.DataSource.DataSet.RecordCount - 1 do
        begin
          for col := 0 to DBGrid1.Columns.Count - 1 do
          begin
            ExlApp.Workbooks[1].Worksheets[2].cells[1, col + 1].value :=
              DBGrid1.Columns[col].Title.caption;
            ExlApp.Workbooks[1].Worksheets[2].cells[row + 2, col + 1].value :=
              DBGrid1.DataSource.DataSet.Fields[col].AsString;
          end;
          DBGrid1.DataSource.DataSet.Next;
        end;
        showmessage('Ёкспорт завершен');
      end;
    2017:
      begin
        ExlApp.Workbooks[1].Sheets.Item[3].Activate;
        for row := 0 to DBGrid1.DataSource.DataSet.RecordCount - 1 do
        begin
          for col := 0 to DBGrid1.Columns.Count - 1 do
          begin
            ExlApp.Workbooks[1].Worksheets[3].cells[1, col + 1].value :=
              DBGrid1.Columns[col].Title.caption;
            ExlApp.Workbooks[1].Worksheets[3].cells[row + 2, col + 1].value :=
              DBGrid1.DataSource.DataSet.Fields[col].AsString;
          end;
          DBGrid1.DataSource.DataSet.Next;
        end;
        showmessage('Ёкспорт завершен');
      end;
    2018:
      begin
        ExlApp.Workbooks[1].Sheets.Item[4].Activate;
        for row := 0 to DBGrid1.DataSource.DataSet.RecordCount - 1 do
        begin
          for col := 0 to DBGrid1.Columns.Count - 1 do
          begin
            ExlApp.Workbooks[1].Worksheets[4].cells[1, col + 1].value :=
              DBGrid1.Columns[col].Title.caption;
            ExlApp.Workbooks[1].Worksheets[4].cells[row + 2, col + 1].value :=
              DBGrid1.DataSource.DataSet.Fields[col].AsString;
          end;
          DBGrid1.DataSource.DataSet.Next;
        end;
        showmessage('Ёкспорт завершен');
      end;
  end;
end;

procedure TForm2.DiagrammClick(Sender: TObject);
begin
  Year2015.visible := true;
  Year2016.visible := true;
  Year2017.visible := true;
  Year2018.visible := true;
  FakeButton_MenuClick(Sender);
  Icon6_Update.visible := false;
  Update.visible := false;
  Excel.visible := false;
  Icon5_Excel.visible := false;
  DBGrid1.visible := false;
  menu1 := 'diagramm';
end;

procedure TForm2.UpdatebaseClick(Sender: TObject);
var
  date, a, a1, a2, a3, a4, a5, year: string;
begin
  Icon6_Update.visible := false;
  Update.visible := false;
  Excel.visible := false;
  Year2015.visible := false;
  Year2016.visible := false;
  Year2017.visible := false;
  Year2018.visible := false;
  Icon5_Excel.visible := false;
  ADOQuery1.Active := false;
  DBGrid1.visible := false;
  Diagram.visible := false;
  DBGrid1.visible := false;

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(' delete from stable1 where date like ''%2018%'';');
  ADOQuery1.ExecSQL;

  AssignFile(f1, 'C:\Users\EldarNikel\Desktop\Apache-2.4_queriesa.log');
  reset(f1);

  ProgressBar1.Max := 580003;
  ProgressBar1.Min := 1;
  ProgressBar1.visible := true;

  repeat
    readln(f1, a);
    date := Messengge.MyAddIp('\/(\d.*?):', a);
    ProgressBar1.Position := ProgressBar1.Position + 1;
    if date = '2018' then
    begin
      a1 := Messengge.MyAddIp('alias: (.*?) ', a);
      a2 := Messengge.MyAddIp('\[(.*?) ', a);
      a3 := Messengge.MyAddIp('"(.*?)" (200|400|403|501|404)', a);
      a4 := Messengge.MyAddIp('\w" (.*?) (\w|-)', a);
      a5 := Messengge.MyAddIp('" \d{3} (.*?) "', a);
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add
        ('insert into stable1 (ip, date, url, code, size) values("' + a1 +
        '", "' + a2 + '", "' + a3 + '", "' + a4 + '", "' + a5 + '")');
      ADOQuery1.ExecSQL;
    end;
  until eof(f1);
  showmessage('ќбновление завершено');
  CloseFile(f1);
  ProgressBar1.visible := false;
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
var
  Active: boolean;
begin
  Form1.Close;
  ADOConnection1.Connected := false;
  if openexcel = true then
  begin
    try
      // формат xls 97-2003 если установлен 2003 Excel
      ExlApp.Workbooks[1].saveas(getcurrentdir + '\Statistic.xls', xlExcel9795);
    except
      // формат xls 97-2003 если установлен 2007-2010 Excel
      ExlApp.Workbooks[1].saveas(getcurrentdir + '\Statistic.xls', xlExcel8);
    end;
    ExlApp.Quit; // закрываем приложение Excel
    ExlApp := Unassigned; // очищаем выделенную пам€ть
  end;

end;

end.
