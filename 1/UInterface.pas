unit UInterface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JPEG;

procedure FakeButton_MouseMove(Sender: TObject);
procedure ButtonAuthorizationMove;
procedure ButtonAuthorizationLeave;
procedure Deletevalue;
procedure FakeButton_Mouseclick(Sender: TObject);
procedure Fontstyle1(Sender: TObject);
procedure FakeButton_Mouseleave(Sender: TObject);

implementation

uses UStatistic, UAuthorization;

procedure FakeButton_MouseMove(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    1:
      begin
        form2.Statistic.Font.Color := RGB(255, 255, 255);
        form2.Diagramm.Font.Color := RGB(179, 182, 203);
        form2.Updatebase.Font.Color := RGB(179, 182, 203);
        form2.Exit.Font.Color := RGB(179, 182, 203);
        // form2.Label9.Font.Color := RGB(62,65,114);
        form2.Dopdiagramm.Font.Color := RGB(179, 182, 203);
      end;
    2:
      begin
        form2.Statistic.Font.Color := RGB(179, 182, 203);
        form2.Diagramm.Font.Color := RGB(255, 255, 255);
        form2.Updatebase.Font.Color := RGB(179, 182, 203);
        form2.Exit.Font.Color := RGB(179, 182, 203);
        // form2.Label9.Font.Color := RGB(62,65,114);
        form2.Dopdiagramm.Font.Color := RGB(179, 182, 203);
      end;
    3:
      begin
        form2.Statistic.Font.Color := RGB(179, 182, 203);
        form2.Diagramm.Font.Color := RGB(179, 182, 203);
        form2.Updatebase.Font.Color := RGB(255, 255, 255);
        form2.Exit.Font.Color := RGB(179, 182, 203);
        // form2.Label9.Font.Color := RGB(62,65,114);
        form2.Dopdiagramm.Font.Color := RGB(179, 182, 203);
      end;
    4:
      begin
        form2.Statistic.Font.Color := RGB(179, 182, 203);
        form2.Diagramm.Font.Color := RGB(179, 182, 203);
        form2.Updatebase.Font.Color := RGB(179, 182, 203);
        form2.Exit.Font.Color := RGB(255, 255, 255);
        // form2.Label9.Font.Color := RGB(62,65,114);
        form2.Dopdiagramm.Font.Color := RGB(179, 182, 203);
      end;

    6:
      begin
        form2.Statistic.Font.Color := RGB(179, 182, 203);
        form2.Diagramm.Font.Color := RGB(179, 182, 203);
        form2.Updatebase.Font.Color := RGB(179, 182, 203);
        form2.Exit.Font.Color := RGB(179, 182, 203);
        // form2.Label9.Font.Color := RGB(179, 182, 203);
        form2.Dopdiagramm.Font.Color := RGB(255, 255, 255);
      end;
    7:
      begin
        form2.Label9.Font.Color := RGB(179, 182, 203);
      end;
  end;
end;

procedure FakeButton_Mouseleave(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    7:
      begin
        form2.Label9.Font.Color := RGB(62, 65, 114);
      end;
  end;
end;

procedure Fontstyle1(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    1:
      begin
        form2.label4.Font.style := [fsBold] + [fsUnderline];
        form2.Label5.Font.style := [fsBold];
        form2.Label6.Font.style := [fsBold];
        form2.Label7.Font.style := [fsBold];
      end;

    2:
      begin
        form2.label4.Font.style := [fsBold];
        form2.Label5.Font.style := [fsBold] + [fsUnderline];
        form2.Label6.Font.style := [fsBold];
        form2.Label7.Font.style := [fsBold];
      end;

    3:
      begin
        form2.label4.Font.style := [fsBold];
        form2.Label5.Font.style := [fsBold];
        form2.Label6.Font.style := [fsBold] + [fsUnderline];
        form2.Label7.Font.style := [fsBold];
      end;
    4:
      begin
        form2.label4.Font.style := [fsBold];
        form2.Label5.Font.style := [fsBold];
        form2.Label6.Font.style := [fsBold];
        form2.Label7.Font.style := [fsBold] + [fsUnderline];
      end;
  end;
end;

procedure FakeButton_Mouseclick(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    1:
      begin
        form2.Statistic.Font.Color := RGB(255, 255, 255);
        form2.Diagramm.Font.Color := RGB(179, 182, 203);
        form2.Updatebase.Font.Color := RGB(179, 182, 203);
        form2.Exit.Font.Color := RGB(179, 182, 203);
        form2.Dopdiagramm.Font.Color := RGB(179, 182, 203);
      end;

    2:
      begin
        form2.Statistic.Font.Color := RGB(255, 255, 255);
        form2.Diagramm.Font.Color := RGB(179, 182, 203);
        form2.Updatebase.Font.Color := RGB(179, 182, 203);
        form2.Exit.Font.Color := RGB(179, 182, 203);
        form2.Dopdiagramm.Font.Color := RGB(179, 182, 203);
      end;
    3:
      begin
        form2.Statistic.Font.Color := RGB(255, 255, 255);
        form2.Diagramm.Font.Color := RGB(179, 182, 203);
        form2.Updatebase.Font.Color := RGB(179, 182, 203);
        form2.Exit.Font.Color := RGB(179, 182, 203);
        form2.Dopdiagramm.Font.Color := RGB(179, 182, 203);
      end;
    4:
      begin
        form2.Statistic.Font.Color := RGB(255, 255, 255);
        form2.Diagramm.Font.Color := RGB(179, 182, 203);
        form2.Updatebase.Font.Color := RGB(179, 182, 203);
        form2.Exit.Font.Color := RGB(179, 182, 203);
        form2.Dopdiagramm.Font.Color := RGB(179, 182, 203);
      end;
    6:
      begin
        form2.Statistic.Font.Color := RGB(255, 255, 255);
        form2.Diagramm.Font.Color := RGB(179, 182, 203);
        form2.Updatebase.Font.Color := RGB(179, 182, 203);
        form2.Exit.Font.Color := RGB(179, 182, 203);
        form2.Dopdiagramm.Font.Color := RGB(179, 182, 203);
      end;

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
