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
    BorderTop: TPanel;
    BorderBottom: TPanel;
    BorderLeft: TPanel;
    BorderRight: TPanel;
    Menu: TPanel;
    Head: TPanel;
    Title_1: TLabel;
    Title_2: TLabel;
    FakeButton1_Statistic: TLabel;
    FakeButton2_Diag: TLabel;
    FakeButton3_Update: TLabel;
    FakeButton4_Exit: TLabel;
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
    procedure FormActivate(Sender: TObject);
    procedure FakeButton4_ExitClick(Sender: TObject);
    procedure FakeButton1_StatisticMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure FakeButton4_ExitMouseLeave(Sender: TObject);
    procedure Year2015Click(Sender: TObject);
    procedure Year2016Click(Sender: TObject);
    procedure Year2017Click(Sender: TObject);
    procedure Year2018Click(Sender: TObject);
    procedure FakeButton3_UpdateClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    f1: TextFile;
    a, a1, a2, a3, a4, a5, year: string;
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

procedure TForm2.FakeButton3_UpdateClick(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('create table IF NOT EXISTS year2016 (id int NOT NULL AUTO_INCREMENT, ip varchar(30), date varchar(30), url text, code varchar(10), size varchar(30), PRIMARY KEY (id))');
  ADOQuery1.ExecSQL;

  AssignFile(f1, 'C:\Users\Svetyxa\Desktop\Диплом\access.log');
  reset(f1);
  progressbar1.Max := 4820221;
  progressbar1.Min:= 1;
  progressbar1.Visible := true;
  repeat
    readln(f1, a);
    progressbar1.Position := progressbar1.Position   + 1;
    a1 := Messengge.MyAddIp('- - \[(.*?) ', a);
    year := Messengge.MyAddIp('\/(20..):', a1);
    if year = '2016' then
    begin
      a1 := Messengge.MyAddIp('^(.*?) ', a);
      a3 := Messengge.MyAddIp('"(.*?)" (200|400|403|501)', a);
      a4 := Messengge.MyAddIp('".*?" (.*?) ', a);
      a5 := Messengge.MyAddIp('" \d+ (.*?)$', a);
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('INSERT into year2016 (ip,date,url,code,size) values ("'
        + a1 + '", "' + a2 + '","' + a3 + '","' + a4 + '","' + a5 + '");');
      ADOQuery1.ExecSQL;
    end;
  until eof(f1);
  CloseFile(f1);
   progressbar1.Visible  := False;
  progressbar1.Position  := 0;
end;

// интерфейс
procedure TForm2.FakeButton1_StatisticMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  FakeButton_MouseMove(Sender);
end;

procedure TForm2.FakeButton4_ExitMouseLeave(Sender: TObject);
begin
  FakeButton_MouseLeave(Sender);
end;

procedure TForm2.Year2015Click(Sender: TObject);
begin
  FakeButton_Click(Sender);
end;

procedure TForm2.Year2016Click(Sender: TObject);
begin
  FakeButton_Click(Sender);
end;

procedure TForm2.Year2017Click(Sender: TObject);
begin
  FakeButton_Click(Sender);
end;

procedure TForm2.Year2018Click(Sender: TObject);
begin
  FakeButton_Click(Sender);
end;

procedure TForm2.FakeButton4_ExitClick(Sender: TObject);
begin
  Form1.Close;
end;

end.
