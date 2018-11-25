unit UMainController;

interface

type
  MainController = interface(IInterface)

  end;

  DownloadLog = interface(MainController)
    procedure Update;
  end;

  Settings = interface(MainController)
    procedure Change;
  end;

implementation

end.
