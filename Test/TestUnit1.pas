unit TestUnit1;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework, System.SysUtils, Vcl.Graphics, Vcl.StdCtrls,
  Winapi.Windows, System.Variants, System.Classes, Vcl.Dialogs,
  Winapi.Messages, Vcl.Controls, Vcl.Forms,
  UMainController, Unit1;

type
  // Test methods for class TForm1

  TestTForm1 = class(TTestCase)
  strict private
    FForm1: TForm1;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure Enabled;
  end;

implementation

procedure TestTForm1.SetUp;
begin
  FForm1 := TForm1.Create(nil);
end;

procedure TestTForm1.TearDown;
begin
  FForm1.Free;
  FForm1 := nil;
end;

procedure TestTForm1.Enabled;
begin
  self.CheckTrue(FForm1.Enabled, 'self.CheckTrue(FForm1.Enabled)');
end;

initialization

// Register any test cases with the test runner
RegisterTest(TestTForm1.Suite);

end.