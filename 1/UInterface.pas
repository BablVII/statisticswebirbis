unit UInterface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JPEG;

procedure FakeButton_MouseMove(Sender: TObject);
procedure FakeButton_MouseLeave(Sender: TObject);
procedure FakeButton_Click(Sender: TObject);
procedure ButtonAuthorizationMove;
procedure ButtonAuthorizationLeave;

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
    9:
      form2.Excel.Font.Color := RGB(62, 65, 104);
    10:
      form2.Update.Font.Color := RGB(62, 65, 104);
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
    9:
      form2.Excel.Font.Color := RGB(179, 182, 203);
    10:
      form2.Update.Font.Color := RGB(179, 182, 203);
  end;
end;

procedure FakeButton_Click(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    5:
      begin
        form2.Year2015.Font.Color := RGB(62, 65, 104);
        form2.Year2016.Font.Color := RGB(179, 182, 203);
        form2.Year2017.Font.Color := RGB(179, 182, 203);
        form2.Year2018.Font.Color := RGB(179, 182, 203);
      end;
    6:
      begin
        form2.Year2015.Font.Color := RGB(179, 182, 203);
        form2.Year2016.Font.Color := RGB(62, 65, 104);
        form2.Year2017.Font.Color := RGB(179, 182, 203);
        form2.Year2018.Font.Color := RGB(179, 182, 203);
      end;
    7:
      begin
        form2.Year2015.Font.Color := RGB(179, 182, 203);
        form2.Year2016.Font.Color := RGB(179, 182, 203);
        form2.Year2017.Font.Color := RGB(62, 65, 104);
        form2.Year2018.Font.Color := RGB(179, 182, 203);
      end;
    8:
      begin
        form2.Year2015.Font.Color := RGB(179, 182, 203);
        form2.Year2016.Font.Color := RGB(179, 182, 203);
        form2.Year2017.Font.Color := RGB(179, 182, 203);
        form2.Year2018.Font.Color := RGB(62, 65, 104);
      end;
  end;
end;

procedure ButtonAuthorizationMove;
begin
  form1.FakeButton1_Authorization.Picture.LoadFromFile
    (getcurrentdir + '\data\interface\authorization_m.jpg');
end;

procedure ButtonAuthorizationLeave;
begin
  form1.FakeButton1_Authorization.Picture.LoadFromFile
    (getcurrentdir + '\data\interface\authorization_l.jpg');
end;

end.
