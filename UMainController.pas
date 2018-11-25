unit UMainController;

interface

uses
  ShellAPI, ComObj, ActiveX;

type
  IMainController = interface
    procedure UpdateDownloadLog;
    procedure ChangeSettings;
  end;

implementation

end.
