object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 546
  ClientWidth = 485
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 32
    Top = 8
    Width = 297
    Height = 489
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 527
    Width = 485
    Height = 19
    Panels = <>
    ExplicitTop = 406
    ExplicitWidth = 643
  end
  object Button1: TButton
    Left = 352
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object SaveDialog1: TSaveDialog
    Left = 376
    Top = 88
  end
end
