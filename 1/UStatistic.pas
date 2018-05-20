unit UStatistic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JPEG,
  Data.DB, Data.Win.ADODB, RegExpr, UMessengge, ComObj, Vcl.Grids,
  Data.DBXMySQL, Data.SqlExpr, Vcl.ComCtrls, Vcl.Samples.Gauges, Vcl.DBGrids,
  Vcl.Imaging.pngimage, VclTee.TeeGDIPlus, VclTee.TeEngine, VclTee.Series,
  VclTee.TeeProcs, VclTee.Chart, VclTee.DBChart, Vcl.DBCtrls;

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
    Icon1_Statistic: TImage;
    Icon3_Diag: TImage;
    Icon3_Update: TImage;
    Icon4_Exit: TImage;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    Body: TPanel;
    ProgressBar1: TProgressBar;
    Parametrs: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Calendar: TDateTimePicker;
    Calendar1: TDateTimePicker;
    Query: TPanel;
    Uniq: TCheckBox;
    PDF: TCheckBox;
    Countbutton: TPanel;
    IQuery: TLabel;
    IValue: TLabel;
    IQuery1: TLabel;
    IValue1: TLabel;
    IQuery2: TLabel;
    IValue2: TLabel;
    IQuery3: TLabel;
    IValue3: TLabel;
    Diagrammpanel: TPanel;
    Label3: TLabel;
    DBChart1: TDBChart;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    ComboBox1: TComboBox;
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
    IQuery4: TLabel;
    IValue4: TLabel;
    Dopdiagramm: TLabel;
    Icon2_Diag: TImage;
    Table1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Series1: TBarSeries;
    procedure FormActivate(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure UpdatebaseClick(Sender: TObject);
    procedure StatisticClick(Sender: TObject);
    procedure HeadMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CalendarChange(Sender: TObject);
    procedure CountbuttonMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure CountbuttonMouseLeave(Sender: TObject);
    procedure CountbuttonClick(Sender: TObject);
    procedure DiagrammClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DopdiagrammClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure StatisticMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Label9MouseLeave(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    f1: TextFile;
    day, month, year, day1, month1, year1, variable, variable1, year2,
      year3: string;
    i: Integer;
    ExlApp: Variant;
    openexcel, dop: boolean;
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
    'Provider=MSDASQL.1;Password=1234;Persist Security Info=True;User ID=root;Extended Properties="DSN=statistic;UID=root;PWD=1234;DATABASE=statistic;PORT=3306";Initial Catalog=statistic';
  ADOConnection1.Connected := true;
  Calendar.Date := now;
  Calendar1.Date := now;
end;

procedure TForm2.StatisticClick(Sender: TObject);
begin
  FakeButton_Mouseclick(Sender);
  Parametrs.visible := true;
  Query.visible := false;
  Diagrammpanel.visible := false;
  Deletevalue;
  Table1.visible := false;
end;

procedure TForm2.StatisticMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  FakeButton_MouseMove(Sender);
end;

procedure TForm2.CountbuttonClick(Sender: TObject);
begin
  Deletevalue;
  day := formatdatetime('dd', (Calendar.Date));
  month := formatdatetime('mm', (Calendar.Date));
  year := formatdatetime('yyyy', (Calendar.Date));
  variable := year + '-' + month + '-' + day;
  if Calendar1.Checked = false then
  begin
    if Length(inttostr(strtoint(day))) = 1 then
      day1 := '0' + inttostr(strtoint(day) + 1)
    else
      day1 := inttostr(strtoint(day) + 1);
    month1 := month;
    year1 := year;
    variable1 := year1 + '-' + month1 + '-' + day1;
  end
  else
  begin
    day1 := formatdatetime('dd', (Calendar1.Date));
    month1 := formatdatetime('mm', (Calendar1.Date));
    year1 := formatdatetime('yyyy', (Calendar1.Date));
    variable1 := year1 + '-' + month1 + '-' + day1;
  end;
  if year = '2015' then
  begin
    year := 'year2015';
    year2 := 'statistic2015'
  end
  else if year = '2016' then
  begin
    year := 'year2016';
    year2 := 'statistic2016'
  end
  else if year = '2017' then
  begin
    year := 'year2017';
    year2 := 'statistic2017'
  end
  else if year = '2018' then
  begin
    year := 'year2018';
    year2 := 'statistic2018'
  end
  else
    year := '';

  if year1 = '2015' then
    year1 := 'year2015'
  else if year1 = '2016' then
    year1 := 'year2016'
  else if year1 = '2017' then
    year1 := 'year2017'
  else if year1 = '2018' then
    year1 := 'year2018'
  else
    year1 := '';

  if year = year1 then
  begin
    Query.visible := true;
    if IValue.Caption = '0' then
    begin
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('select count(*) from  ' + year +
        ' WHERE (date between "' + variable + '" and "' + variable1 +
        '") and code=200 ;');
      ADOQuery1.open;
      IValue.Caption := inttostr(ADOQuery1.Fields[0].AsInteger);
      ///
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('select count(DISTINCT (iduser)) from  ' + year2 +
        ' WHERE (date between "' + variable + '" and "' + variable1 +
        '") and iduser<>0;');
      ADOQuery1.open;
      IValue4.Caption := inttostr(ADOQuery1.Fields[0].AsInteger);
    end;

    if (Uniq.Checked = false) and (PDF.Checked = true) then
    begin
      if IValue1.Caption = '0' then
      begin
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select count(*) from ' + year +
          ' WHERE (url like ''%pdf%'') and (date between "' + variable +
          '" and "' + variable1 + '") and code=200;');
        ADOQuery1.open;
        IValue1.Caption := inttostr(ADOQuery1.Fields[0].AsInteger);
      end;
    end;

    if (Uniq.Checked = true) and (PDF.Checked = false) then
    begin
      if IValue2.Caption = '0' then
      begin
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select count(DISTINCT (ip)) from ' + year +
          ' WHERE (date between "' + variable + '" and "' + variable1 +
          '") and code=200;');
        ADOQuery1.open;
        IValue2.Caption := inttostr(ADOQuery1.Fields[0].AsInteger);
      end;
    end;

    if (Uniq.Checked = true) and (PDF.Checked = true) then
    begin
      if IValue3.Caption = '0' then
      begin
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select count(DISTINCT (ip)) from ' + year +
          ' WHERE (url like ''%pdf%'') and (date between "' + variable +
          '" and "' + variable1 + '") and (code=200);');
        ADOQuery1.open;
        IValue3.Caption := inttostr(ADOQuery1.Fields[0].AsInteger);
      end;
      if IValue2.Caption = '0' then
      begin
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select count(DISTINCT (ip)) from ' + year +
          ' WHERE (date between "' + variable + '" and "' + variable1 +
          '") and code=200;');
        ADOQuery1.open;
        IValue2.Caption := inttostr(ADOQuery1.Fields[0].AsInteger);
      end;
      if IValue1.Caption = '0' then
      begin
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select count(*) from ' + year +
          ' WHERE (url like ''%pdf%'') and (date between "' + variable +
          '" and "' + variable1 + '") and code=200;');
        ADOQuery1.open;
        IValue1.Caption := inttostr(ADOQuery1.Fields[0].AsInteger);
      end;
    end;

  end
  else
    showmessage('Неверно указан диапазон')
