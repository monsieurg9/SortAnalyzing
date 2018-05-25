object FEntrance: TFEntrance
  Left = 585
  Top = 253
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  ClientHeight = 286
  ClientWidth = 220
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbledtName: TLabeledEdit
    Left = 40
    Top = 88
    Width = 153
    Height = 21
    EditLabel.Width = 31
    EditLabel.Height = 13
    EditLabel.Caption = #1051#1086#1075#1080#1085
    TabOrder = 0
  end
  object lbledtPassword: TLabeledEdit
    Left = 40
    Top = 136
    Width = 153
    Height = 21
    EditLabel.Width = 38
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1072#1088#1086#1083#1100
    TabOrder = 1
  end
  object btnEnter: TButton
    Left = 16
    Top = 216
    Width = 89
    Height = 25
    Caption = #1042#1086#1081#1090#1080
    TabOrder = 2
    OnClick = btnEnterClick
  end
  object btnRegistration: TButton
    Left = 120
    Top = 216
    Width = 89
    Height = 25
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
    TabOrder = 3
    OnClick = btnRegistrationClick
  end
  object btnAdmin: TButton
    Left = 16
    Top = 248
    Width = 193
    Height = 25
    Caption = #1042#1086#1081#1090#1080' '#1082#1072#1082' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
    TabOrder = 4
    OnClick = btnAdminClick
  end
  object btnCheats: TButton
    Left = 136
    Top = 8
    Width = 73
    Height = 25
    Caption = 'btnCheats'
    TabOrder = 5
    OnClick = btnCheatsClick
  end
end
