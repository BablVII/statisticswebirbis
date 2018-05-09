unit UInterface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JPEG;

procedure FakeButton_MouseMove(Sender: TObject);
procedure FakeButton_MouseLeave(Sender: TObject);

procedure Font_style(Sender: TObject);
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

procedure Font_style(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    1:
      begin
        form2.January.Font.Style := [fsUnderLine];
        form2.February.Font.Style := [];
        form2.March.Font.Style := [];
        form2.April.Font.Style := [];
        form2.May.Font.Style := [];
        form2.June.Font.Style := [];
        form2.Jule.Font.Style := [];
        form2.August.Font.Style := [];
        form2.September.Font.Style := [];
        form2.October.Font.Style := [];
        form2.November.Font.Style := [];
        form2.December.Font.Style := [];
      end;
    2:
      begin
        form2.January.Font.Style := [];
        form2.February.Font.Style := [fsUnderLine];
        form2.March.Font.Style := [];
        form2.April.Font.Style := [];
        form2.May.Font.Style := [];
        form2.June.Font.Style := [];
        form2.Jule.Font.Style := [];
        form2.August.Font.Style := [];
        form2.September.Font.Style := [];
        form2.October.Font.Style := [];
        form2.November.Font.Style := [];
        form2.December.Font.Style := [];
      end;
    3:
      begin
        form2.January.Font.Style := [];
        form2.February.Font.Style := [];
        form2.March.Font.Style := [fsUnderLine];
        form2.April.Font.Style := [];
        form2.May.Font.Style := [];
        form2.June.Font.Style := [];
        form2.Jule.Font.Style := [];
        form2.August.Font.Style := [];
        form2.September.Font.Style := [];
        form2.October.Font.Style := [];
        form2.November.Font.Style := [];
        form2.December.Font.Style := [];
      end;
    4:
      begin
        form2.January.Font.Style := [];
        form2.February.Font.Style := [];
        form2.March.Font.Style := [];
        form2.April.Font.Style := [fsUnderLine];
        form2.May.Font.Style := [];
        form2.June.Font.Style := [];
        form2.Jule.Font.Style := [];
        form2.August.Font.Style := [];
        form2.September.Font.Style := [];
        form2.October.Font.Style := [];
        form2.November.Font.Style := [];
        form2.December.Font.Style := [];
      end;
    5:
      begin
        form2.January.Font.Style := [];
        form2.February.Font.Style := [];
        form2.March.Font.Style := [];
        form2.April.Font.Style := [];
        form2.May.Font.Style := [fsUnderLine];
        form2.June.Font.Style := [];
        form2.Jule.Font.Style := [];
        form2.August.Font.Style := [];
        form2.September.Font.Style := [];
        form2.October.Font.Style := [];
        form2.November.Font.Style := [];
        form2.December.Font.Style := [];
      end;
    6:
      begin
        form2.January.Font.Style := [];
        form2.February.Font.Style := [];
        form2.March.Font.Style := [];
        form2.April.Font.Style := [];
        form2.May.Font.Style := [];
        form2.June.Font.Style := [fsUnderLine];
        form2.Jule.Font.Style := [];
        form2.August.Font.Style := [];
        form2.September.Font.Style := [];
        form2.October.Font.Style := [];
        form2.November.Font.Style := [];
        form2.December.Font.Style := [];
      end;
    7:
      begin
        form2.January.Font.Style := [];
        form2.February.Font.Style := [];
        form2.March.Font.Style := [];
        form2.April.Font.Style := [];
        form2.May.Font.Style := [];
        form2.June.Font.Style := [];
        form2.Jule.Font.Style := [fsUnderLine];
        form2.August.Font.Style := [];
        form2.September.Font.Style := [];
        form2.October.Font.Style := [];
        form2.November.Font.Style := [];
        form2.December.Font.Style := [];
      end;
    8:
      begin
        form2.January.Font.Style := [];
        form2.February.Font.Style := [];
        form2.March.Font.Style := [];
        form2.April.Font.Style := [];
        form2.May.Font.Style := [];
        form2.June.Font.Style := [];
        form2.Jule.Font.Style := [];
        form2.August.Font.Style := [fsUnderLine];
        form2.September.Font.Style := [];
        form2.October.Font.Style := [];
        form2.November.Font.Style := [];
        form2.December.Font.Style := [];
      end;
    9:
      begin
        form2.January.Font.Style := [];
        form2.February.Font.Style := [];
        form2.March.Font.Style := [];
        form2.April.Font.Style := [];
        form2.May.Font.Style := [];
        form2.June.Font.Style := [];
        form2.Jule.Font.Style := [];
        form2.August.Font.Style := [];
        form2.September.Font.Style := [fsUnderLine];
        form2.October.Font.Style := [];
        form2.November.Font.Style := [];
        form2.December.Font.Style := [];
      end;
    10:
      begin
        form2.January.Font.Style := [];
        form2.February.Font.Style := [];
        form2.March.Font.Style := [];
        form2.April.Font.Style := [];
        form2.May.Font.Style := [];
        form2.June.Font.Style := [];
        form2.Jule.Font.Style := [];
        form2.August.Font.Style := [];
        form2.September.Font.Style := [];
        form2.October.Font.Style := [fsUnderLine];
        form2.November.Font.Style := [];
        form2.December.Font.Style := [];
      end;
    11:
      begin
        form2.January.Font.Style := [];
        form2.February.Font.Style := [];
        form2.March.Font.Style := [];
        form2.April.Font.Style := [];
        form2.May.Font.Style := [];
        form2.June.Font.Style := [];
        form2.Jule.Font.Style := [];
        form2.August.Font.Style := [];
        form2.September.Font.Style := [];
        form2.October.Font.Style := [];
        form2.November.Font.Style := [fsUnderLine];
        form2.December.Font.Style := [];
      end;
    12:
      begin
        form2.January.Font.Style := [];
        form2.February.Font.Style := [];
        form2.March.Font.Style := [];
        form2.April.Font.Style := [];
        form2.May.Font.Style := [];
        form2.June.Font.Style := [];
        form2.Jule.Font.Style := [];
        form2.August.Font.Style := [];
        form2.September.Font.Style := [];
        form2.October.Font.Style := [];
        form2.November.Font.Style := [];
        form2.December.Font.Style := [fsUnderLine];
      end;

  end;
end;

end.
