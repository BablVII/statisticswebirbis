unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);

  end;

  { TClass = class
    f : TextFile;
    s : String;
    procedure pars;

    constructor create(s:string);
    {begin
    AssignFile(f,'C:\Users\Svetyxa\Desktop\statisticswebirbis');
    Reset(f);

    while (not EOF(f)) do begin
    Readln(f, s);
    //myMemo.Lines.Add(s);
    end;
    end; }

var
  Form1: TForm1;
  f: TextFile;
  s: String;

implementation

{$R *.dfm}

// подключение файла
procedure TForm1.Button1Click(Sender: TObject);
var
  mas1: array [0 .. 100] of String;
  s, s1: String;
  i, Leng: Integer;
  WordEnum: Byte;
  StrList: TStringList;
begin
  AssignFile(f, 'C:\Users\Svetyxa\Desktop\statisticswebirbis\log.txt');
  Reset(f);
  while (not EOf(f)) do
  begin
    Readln(f, s);

    StrList := TStringList.Create;
    s1 := '';
    WordEnum := 0;

    Leng := Length(s);

    for i := 1 to Leng do
    begin
      if (s[i] = #32) and (s[i + 1] <> #32) then
      begin
        Inc(WordEnum);
        s1 := '';
        Continue;
      end;
      s1 := s1 + s[i];
      mas1[WordEnum] := s1;
    end;

    // проверка 1
    for i := 0 to WordEnum do
    begin
      Memo1.Lines.Add(mas1[i]);
      StrList.Add(mas1[i]);
    end;

    // проверка 3 строчки (начинается 0)
    Memo2.Lines.Add(StrList[2]);

    // проверка всего листа
    { for i := 0 to StrList.Count-1 do
      Memo2.Lines.Add(StrList[i]); }
  end;
end;

end.
