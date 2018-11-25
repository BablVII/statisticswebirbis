unit UMainLog;

interface

uses
  SysUtils, Vcl.Dialogs,
  CodeSiteLogging, UMainConstant;

type
  MainLog = class
  private
    Dest: TCodeSiteDestination;
    procedure DestCreate;
  public
    function CodeSiteDestination: TCodeSiteDestination;
  published
    constructor create;
  end;

type
  EMainLog = class(Exception);

implementation

{ Log }

function MainLog.CodeSiteDestination: TCodeSiteDestination;
begin
  result := self.Dest;
end;

constructor MainLog.create;
begin
  try
    self.DestCreate;
  except
    on Exception do
      ShowMessage(EMainLog.ClassName + ERROR)
  end;

end;

procedure MainLog.DestCreate;
begin
  Dest := TCodeSiteDestination.create(nil);
  Dest.LogFile.FilePath := LOG_FILE_PATH;
  Dest.LogFile.FileName := LOG_FILE_NAME;
  Dest.LogFile.Active := LOG_FILE_ACTIVE;
  assert(Dest.LogFile.Active);
end;

end.
