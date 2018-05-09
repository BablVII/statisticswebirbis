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
    Icon1_Statistic: TImage;
    Icon2_Diag: TImage;
    Icon3_Update: TImage;
    Icon4_Exit: TImage;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    RadioButton1: TRadioButton;
    Body: TPanel;
    ProgressBar1: TProgressBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Calendar: TDateTimePicker;
    Calendar1: TDateTimePicker;
    Panel2: TPanel;
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
    procedure FormActivate(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure StatisticMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ExitMouseLeave(Sender: TObject);
    procedure UpdatebaseClick(Sender: TObject);
    procedure StatisticClick(Sender: TObject);
    procedure HeadMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CalendarChange(Sender: TObject);
    procedure CountbuttonMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure CountbuttonMouseLeave(Sender: TObject);
    procedure CountbuttonClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    f1: TextFile;
    day, month, year, day1, month1, year1, variable, variable1: string;
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
  { if openexcel = false then
    begin
    ExlApp := CreateOleObject('Excel.Application'); // ñîçäàåì îáúåêò Excel
    ExlApp.visible := false; // äåëàåì îêíî Excel íåâèäèìûì
    if FileExists('Statistic.xls') then
    ExlApp.Workbooks.open(getcurrentdir + '\Statistic.xls')
    else
    begin
    ExlApp.Workbooks.Add; // ñîçäàåì êíèãó äëÿ ıêñïîğòà
    ExlApp.Worksheets.Add(After := ExlApp.Worksheets
    [ExlApp.Worksheets.Count]);
    ExlApp.Worksheets[1].Name := '2015';
    ExlApp.Worksheets[2].Name := '2016';
    ExlApp.Worksheets[3].Name := '2017';
    ExlApp.Worksheets[4].Name := '2018';
    end;
    ExlApp.DisplayAlerts := false; // îòêëş÷àåì âñå ïğåäóïğåæäåíèÿ Excel
    openexcel := true;
    end; }

end;

procedure TForm2.CountbuttonClick(Sender: TObject);
begin
  if year = '2015' then
    year := 'year2015'
  else if year = '2016' then
    year := 'year2016'
  else if year = '2017' then
    year := 'year2017'
  else
    year := 'year2018';

  if year1 = '2015' then
    year1 := 'year2015'
  else if year1 = '2016' then
    year1 := 'year2016'
  else if year1 = '2017' then
    year1 := 'year2017'
  else
    year1 := 'year2018';

  if year = year1 then
  begin
    if IValue.Caption = '0' then
    begin
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('select count(*) from  ' + year +
        ' WHERE date between "' + variable + '" and "' + variable1 + '";');
      ADOQuery1.Open;
      IValue.Caption := inttostr(ADOQuery1.Fields[0].AsInteger);
    end;

    if (Uniq.Checked = false) and (PDF.Checked = true) then
    begin
      if IValue1.Caption = '0' then
      begin
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select count(*) from ' + year +
          ' WHERE url like ''%pdf%'' and (date between "' + variable + '" and "'
          + variable1 + '");');
        ADOQuery1.Open;
        IValue1.Caption := inttostr(ADOQuery1.Fields[0].AsInteger);
      end;
    end;

    if (Uniq.Checked = true) and (PDF.Checked = false) then
    begin
      if IValue2.Caption = '0' then
      begin
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select count(DISTINCT (ip)) from ' + year +
          ' WHERE date between "' + variable + '" and "' + variable1 + '";');
        ADOQuery1.Open;
        IValue2.Caption := inttostr(ADOQuery1.Fields[0].AsInteger);
      end;
    end;

    if (Uniq.Checked = true) and (PDF.Checked = true) then
    begin
      if IValue3.Caption = '0' then
      begin
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select count(DISTINCT (ip)) from ' + year +
          ' WHERE url like ''%pdf%'' and (date between "' + variable + '" and "'
          + variable1 + '");');
        ADOQuery1.Open;
        IValue3.Caption := inttostr(ADOQuery1.Fields[0].AsInteger);
      end;
    end;
  end
  else //åñëè ğàçíûå ãîäà


end;

procedure TForm2.CalendarChange(Sender: TObject);
begin
  IValue.Caption := '0';
  IValue1.Caption := '0';
  IValue2.Caption := '0';
  IValue3.Caption := '0';
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
end;

{ procedure TForm2.Calendar1Change(Sender: TObject);
  begin
  day1 := formatdatetime('dd', (Calendar1.Date));
  month1 := formatdatetime('mm', (Calendar1.Date));
  year1 := formatdatetime('yyyy', (Calendar1.Date));
  variable1 := year1 + '-' + month1 + '-' + day1;
  if Calendar1.checked = false then
  begin
  if Length(inttostr(strtoint(day))) = 1 then
  day1 := '0' + inttostr(strtoint(day) + 1)
  else
  day1 := inttostr(strtoint(day) + 1);
  month1 := month;
  year1 := year;
  variable1 := year1 + '-' + month1 + '-' + day1;
  end;
  end; }

procedure TForm2.UpdatebaseClick(Sender: TObject);
var
  Date, a, a1, a2, a21, a22, a23, a3, a4, a5, year: string;
begin

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    (' delete from year2018 where date like where date >=''2018-01-01'' and date <=''2018-12-31'';');
  ADOQuery1.ExecSQL;

  AssignFile(f1, 'C:\Users\EldarNikel\Desktop\Ñâåòà\Apache-2.4_queriesa.log');
  reset(f1);
  a23 := Messengge.MyAddIp('\w{3}\/(\d{4}.*?)', a);
  if a23 = '2018' then
  begin
    repeat
      readln(f1, a);
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
      ADOQuery1.ExecSQL;
    until eof(f1);
  end;
  showmessage('Îáíîâëåíèå çàâåğøåíî');
  CloseFile(f1);
  // insert into year2018(ip,date,url,code,size) select ip,date,url,code,size from stable1 where date >='2018-01-01' and date <='2018-12-31'
end;

// èíòåğôåéñ

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
      // ôîğìàò xls 97-2003 åñëè óñòàíîâëåí 2003 Excel
      ExlApp.Workbooks[1].saveas(getcurrentdir + '\Statistic.xls', xlExcel9795);
    except
      // ôîğìàò xls 97-2003 åñëè óñòàíîâëåí 2007-2010 Excel
      ExlApp.Workbooks[1].saveas(getcurrentdir + '\Statistic.xls', xlExcel8);
    end;
    ExlApp.Quit; // çàêğûâàåì ïğèëîæåíèå Excel
    ExlApp := Unassigned; // î÷èùàåì âûäåëåííóş ïàìÿòü
  end;

end;

end.
