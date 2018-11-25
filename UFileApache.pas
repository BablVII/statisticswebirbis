unit UFileApache;

interface

uses
  Vcl.Forms,
  SysUtils,
  UMainLog,
  CodeSiteLogging,
  UMainController,
  UMainConstant;

type
  FileApache = class(TInterfacedObject, DownloadLog)
  private
    /// <link>aggregation</link>
    Dest: MainLog;
    procedure Send;
    procedure Update;
    procedure Log(const Msg: string);
  published
    constructor create;
  end;

implementation

{ FileApache }

constructor FileApache.create;

begin
  self.Update;
end;

procedure FileApache.Log(const Msg: string);
begin
  Dest:= MainLog.create;
  CodeSite.Destination := Dest.CodeSiteDestination;
  CodeSite.Send(Msg, self);
end;

procedure FileApache.Send;
begin
    self.Log(FILE_APACHE_UPDATE);
end;

procedure FileApache.Update;
begin
  self.Send;
  //TODO
end;

end.
