unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles, Data.DB,
  Data.Win.ADODB, Vcl.ComCtrls,
  RegExpr, UMessengge, ComObj, Vcl.Grids;

type
  TForm1 = class(TForm)

    Memo1: TMemo;
    StatusBar1: TStatusBar;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Xls_Save;
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  SearchRec: TSearchRec;
  Messengge: TMessengge;

implementation

{$R *.dfm}

procedure TForm1.Xls_Save;
const
  xlExcel9795 = $0000002B;
  xlExcel8 = 56;

var
  MyStringList: TStringList;
  i, k, r, c, l, m: integer;
  reg, reg2, reg3, reg4, reg5: TregExpr;
  f1: TextFile;
  a: ShortString;
  ExlApp, Sheet: OLEVariant;

begin

  AssignFile(f1, 'E:\statisticswebirbis\1\Win32\Debug\access.log'); //
  reset(f1); //

  { // создаем объект Excel
    ExlApp := CreateOleObject('Excel.Application');

    // делаем окно Excel невидимым
    ExlApp.Visible := false;

    // создаем книгу для экспорта
    ExlApp.Workbooks.Add;

    // создаем объект Sheet(страница) и указываем номер листа (1)
    // в книге, в который будем осуществлять экспорт
    Sheet := ExlApp.Workbooks[1].WorkSheets[1];

    // задаем имя листу
    Sheet.name := 'Данные_из_Delphi'; }

  for i := 1 to 10 do
  begin

    readln(f1, a); //
    Memo1.lines.Add(Messengge.MyAddIp('^(.*?) ', a, i));
    Memo1.lines.Add(Messengge.MyAddIp(' - - (.*?) ', a, i));
    Memo1.lines.Add(Messengge.MyAddIp('"(.*?)"', a, i));
    Memo1.lines.Add(Messengge.MyAddIp('" (.*?) ', a, i));
    Memo1.lines.Add(Messengge.MyAddIp('" 200 (.*?)$', a, i));

  end;

  { // отключаем все предупреждения Excel
    ExlApp.DisplayAlerts := false;

    // обработка исключения при сохраннении файла
    try
    // формат xls 97-2003 если установлен 2003 Excel
    ExlApp.Workbooks[1].saveas('G:\statisticswebirbis\1.xls', xlExcel9795);
    Showmessage('Done');
    except
    // формат xls 97-2003 если установлен 2007-2010 Excel
    ExlApp.Workbooks[1].saveas('G:\statisticswebirbis\1.xls', xlExcel8);
    Showmessage('Done');
    end;

    // закрываем приложение Excel
    ExlApp.Quit;

    // очищаем выделенную память
    ExlApp := Unassigned;
    Sheet := Unassigned; }

  CloseFile(f1);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Xls_Save;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    Ini.WriteInteger('Form', 'Top', Top);
    Ini.WriteInteger('Form', 'Left', Left);
    Ini.WriteString('Form', 'Caption', Caption);
    Ini.WriteBool('Form', 'InitMax', WindowState = wsMaximized);
  finally
    Ini.Free;
  end;

  // Str1.Free;
  // Reader1.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  Messengge := TMessengge.Create;
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    Top := Ini.ReadInteger('Form', 'Top', 100);
    Left := Ini.ReadInteger('Form', 'Left', 100);
    Caption := Ini.ReadString('Form', 'Caption', 'New Form');
    if Ini.ReadBool('Form', 'InitMax', false) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;
  finally
    Ini.Free;
  end;
end;

end.
