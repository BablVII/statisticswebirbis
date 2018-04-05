object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 426
  ClientWidth = 752
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
  object Label1: TLabel
    Left = 1
    Top = 370
    Width = 85
    Height = 13
    Caption = #1057#1090#1088#1086#1082' '#1074' '#1090#1072#1073#1083#1080#1094#1077
    Visible = False
  end
  object Label2: TLabel
    Left = 11
    Top = 130
    Width = 19
    Height = 13
    Caption = 'GET'
    Visible = False
  end
  object Label3: TLabel
    Left = 8
    Top = 84
    Width = 157
    Height = 13
    Caption = #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1086#1073#1088#1072#1097#1077#1085#1080#1081
  end
  object Label4: TLabel
    Left = 70
    Top = 130
    Width = 26
    Height = 13
    Caption = 'POST'
    Visible = False
  end
  object Label5: TLabel
    Left = 696
    Top = 55
    Width = 31
    Height = 13
    Caption = 'Label5'
    Visible = False
  end
  object Label6: TLabel
    Left = 11
    Top = 111
    Width = 17
    Height = 13
    Caption = 'Get'
  end
  object Label7: TLabel
    Left = 70
    Top = 111
    Width = 21
    Height = 13
    Caption = 'Post'
  end
  object Label8: TLabel
    Left = 126
    Top = 111
    Width = 21
    Height = 13
    Caption = 'Post'
  end
  object Label9: TLabel
    Left = 126
    Top = 130
    Width = 19
    Height = 13
    Caption = 'PDF'
    Visible = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 407
    Width = 752
    Height = 19
    Panels = <>
  end
  object DBGrid1: TDBGrid
    Left = 1
    Top = 166
    Width = 743
    Height = 195
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
    Width = 752
    Height = 19
    TabOrder = 2
    Visible = False
  end
  object Button1: TButton
    Left = 381
    Top = 8
    Width = 107
    Height = 41
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
    TabOrder = 3
    WordWrap = True
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 506
    Top = 8
    Width = 102
    Height = 41
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1090#1072#1073#1083#1080#1094#1091
    TabOrder = 4
    WordWrap = True
    OnClick = Button2Click
  end
  object Button5: TButton
    Left = 631
    Top = 8
    Width = 113
    Height = 41
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082
    TabOrder = 5
    OnClick = Button5Click
  end
  object ComboBox1: TComboBox
    Left = 183
    Top = 81
    Width = 145
    Height = 21
    TabOrder = 6
    Text = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1077#1088#1080#1086#1076
    OnChange = ComboBox1Change
    Items.Strings = (
      'get/post')
  end
  object Memo1: TMemo
    Left = 593
    Top = 367
    Width = 151
    Height = 34
    BorderStyle = bsNone
    Lines.Strings = (
      'Memo1')
    TabOrder = 7
    Visible = False
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="Driver=MySQL ODBC 5.3 ANSI Driver;SERVER=192.168.125.253;UID' +
      '=statistic;DATABASE=statistic;PORT=3306;COLUMN_SIZE_S32=1";Initi' +
      'al Catalog=statistic'
    Provider = 'MSDASQL.1'
  end
  object ADOQuery1: TADOQuery
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select * from stable')
    Left = 32
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 64
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'stable'
    Left = 96
  end
end