end;

procedure TForm2.CalendarChange(Sender: TObject);
begin
  Deletevalue;
  IValue.Caption := '0';
  IValue1.Caption := '0';
  IValue2.Caption := '0';
  IValue3.Caption := '0';
  IValue4.Caption := '0';

end;

procedure TForm2.DiagrammClick(Sender: TObject);
begin
  Parametrs.visible := false;
  Query.visible := false;
  Diagrammpanel.visible := true;
  Deletevalue;
  DBChart1.visible := false;
  Table1.visible := false;
end;

procedure TForm2.DopdiagrammClick(Sender: TObject);
begin
  Parametrs.visible := false;
  Query.visible := false;
  Deletevalue;
  Diagrammpanel.visible := false;
  DBChart1.visible := false;
  Table1.visible := true;
  ADOQuery1.SQL.Clear;
  DBGrid1.visible := true;

end;

procedure TForm2.ComboBox1Change(Sender: TObject);

begin
  Deletevalue;
  DBChart1.visible := true;

  DBChart1.Legend.visible := true;
  DBChart1.AxisVisible := true;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from diagramm;');
  DBChart1.Series[0].YValues.ValueSource := 'january';
  DBChart1.Series[0].Title := 'Январь';
  DBChart1.Series[1].YValues.ValueSource := 'february';
  DBChart1.Series[1].Title := 'Февраль';
  DBChart1.Series[2].YValues.ValueSource := 'march';
  DBChart1.Series[2].Title := 'Март';
  DBChart1.Series[3].YValues.ValueSource := 'april';
  DBChart1.Series[3].Title := 'Апрель';
  DBChart1.Series[4].YValues.ValueSource := 'may';
  DBChart1.Series[4].Title := 'Май';
  DBChart1.Series[5].YValues.ValueSource := 'june';
  DBChart1.Series[5].Title := 'Июнь';
  DBChart1.Series[6].YValues.ValueSource := 'jule';
  DBChart1.Series[6].Title := 'Июль';
  DBChart1.Series[7].YValues.ValueSource := 'august';
  DBChart1.Series[7].Title := 'Август';
  DBChart1.Series[8].YValues.ValueSource := 'september';
  DBChart1.Series[8].Title := 'Сентябрь';
  DBChart1.Series[9].YValues.ValueSource := 'october';
  DBChart1.Series[9].Title := 'Октябрь';
  DBChart1.Series[10].YValues.ValueSource := 'november';
  DBChart1.Series[10].Title := 'Ноябрь';
  DBChart1.Series[11].YValues.ValueSource := 'december';
  DBChart1.Series[11].Title := 'Декабрь';
  DBChart1.Series[11].YValues.ValueSource := 'december';

  case ComboBox1.ItemIndex of
    0:
      begin

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select * from diagramm where id=1;');
        ADOQuery1.open;
        DBChart1.Title.Text.Clear;
        DBChart1.Title.Text.Add('Статистика посещений за 2015 год');

      end;
    1:
      begin

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select * from diagramm where id=2;');
        ADOQuery1.open;
        DBChart1.Title.Text.Clear;
        DBChart1.Title.Text.Add('Статистика посещений за 2016 год');

      end;

    2:
      begin

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select * from diagramm where id=3;');
        ADOQuery1.open;
        DBChart1.Title.Text.Clear;
        DBChart1.Title.Text.Add('Статистика посещений за 2017 год');

      end;

    3:

      begin
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select * from diagramm where id=4;');
        ADOQuery1.open;
        DBChart1.Title.Text.Clear;
        DBChart1.Title.Text.Add('Статистика посещений за 2018 год');

      end;
    4:
      begin

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select * from diagramm where id=5;');
        ADOQuery1.open;
        DBChart1.Title.Text.Clear;
        DBChart1.Title.Text.Add
          ('Статистика посещений по месяцам за весь период');

      end;
  end;

