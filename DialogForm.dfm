object Dialog: TDialog
  Left = 509
  Top = 289
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Dialog'
  ClientHeight = 137
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblMessage: TLabel
    Left = 0
    Top = 0
    Width = 361
    Height = 49
    Alignment = taCenter
    Caption = #1055#1088#1086#1094#1077#1089#1089' '#1087#1077#1088#1077#1079#1072#1087#1080#1089#1080' '#1076#1072#1085#1085#1099#1093' '#1079#1072#1085#1080#1084#1072#1077#1090' '#1084#1085#1086#1075#1086' '#1074#1088#1077#1084#1077#1085#1080' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lblMessage2: TLabel
    Left = 0
    Top = 48
    Width = 369
    Height = 20
    Alignment = taCenter
    Caption = #1042#1099' '#1091#1074#1077#1088#1077#1085#1099', '#1095#1090#1086' '#1093#1086#1090#1080#1090#1077' '#1087#1088#1086#1076#1086#1083#1078#1080#1090#1100'?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btnYes: TButton
    Left = 32
    Top = 80
    Width = 137
    Height = 33
    Caption = #1044#1072
    TabOrder = 0
    OnClick = btnYesClick
  end
  object btnNo: TButton
    Left = 192
    Top = 80
    Width = 145
    Height = 33
    Caption = #1053#1077#1090
    TabOrder = 1
    OnClick = btnNoClick
  end
end
