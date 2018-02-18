unit UMessengge;

interface

uses
  SysUtils, Classes;

type
  TMessengge = class(TCollectionItem)
  public
    ip: string;
      date: string;
      url: string;  
      code: string;
      size: string; 
  //    property ip: string read Fip write Fip;
    //constructor Create(Collection: TCollection); override;
    //destructor Destroy; override;
  end;

  TMyCollection = class(TCollection)
  private
    function GetMessengge(Index: Integer): TMessengge;
    procedure SetMessengge(Index: Integer; Value: TMessengge);
  public
    function Add: TMessengge;
    property Items[Index: Integer]: TMessengge read GetMessengge
      write SetMessengge; default;
  end;

implementation

{ TMyCollection }

function TMyCollection.Add: TMessengge;
begin
  Result := TMessengge(inherited Add);
end;

function TMyCollection.GetMessengge(Index: Integer): TMessengge;
begin
  Result := TMessengge(inherited Items[Index]);
end;

procedure TMyCollection.SetMessengge(Index: Integer; Value: TMessengge);
begin
  Items[Index].Assign(Value);
end;

end.