end;

procedure TForm2.Label4Click(Sender: TObject);
begin
  Fontstyle1(Sender);
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('SELECT dbn,  COUNT(dbn)  FROM statistic2015 GROUP BY DBN  ORDER BY COUNT(dbn) DESC;');
  ADOQuery1.open;

  DBGrid1.Columns[0].Title.Caption := 'База данных';
  DBGrid1.Columns[1].Title.Caption := 'Количество запросов';
end;

procedure TForm2.Label5Click(Sender: TObject);
begin
  Fontstyle1(Sender);
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('SELECT dbn, COUNT(dbn) FROM statistic2016 GROUP BY DBN  ORDER BY COUNT(dbn) DESC;');
  ADOQuery1.open;

  DBGrid1.Columns[0].Title.Caption := 'База данных';
  DBGrid1.Columns[1].Title.Caption := 'Количество запросов';
end;

procedure TForm2.Label6Click(Sender: TObject);
begin
  Fontstyle1(Sender);
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('SELECT dbn, COUNT(dbn) FROM statistic2017 GROUP BY DBN  ORDER BY COUNT(dbn) DESC;');
  ADOQuery1.open;

  DBGrid1.Columns[0].Title.Caption := 'База данных';
  DBGrid1.Columns[1].Title.Caption := 'Количество запросов';
end;

procedure TForm2.Label7Click(Sender: TObject);
begin
  Fontstyle1(Sender);
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('SELECT dbn, COUNT(dbn) FROM statistic2018 GROUP BY DBN  ORDER BY COUNT(dbn) DESC;');
  ADOQuery1.open;

  DBGrid1.Columns[0].Title.Caption := 'База данных';
  DBGrid1.Columns[1].Title.Caption := 'Количество запросов';
end;

