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
    procedure Update;
    procedure Log(const Msg: string);
  published
    constructor create;
  end;

implementation

{ FileApache }

constructor FileApache.create;
begin
  self.Log(FILE_APACHE_UPDATE);
  self.Update;
end;

procedure FileApache.Log(const Msg: string);
begin
  Dest:= MainLog.create;
  CodeSite.Destination := Dest.CodeSiteDestination;
  CodeSite.Send(Msg, self);
end;

procedure FileApache.Update;
begin
  //TODO
end;

end.
