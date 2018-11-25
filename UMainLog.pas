unit UMainLog;

interface

uses
  CodeSiteLogging, UMainConstant;

type
  MainLog = class
  private
    Dest: TCodeSiteDestination;
  public
    function CodeSiteDestination: TCodeSiteDestination;
  published
    constructor create;
  end;

implementation

{ Log }

function MainLog.CodeSiteDestination: TCodeSiteDestination;
begin
  result := self.Dest;
end;

constructor MainLog.create;
begin
  Dest := TCodeSiteDestination.create(nil);
  Dest.LogFile.FilePath := LOG_FILE_PATH;
  Dest.LogFile.FileName := LOG_FILE_NAME;
  Dest.LogFile.Active := LOG_FILE_ACTIVE;
end;

end.