procedure TForm2.Label9Click(Sender: TObject);
var
  row, col, b: Integer;
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from diagramm');
  ADOQuery1.active := true;

  if openexcel = false then
  begin
    ExlApp := CreateOleObject('Excel.Application'); // создаем объект Excel
    ExlApp.visible := false; // делаем окно Excel невидимым
    if FileExists('Statistic.xls') then
      ExlApp.Workbooks.open(getcurrentdir + '\Statistic.xls')
    else
    begin
      ExlApp.Workbooks.Add;
      // создаем книгу для экспорта
      ExlApp.Worksheets[1].Name := 'Данные за период';
    end;
    ExlApp.DisplayAlerts := false; // отключаем все предупреждения Excel
    openexcel := true;

  end;

  ExlApp.Workbooks[1].Sheets.Item[1].Activate;
  ExlApp.Cells[1, 1].Value := 'Статистика с '+variable+' по '+variable1;
  ExlApp.Cells[3,1].Value :=  IQuery.Caption;
  ExlApp.Cells[3,2].Value :=  IValue.Caption;
  ExlApp.Cells[4,1].Value :=  IQuery1.Caption;
  ExlApp.Cells[4,2].Value :=  IValue1.Caption;
  ExlApp.Cells[5,1].Value :=  IQuery2.Caption;
  ExlApp.Cells[5,2].Value :=  IValue2.Caption;
  ExlApp.Cells[6,1].Value :=  IQuery3.Caption;
  ExlApp.Cells[6,2].Value :=  IValue3.Caption;
  ExlApp.Cells[7,1].Value :=  IQuery4.Caption;
  ExlApp.Cells[7,2].Value :=  IValue4.Caption;
  For b:= 1 To 8 do
  begin
      ExlApp.Columns[1].ColumnWidth:= 40 ;
      ExlApp.Columns[2].ColumnWidth:= 16 ;
  end;


end;

// обновления

procedure TForm2.UpdatebaseClick(Sender: TObject);
var
  jan, feb, mar, apr, May, jun, jul, aug, sep, oct, nov, dec, summ1, Date, a,
    a1, a2, a21, a22, a23, a3, a4, a5, a11, a12, a13, year, sName: string;
  summ, FindRes, i: Integer;
  searchResult: TSearchRec;
  // поисковая переменная
