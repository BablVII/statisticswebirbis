object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 297
  ClientWidth = 679
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 278
    Width = 679
    Height = 19
    Panels = <>
    ExplicitTop = 527
    ExplicitWidth = 530
  end
  object Button1: TButton
    Left = 272
    Top = 31
    Width = 153
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 1
    OnClick = Button1Clic
  end
  object ProgressBar1: TProgressBar
    Left = 472
    Top = 40
    Width = 150
    Height = 16
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 27
    Top = 104
    Width = 644
    Height = 161
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button2: TButton
    Left = 272
    Top = 62
    Width = 153
    Height = 25
    Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1090#1072#1073#1083#1080#1094#1091
    TabOrder = 4
    OnClick = Button2Click
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;User ID=root;Exte' +
      'nded Properties="DSN=statistic;UID=root;DATABASE=statistic;PORT=' +
      '3306";Initial Catalog=statistic'
    LoginPrompt = False
    Left = 80
    Top = 24
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
    Left = 16
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 144
    Top = 24
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'stable'
    Left = 200
    Top = 24
  end
end
