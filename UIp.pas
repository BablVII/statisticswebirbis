unit UIp;

interface

uses
  RegExpr;

type
  ip = class
  published
    function Load(oneLineLog: string): string;
  end;

implementation

{ ip }

function ip.Load(oneLineLog: string): string;
var
  RegExp: TRegExpr;
begin
  RegExp := TRegExpr.Create;
  RegExp.InputString := oneLineLog;
  RegExp.Expression := '([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})';
  RegExp.Exec;
  result := RegExp.Match[1];
  RegExp.Free;
end;

end.
