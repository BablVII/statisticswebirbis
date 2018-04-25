unit UStatistic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JPEG,
  Data.DB, Data.Win.ADODB, RegExpr, UMessengge, ComObj, Vcl.Grids,
  Data.DBXMySQL, Data.SqlExpr, Vcl.ComCtrls, Vcl.Samples.Gauges;

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
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Memo1: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure StatisticMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ExitMouseLeave(Sender: TObject);
    procedure Year2015Click(Sender: TObject);
    procedure Year2016Click(Sender: TObject);
    procedure Year2017Click(Sender: TObject);
    procedure Year2018Click(Sender: TObject);
    procedure UpdateClick(Sender: TObject);
    procedure StatisticClick(Sender: TObject);
    procedure DiagrammClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

    procedure HeadMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
  public
    { Public declarations }
    f1: TextFile;

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
  i: Integer;
  a, a1, a2, a3, a4, a5, year: string;
begin
  ADOQuery1.SQL.Clear;
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
    a4 := Messengge.MyAddIp('\w" (.*?) (\w|-)', a);
    a5 := Messengge.MyAddIp('" \d{3} (.*?) "', a);
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('insert into stable1 (ip, date, url, code, size) values("'
      + a1 + '", "' + a2 + '", "' + a3 + '", "' + a4 + '", "' + a5 + '")');
    ADOQuery1.ExecSQL;
  end;
  CloseFile(f1);
  ProgressBar1.Visible := False;
end;

procedure TForm2.StatisticClick(Sender: TObject);
begin
  Year2015.Visible := true;
  Year2016.Visible := true;
  Year2017.Visible := true;
  Year2018.Visible := true;
end;

{ case
  0 procedure x (date(''''#39'%2015%'#39''''))
  1
  2
  3 }

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0:
      begin
        Label1.Visible := true;
        Label2.Visible := true;
        Label3.Visible := true;
        Label4.Visible := true;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add
          ('select count(DISTINCT (ip)) from stable where url like ''%pdf%'' and date like ''%2015%'' ;');
        ADOQuery1.Open;
        Label5.caption := inttostr(ADOQuery1.Fields[0].AsInteger);
        Label5.Visible := true;

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add
          ('select count(*) from stable where url like ''%pdf%'' and date like ''%2015%'';');
        ADOQuery1.Open;
        Label6.caption := inttostr(ADOQuery1.Fields[0].AsInteger);
        Label6.Visible := true;

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add
          ('select count(DISTINCT (ip)) from stable where date like ''%2015%'';');
        ADOQuery1.Open;
        Label7.caption := inttostr(ADOQuery1.Fields[0].AsInteger);
        Label7.Visible := true;

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add
          ('select count(*) from stable where date like ''%2015%'';');
        ADOQuery1.Open;
        Label8.caption := inttostr(ADOQuery1.Fields[0].AsInteger);
        Label8.Visible := true;
      end;
    1:
      begin
        Label1.Visible := true;
        Label2.Visible := true;
        Label3.Visible := true;
        Label4.Visible := true;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add
          ('select count(DISTINCT (ip)) from stable where url like ''%pdf%'' and date like ''%/Jan/2015%'' ;');
        ADOQuery1.Open;
        Label5.caption := inttostr(ADOQuery1.Fields[0].AsInteger);
        Label5.Visible := true;

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add
          ('select count(*) from stable where url like ''%pdf%'' and date like ''%/Jan/2015%'';');
        ADOQuery1.Open;
        Label6.caption := inttostr(ADOQuery1.Fields[0].AsInteger);
        Label6.Visible := true;

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add
          ('select count(DISTINCT (ip)) from stable where date like ''%/Jan/2015%'';');
        ADOQuery1.Open;
        Label7.caption := inttostr(ADOQuery1.Fields[0].AsInteger);
        Label7.Visible := true;

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add
          ('select count(*) from stable where date like ''%/Jan/2015%'';');
        ADOQuery1.Open;
        Label8.caption := inttostr(ADOQuery1.Fields[0].AsInteger);
        Label8.Visible := true;

      end;

  end;
end;

procedure TForm2.DiagrammClick(Sender: TObject);
begin
  Excel.Visible := False;
  Year2015.Visible := False;
  Year2016.Visible := False;
  Year2017.Visible := False;
  Year2018.Visible := False;
  Icon5_Excel.Visible := False;
end;

procedure TForm2.Year2015Click(Sender: TObject);
begin
  Panel1.Visible := true;
  FakeButton_Click(Sender);
  Excel.Visible := true;
  Icon5_Excel.Visible := true;

end;

procedure TForm2.Year2016Click(Sender: TObject);
begin
  FakeButton_Click(Sender);
  Excel.Visible := true;
  Icon5_Excel.Visible := true;
end;

procedure TForm2.Year2017Click(Sender: TObject);
begin
  FakeButton_Click(Sender);
  Excel.Visible := true;
  Icon5_Excel.Visible := true;
end;

procedure TForm2.Year2018Click(Sender: TObject);
begin
  FakeButton_Click(Sender);
  Excel.Visible := true;
  Icon5_Excel.Visible := true;
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
end;

end.
