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

implementation

{$R *.dfm}

procedure TForm1.Xls_Save;
const
  xlExcel9795 = $0000002B;
  xlExcel8 = 56;

var

  i: integer;
  reg, reg2, reg3, reg4, reg5: TregExpr;
  f1: TextFile;
  a: ShortString;
  ExlApp, Sheet: OLEVariant;

begin


  AssignFile(f1, 'C:\Users\Svetyxa\Desktop\stat1\Win32\Debug\access.log'); //
  reset(f1); //

  // создаем объект Excel
  ExlApp := CreateOleObject('Excel.Application');

  // делаем окно Excel невидимым
  ExlApp.Visible := false;

  // создаем книгу для экспорта
  ExlApp.Workbooks.Add;

  // создаем объект Sheet(страница) и указываем номер листа (1)
  // в книге, в который будем осуществлять экспорт
  Sheet := ExlApp.Workbooks[1].WorkSheets[1];

  // задаем имя листу
  Sheet.name := 'Данные_из_Delphi';

  for i := 1 to 10 do
  begin


    readln(f1, a); //
    reg := TregExpr.Create;
    reg2 := TregExpr.Create;
    reg3 := TregExpr.Create;
    reg4 := TregExpr.Create;
    reg5 := TregExpr.Create;

    reg.InputString := a;
    reg2.InputString := a;
    reg3.InputString := a;
    reg4.InputString := a;
    reg5.InputString := a;

    reg.Expression := '^(.*?) ';
    reg2.Expression := ' - - (.*?) ';
    reg3.Expression := '"(.*?)"';
    reg4.Expression := '" (.*?) ';
    reg5.Expression := '" 200 (.*?)$';

    if reg.Exec(a) then //
      repeat
        Sheet.cells[i, 1] := reg.Match[0];
      until not reg.ExecNext;
    reg.Free;
    reg := nil;

    if reg2.Exec(a) then
      repeat
        Sheet.cells[i, 2] := reg2.Match[0];
      until not reg2.ExecNext;
    reg2.Free;
    reg2 := nil;

    if reg3.Exec(a) then
      repeat
        Sheet.cells[i, 3] := reg3.Match[0];
      until not reg3.ExecNext;
    reg3.Free;
    reg3 := nil;

    if reg4.Exec(a) then
      repeat
        Sheet.cells[i, 4] := reg4.Match[0];
      until not reg4.ExecNext;
    reg4.Free;
    reg4 := nil;

    if reg5.Exec(a) then
      repeat
        Sheet.cells[i, 5] := reg5.Match[0];
      until not reg5.ExecNext;
    reg5.Free;
    reg5 := nil;
   memo1.Lines.Add(inttostr(i));
  end;

  // отключаем все предупреждения Excel
  ExlApp.DisplayAlerts := false;

  // обработка исключения при сохраннении файла
  try
    // формат xls 97-2003 если установлен 2003 Excel
    ExlApp.Workbooks[1].saveas('C:\Users\Svetyxa\Desktop\1.xls', xlExcel9795);
    Showmessage('Done');
  except
    // формат xls 97-2003 если установлен 2007-2010 Excel
    ExlApp.Workbooks[1].saveas('C:\Users\Svetyxa\Desktop\1.xls', xlExcel8);
    Showmessage('Done');
  end;

  // закрываем приложение Excel
  ExlApp.Quit;

  // очищаем выделенную память
  ExlApp := Unassigned;
  Sheet := Unassigned;

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
