object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 426
  ClientWidth = 591
  Color = clHighlightText
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 407
    Width = 591
    Height = 19
    Panels = <>
    ExplicitTop = 388
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 55
    Width = 583
    Height = 326
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 407
    Width = 591
    Height = 19
    TabOrder = 2
    Visible = False
  end
  object Button1: TButton
    Left = 149
    Top = 8
    Width = 107
    Height = 41
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 3
    WordWrap = True
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 262
    Top = 8
    Width = 102
    Height = 41
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1090#1072#1073#1083#1080#1094#1091
    TabOrder = 4
    WordWrap = True
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 478
    Top = 8
    Width = 105
    Height = 41
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button3: TButton
    Left = 370
    Top = 8
    Width = 102
    Height = 41
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
    TabOrder = 6
    OnClick = Button3Click
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 72
    Top = 344
  end
  object ADOQuery1: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      ' select * from stable; ')
    Left = 8
    Top = 344
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 136
    Top = 344
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'stable'
    Left = 176
    Top = 344
  end
end
