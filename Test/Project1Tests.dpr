program Project1Tests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  TestUnit1 in 'TestUnit1.pas',
  DUnitTestRunner,
  Unit1 in '..\Unit1.pas',
  UMainController in '..\UMainController.pas',
  UMainConstant in '..\UMainConstant.pas',
  UFileApache in '..\UFileApache.pas',
  UMainLog in '..\UMainLog.pas',
  TestUMainLog in 'TestUMainLog.pas',
  UFormInterface in '..\UFormInterface.pas',
  TestUIp in 'TestUIp.pas',
  UIp in '..\UIp.pas',
  regexpr in '..\regexpr.pas';

{R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

