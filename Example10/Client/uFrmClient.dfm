object FrmClient: TFrmClient
  Left = 0
  Top = 0
  Caption = 'FrmClient'
  ClientHeight = 326
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 582
    Height = 260
    Align = alClient
    DataSource = dsEMPLOYEE
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 301
    Width = 582
    Height = 25
    DataSource = dsEMPLOYEE
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 307
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 582
    Height = 41
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 208
    ExplicitTop = 160
    ExplicitWidth = 185
    object Button1: TButton
      Left = 8
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 89
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object dsEMPLOYEE: TDataSource
    DataSet = CM.cdsEMPLOYEE
    Left = 248
    Top = 128
  end
end
