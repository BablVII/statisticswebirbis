unit UMessengge;

interface

uses
  // SysUtils,
  RegExpr, Classes, Vcl.Forms;

type
  TMessengge = class
  public

    function MyAddIp(MyExpression: string; MyA: string; MyI: integer):string;
  end;

implementation

{ TMessengge }

function TMessengge.MyAddIp(MyExpression, MyA: string; MyI: integer): string;
var
  reg: TregExpr;
begin
  reg := TregExpr.Create;
  reg.InputString := MyA;
  reg.Expression := MyExpression;
  reg.Exec(MyA);
  result := reg.Match[1];
  reg := nil;
end;

end.
