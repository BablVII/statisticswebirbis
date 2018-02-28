object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 426
  ClientWidth = 584
  Color = cl3DLight
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 407
    Width = 584
    Height = 19
    Panels = <>
    ExplicitWidth = 591
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 74
    Width = 583
    Height = 155
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
    Width = 583
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
  object Panel1: TPanel
    Left = 8
    Top = 254
    Width = 575
    Height = 139
    Color = clWhite
    ParentBackground = False
    TabOrder = 7
    object Label1: TLabel
      Left = 230
      Top = 3
      Width = 60
      Height = 13
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
    end
    object combobox: TComboBox
      Left = 16
      Top = 38
      Width = 145
      Height = 21
      TabOrder = 0
      Items.Strings = (
        #1053#1077#1076#1077#1083#1103
        #1052#1077#1089#1103#1094' '
        #1043#1086#1076)
    end
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 40
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
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 8
    Top = 32
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'stable'
    Left = 40
    Top = 32
  end
end