begin
  Deletevalue;
  Table1.visible := false;
  Parametrs.visible := false;
  Query.visible := false;
  Diagrammpanel.visible := false;

    ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('truncate table year2018;');
  ADOQuery1.execsql;
  ProgressBar1.Position := 0;
  ProgressBar1.Max := 3;
  AssignFile(f1, '\\SVETYXA-ПК\log\Apache-2.4_queriesa.log');
  reset(f1);
  ProgressBar1.visible := true;
  repeat
    readln(f1, a);
    a23 := Messengge.MyAddIp('\w{3}\/(\d{4}.*?)', a);
    if a23 = '2018' then
    begin
      a1 := Messengge.MyAddIp('alias: (.*?) ', a);
      a21 := Messengge.MyAddIp('\[(.*?)\/\w{3}\/', a);
      a22 := Messengge.MyAddIp('\/(\w{3}.*?)\/\d{4}', a);
      if a22 = 'Jan' then
        a22 := '01'
      else if a22 = 'Feb' then
        a22 := '02'
      else if a22 = 'Mar' then
        a22 := '03'
      else if a22 = 'Apr' then
        a22 := '04'
      else if a22 = 'May' then
        a22 := '05'
      else if a22 = 'Jun' then
        a22 := '06'
      else if a22 = 'Jul' then
        a22 := '07'
      else if a22 = 'Aug' then
        a22 := '08'
      else if a22 = 'Sep' then
        a22 := '09'
      else if a22 = 'Oct' then
        a22 := '10'
      else if a22 = 'Nov' then
        a22 := '11'
      else
        a22 := '12';
      a2 := a23 + '-' + a22 + '-' + a21;
      a3 := Messengge.MyAddIp('"(.*?)" (200|400|403|501|40|206)', a);
      a4 := Messengge.MyAddIp('\w" (.*?) (\w|-)', a);
      a5 := Messengge.MyAddIp('" \d{3} (.*?) "', a);
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('insert into year2018(ip,date,url,code,size) values("' +
        a1 + '", "' + a2 + '", "' + a3 + '", "' + a4 + '", "' + a5 + '")');
      ADOQuery1.execsql;
    end;

  until eof(f1);;
  CloseFile(f1);
  ProgressBar1.Position := ProgressBar1.Position + 1;

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('truncate table statistic2018');
  ADOQuery1.execsql;


  setcurrentdir('C:\Users\EldarNikel\Desktop\Света\log');
  if FindFirst('*2018.log', faAnyFile, searchResult) = 0 then
  begin
    repeat
      AssignFile(f1, searchResult.Name);
      reset(f1);

      Repeat
        readln(f1, a);
        a11 := Messengge.MyAddIp('DateTime=(.*?)\.', a);
        a12 := Messengge.MyAddIp('DateTime=.{2}\.(.*?)\.', a);
        a13 := Messengge.MyAddIp('DateTime=.{2}\..{2}\.(.*?)( |&)', a);
        a1 := a13 + '-' + a12 + '-' + a11;
        a2 := Messengge.MyAddIp('DBN=(.*?)([& '#39'\d"_])', a);
        if a2 = 'ATHRU' then
          a2 := 'Алфавитно-предметный указатель УДК'
        else if a2 = 'ATHRB' then
          a2 := 'Алфавитно-предметные указатель ББК'
        else if a2 = 'TEZ' then
          a2 := 'Тезаурус'
        else if a2 = 'URUB' then
          a2 := 'Универсальный тематический навигатор'
        else if a2 = 'HELP' then
          a2 := 'Рубрикатор ГРНТИ'
        else if a2 = 'POST' then
          a2 := 'Каталог подписки периодики'
        else if a2 = 'PODB' then
          a2 := 'Каталог заказа книг'
        else if a2 = 'VUZ' then
          a2 := 'Учебные дисциплинвы'
        else if a2 = 'WORK' then
          a2 := 'Рабочая БД'
        else if a2 = 'MESH' then
          a2 := 'Предметные рубрики по медицине'
        else if a2 = 'RSUDC' then
          a2 := 'БД УДК'
        else if a2 = 'RSBBK' then
          a2 := 'БД ББК'
        else if a2 = 'KZD' then
          a2 := 'Календарь знаменательных дат'
        else if a2 = 'ELCAT' then
          a2 := 'Электронный каталог НТБ ЛФСибГТУ'
        else if a2 = 'HLIT' then
          a2 := 'Художественная литератула НТБ ЛфСибГУ'
        else if a2 = 'PER' then
          a2 := 'Периодические издания'
        else if a2 = 'NAUKA' then
          a2 := 'Научные издания'
        else if a2 = 'UCHLI' then
          a2 := 'Учебная литература'
        else if a2 = 'UMKD' then
          a2 := 'ЭУМКД'
        else if a2 = 'UMKD2' then
          a2 := 'УМКД ФГОС-3'
        else if a2 = 'VKR' then
          a2 := 'Выпускные квалификационные работы'
        else if a2 = 'VKR2' then
          a2 := 'ВКР 2017'
        else if a2 = 'IBIS' then
          a2 := 'Тестовая библиотечная БД'
        else if a2 = 'CMPL' then
          a2 := 'Комплектование в ИРБИС'
        else if a2 = 'RDR' then
          a2 := 'База данных читателей'
        else if a2 = 'RQST' then
          a2 := 'База данных заказов на выдачу литературы'
        else if a2 = 'IMAGE' then
          a2 := 'Имидж-каталог'
        else if a2 = 'ATHRC' then
          a2 := 'Авторитетный файл - "Коллективные авторы"'
        else if a2 = 'ATHRA' then
          a2 := 'Авторитетный файл - "Индивидуальные авторы"'
        else if a2 = 'ATHRS' then
          a2 := 'Авторитетный файл - "Предметные авторы"'
        else if a2 = 'ATHRU' then
          a2 := 'Алфавитно-предметный указатель УДК'
        else
          a2 := 'Другое';
        a3 := Messengge.MyAddIp('ID=(.*?)&', a);
        a4 := Messengge.MyAddIp('Host=(.*?)($|&)', a);

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add
          ('insert into statistic2018(date,DBN,IDuser,Host) values("' + a1 +
          '", "' + a2 + '","' + a3 + '", "' + a4 + '")');
        ADOQuery1.execsql;

      until eof(f1);

    until FindNext(searchResult) <> 0;
  end;

  ProgressBar1.Position := ProgressBar1.Position + 1;

  CloseFile(f1);
  FindClose(searchResult); // закрываем поиск

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from year2018 where date like ''%2018-01-%'';');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  jan := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from year2018 where date like ''%2018-02-%'';');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  feb := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from year2018 where date like ''%2018-03-%'';');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  mar := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from year2018 where date like ''%2018-04-%'';');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  apr := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from year2018 where date like ''%2018-05-%'';');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  May := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from year2018 where date like ''%2018-06-%'';');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  jun := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from year2018 where date like ''%2018-07-%'';');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  jul := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from year2018 where date like ''%2018-08-%'';');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  aug := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from year2018 where date like ''%2018-09-%'';');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  sep := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from year2018 where date like ''%2018-10-%'';');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  oct := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from year2018 where date like ''%2018-11-%'';');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  nov := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('select count(*) from year2018 where date like ''%2018-12-%'';');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  dec := inttostr(ADOQuery1.Fields[0].AsInteger);

  summ1 := inttostr(summ);
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('update diagramm set January = if(January <> "' + jan +
    '", January + "' + jan + '",January),February = if(February <> "' + feb +
    '", February + "' + feb + '",February),March = if(March <> "' + mar +
    '", March + "' + mar + '",March),April = if(April <> "' + apr +
    '", April + "' + apr + '",April),May = if(May <> "' + May + '", May + "' +
    May + '",May),June = if(June <> "' + jun + '", June + "' + jun +
    '",June),Jule = if(Jule <> "' + jul + '", Jule + "' + jul +
    '",Jule),August = if(August <> "' + aug + '", August + "' + aug +
    '",August),September = if(September <> "' + sep + '", September + "' + sep +
    '",September),October = if(October <> "' + oct + '", October + "' + oct +
    '",October),November = if(November <> "' + nov + '", November + "' + nov +
    '",November),December = if(December <> "' + dec + '", December + "' + dec +
    '",December), summ ="' + summ1 + '" where id = 4;');
  ADOQuery1.execsql;

  // сумма по месяцам
  summ := 0;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select SUM(january) FROM diagramm where year<>0;');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  jan := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select SUM(february) FROM diagramm where year<>0;');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  feb := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select SUM(march) FROM diagramm where year<>0;');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  mar := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select SUM(april) FROM diagramm where year<>0;');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  apr := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select SUM(may) FROM diagramm where year<>0;');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  May := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select SUM(june) FROM diagramm where year<>0;');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  jun := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select SUM(jule) FROM diagramm where year<>0;');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  jul := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select SUM(august) FROM diagramm where year<>0;');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  aug := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select SUM(september) FROM diagramm where year<>0;');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  sep := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select SUM(october) FROM diagramm where year<>0;');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  oct := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select SUM(november) FROM diagramm where year<>0;');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  nov := inttostr(ADOQuery1.Fields[0].AsInteger);

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select SUM(december) FROM diagramm where year<>0;');
  ADOQuery1.open;
  summ := summ + ADOQuery1.Fields[0].AsInteger;
  summ1 := inttostr(summ);
  dec := inttostr(ADOQuery1.Fields[0].AsInteger);
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('update diagramm set January = if(January <> "' + jan +
    '", January + "' + jan + '",January),February = if(February <> "' + feb +
    '", February + "' + feb + '",February),March = if(March <> "' + mar +
    '", March + "' + mar + '",March),April = if(April <> "' + apr +
    '", April + "' + apr + '",April),May = if(May <> "' + May + '", May + "' +
    May + '",May),June = if(June <> "' + jun + '", June + "' + jun +
    '",June),Jule = if(Jule <> "' + jul + '", Jule + "' + jul +
    '",Jule),August = if(August <> "' + aug + '", August + "' + aug +
    '",August),September = if(September <> "' + sep + '", September + "' + sep +
    '",September),October = if(October <> "' + oct + '", October + "' + oct +
    '",October),November = if(November <> "' + nov + '", November + "' + nov +
    '",November),December = if(December <> "' + dec + '", December + "' + dec +
    '",December), summ ="' + summ1 + '" where id = 5;');
  ADOQuery1.execsql;

  ProgressBar1.Position := ProgressBar1.Position + 1;
  ProgressBar1.visible := false;
  showmessage('Обновление завершено');
end;

// интерфейс

procedure TForm2.HeadMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SysCommand, $F012, 0);
end;

procedure TForm2.CountbuttonMouseLeave(Sender: TObject);
begin
  ButtonAuthorizationLeave;
end;

procedure TForm2.CountbuttonMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  ButtonAuthorizationMove;
end;

procedure TForm2.Label9MouseLeave(Sender: TObject);
begin
  FakeButton_Mouseleave(Sender);
end;

procedure TForm2.ExitClick(Sender: TObject);
var
  active: boolean;
begin
  Form1.close;
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
    ExlApp := Unassigned; // очищаем выделенную память
  end;

end;

end.
