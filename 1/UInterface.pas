unit UInterface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JPEG;

procedure FakeButton_MouseMove(Sender: TObject);
procedure FakeButton_MouseLeave(Sender: TObject);
procedure ButtonAuthorizationMove;
procedure ButtonAuthorizationLeave;
procedure Deletevalue;

implementation

uses UStatistic, UAuthorization;

procedure FakeButton_MouseMove(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    1:
      form2.Statistic.Font.Color := RGB(255, 255, 255);
    2:
      form2.Diagramm.Font.Color := RGB(255, 255, 255);
    3:
      form2.Updatebase.Font.Color := RGB(255, 255, 255);
    4:
      form2.Exit.Font.Color := RGB(255, 255, 255);
    5:
      form2.Updatediagram.Font.Color := RGB(179, 182, 203);

  end;
end;

procedure FakeButton_MouseLeave(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    1:
      form2.Statistic.Font.Color := RGB(179, 182, 203);
    2:
      form2.Diagramm.Font.Color := RGB(179, 182, 203);
    3:
      form2.Updatebase.Font.Color := RGB(179, 182, 203);
    4:
      form2.Exit.Font.Color := RGB(179, 182, 203);
    5:
      form2.Updatediagram.Font.Color := RGB(62, 65, 104);

  end;
end;

procedure ButtonAuthorizationMove;
begin
  form1.enter.Color := RGB(104, 111, 155);
  form2.Countbutton.Color := RGB(104, 111, 155);
end;

procedure ButtonAuthorizationLeave;
begin
  form2.Countbutton.Color := RGB(62, 65, 104);
  form1.enter.Color := RGB(62, 65, 104);
end;

procedure Deletevalue;
begin
  form2.DBChart1.Series[0].YValues.ValueSource := '';
  form2.DBChart1.Series[1].YValues.ValueSource := '';
  form2.DBChart1.Series[2].YValues.ValueSource := '';
  form2.DBChart1.Series[3].YValues.ValueSource := '';
  form2.DBChart1.Series[4].YValues.ValueSource := '';
  form2.DBChart1.Series[5].YValues.ValueSource := '';
  form2.DBChart1.Series[6].YValues.ValueSource := '';
  form2.DBChart1.Series[7].YValues.ValueSource := '';
  form2.DBChart1.Series[8].YValues.ValueSource := '';
  form2.DBChart1.Series[9].YValues.ValueSource := '';
  form2.DBChart1.Series[10].YValues.ValueSource := '';
  form2.DBChart1.Series[11].YValues.ValueSource := '';

end;

end.
