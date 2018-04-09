object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1095#1077#1089#1082#1080#1081' '#1091#1095#1077#1090
  ClientHeight = 309
  ClientWidth = 424
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 67
    Width = 169
    Height = 24
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1077#1088#1080#1086#1076':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 213
    Top = 8
    Width = 108
    Height = 33
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '
    TabOrder = 0
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 213
    Top = 64
    Width = 203
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = ComboBox1Change
    Items.Strings = (
      #1053#1077#1076#1077#1083#1103
      #1052#1077#1089#1103#1094
      #1043#1086#1076)
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 110
    Width = 408
    Height = 163
    ColCount = 2
    FixedCols = 0
    TabOrder = 2
    Visible = False
    ColWidths = (
      202
      186)
    RowHeights = (
      24
      24
      24
      24
      24)
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 292
    Width = 425
    Height = 17
    TabOrder = 3
    Visible = False
  end
  object Button2: TButton
    Left = 327
    Top = 8
    Width = 89
    Height = 33
    Caption = #1042#1099#1074#1086#1076' '#1074' Excel'
    TabOrder = 4
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=1234;Persist Security Info=True;User' +
      ' ID=root;Data Source=1;Initial Catalog=statistic'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 32
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    Left = 64
  end
end
