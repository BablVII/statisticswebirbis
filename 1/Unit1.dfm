object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 425
  ClientWidth = 643
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
    Width = 225
    Height = 65
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Button3: TButton
    Left = 288
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 1
    OnClick = Button3Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 406
    Width = 643
    Height = 19
    Panels = <>
    ExplicitTop = 292
  end
  object RichEdit1: TRichEdit
    Left = 440
    Top = 24
    Width = 185
    Height = 89
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    ParentFont = False
    TabOrder = 3
  end
  object Memo2: TMemo
    Left = 32
    Top = 79
    Width = 225
    Height = 58
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object Memo3: TMemo
    Left = 32
    Top = 151
    Width = 225
    Height = 50
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object Memo4: TMemo
    Left = 32
    Top = 223
    Width = 225
    Height = 58
    ScrollBars = ssBoth
    TabOrder = 6
  end
  object Memo5: TMemo
    Left = 32
    Top = 295
    Width = 225
    Height = 58
    ScrollBars = ssBoth
    TabOrder = 7
  end
end
