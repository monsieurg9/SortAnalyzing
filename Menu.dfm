object Main: TMain
  Left = 542
  Top = 169
  Width = 248
  Height = 387
  Caption = #1040#1085#1072#1083#1080#1079' '#1089#1086#1088#1090#1080#1088#1086#1074#1086#1082
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmMenu
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnGraphics: TButton
    Left = 24
    Top = 96
    Width = 185
    Height = 60
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1089#1088#1072#1074#1085#1080#1090#1077#1083#1100#1085#1099#1093' '#1075#1088#1072#1092#1080#1082#1086#1074' '#1080' '#1090#1072#1073#1083#1080#1094
    TabOrder = 1
    WordWrap = True
    OnClick = btnGraphicsClick
  end
  object btnChangeUser: TButton
    Left = 24
    Top = 176
    Width = 185
    Height = 60
    Caption = #1057#1084#1077#1085#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    TabOrder = 2
    OnClick = btnChangeUserClick
  end
  object btnExit: TButton
    Left = 24
    Top = 256
    Width = 185
    Height = 60
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 3
    OnClick = btnExitClick
  end
  object btnInfo: TButton
    Left = 24
    Top = 16
    Width = 185
    Height = 60
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1086#1088#1090#1080#1088#1074#1082#1072#1093
    TabOrder = 0
    OnClick = btnInfoClick
  end
  object mmMenu: TMainMenu
    object N1: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = N1Click
    end
  end
end
