unit Unit1;

interface

uses
  UMainController, UMainConstant, UFileApache,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Graphics,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    Header: TPanel;
    Nav: TPanel;
    Article: TPanel;
    ProgressBar1: TProgressBar;
    Top: TLabel;
    Exit: TLabel;
    Title1: TLabel;
    Title2: TLabel;
    Statistic: TLabel;
    UpdateDownloadLog: TLabel;
    IconClose: TImage;
    IconUpdateDownloadLog: TImage;
    Dopdiagramm: TLabel;
    Icon2_Diag: TImage;
    Icon1_Statistic: TImage;
    Icon3_Diag: TImage;
    Diagramm: TLabel;
    procedure ExitClick(Sender: TObject);
    procedure HeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UpdateDownloadLogClick(Sender: TObject);
  private
    /// <link>aggregation</link>
    Download: DownloadLog;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ExitClick(Sender: TObject);
begin
  Form1.close;
end;

procedure TForm1.HeaderMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Form1.Handle, WM_SYSCOMMAND, HEADER_MOUSE_DOWN, 0);
end;

procedure TForm1.UpdateDownloadLogClick(Sender: TObject);
begin
  Download := FileApache.create;
end;

end.
