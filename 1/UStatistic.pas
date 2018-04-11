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
    procedure FormActivate(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure StatisticMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure ExitMouseLeave(Sender: TObject);
    procedure Year2015Click(Sender: TObject);
    procedure Year2016Click(Sender: TObject);
    procedure Year2017Click(Sender: TObject);
    procedure Year2018Click(Sender: TObject);
    procedure UpdateClick(Sender: TObject);
    procedure StatisticClick(Sender: TObject);
    procedure DiagrammClick(Sender: TObject);

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

procedure TForm2.UpdateClick(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add
    ('create table IF NOT EXISTS year2016 (id int NOT NULL AUTO_INCREMENT, ip varchar(30), date varchar(30), url text, code varchar(10), size varchar(30), PRIMARY KEY (id))');
  ADOQuery1.ExecSQL;

  AssignFile(f1, 'C:\Users\Svetyxa\Desktop\Диплом\access.log');
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
  ProgressBar1.Visible := False;
  ProgressBar1.Position := 0;
end;

procedure TForm2.StatisticClick(Sender: TObject);
begin
  Year2015.Visible := true;
  Year2016.Visible := true;
  Year2017.Visible := true;
  Year2018.Visible := true;
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
procedure TForm2.StatisticMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
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
