object AdminForm: TAdminForm
  Left = 243
  Top = 142
  Width = 938
  Height = 487
  Caption = 'AdminForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblUsers: TLabel
    Left = 0
    Top = 0
    Width = 922
    Height = 36
    Align = alTop
    Alignment = taCenter
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -31
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lvUsers: TListView
    Left = 0
    Top = 36
    Width = 801
    Height = 412
    Align = alClient
    Columns = <
      item
        Caption = #8470
        Width = 20
      end
      item
        AutoSize = True
        Caption = #1051#1086#1075#1080#1085
      end
      item
        AutoSize = True
        Caption = #1055#1072#1088#1086#1083#1100
      end
      item
        AutoSize = True
        Caption = #1048#1084#1103
        MinWidth = 30
      end
      item
        AutoSize = True
        Caption = #1060#1072#1084#1080#1083#1080#1103
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object pnlEditListButtons: TPanel
    Left = 801
    Top = 36
    Width = 121
    Height = 412
    Align = alRight
    Caption = ' '
    TabOrder = 1
    object btnAddUser: TButton
      Left = 8
      Top = 176
      Width = 97
      Height = 41
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      TabOrder = 0
      WordWrap = True
      OnClick = btnAddUserClick
    end
    object btnEditUser: TButton
      Left = 8
      Top = 224
      Width = 97
      Height = 41
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      TabOrder = 1
      WordWrap = True
      OnClick = btnEditUserClick
    end
    object btnDeleteUser: TButton
      Left = 8
      Top = 272
      Width = 97
      Height = 41
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      TabOrder = 2
      WordWrap = True
      OnClick = btnDeleteUserClick
    end
  end
end
