object Registration: TRegistration
  Left = 431
  Top = 289
  Width = 498
  Height = 311
  Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbledtUsername: TLabeledEdit
    Left = 56
    Top = 48
    Width = 129
    Height = 21
    EditLabel.Width = 31
    EditLabel.Height = 13
    EditLabel.Caption = #1051#1086#1075#1080#1085
    TabOrder = 0
  end
  object lbledtPassword: TLabeledEdit
    Left = 56
    Top = 88
    Width = 129
    Height = 21
    EditLabel.Width = 38
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1072#1088#1086#1083#1100
    TabOrder = 1
  end
  object lbledtConfirmPassword: TLabeledEdit
    Left = 56
    Top = 128
    Width = 129
    Height = 21
    EditLabel.Width = 105
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
    TabOrder = 2
  end
  object lbledtName: TLabeledEdit
    Left = 248
    Top = 48
    Width = 129
    Height = 21
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1084#1103
    TabOrder = 3
  end
  object btnConfirm: TButton
    Left = 16
    Top = 176
    Width = 193
    Height = 49
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 4
    OnClick = btnConfirmClick
  end
  object lbledtSurname: TLabeledEdit
    Left = 248
    Top = 88
    Width = 129
    Height = 21
    EditLabel.Width = 49
    EditLabel.Height = 13
    EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103
    TabOrder = 5
  end
  object btnCancel: TButton
    Left = 224
    Top = 176
    Width = 209
    Height = 49
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 6
    OnClick = btnCancelClick
  end
end
