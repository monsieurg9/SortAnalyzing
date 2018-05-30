object FGraphics: TFGraphics
  Left = 192
  Top = 142
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1043#1088#1072#1092#1080#1082#1080
  ClientHeight = 485
  ClientWidth = 922
  Color = clBtnFace
  DragKind = dkDock
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmInformation
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object chtGraphicBoxBubble: TChart
    Left = 760
    Top = 136
    Width = 550
    Height = 370
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      #1055#1091#1079#1099#1088#1100#1082#1086#1074#1072#1103' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1089' '#1092#1083#1072#1078#1082#1086#1084)
    Chart3DPercent = 70
    Legend.HorizMargin = 120
    Legend.ResizeChart = False
    TabOrder = 0
    object lnsrsSeries1: TLineSeries
      Cursor = crCross
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
      object TeeFunction1: TMultiplyTeeFunction
      end
    end
  end
  object grpMassType: TGroupBox
    Left = 601
    Top = 272
    Width = 137
    Height = 113
    Caption = #1058#1080#1087' '#1084#1072#1089#1089#1080#1074#1072
    TabOrder = 1
    object rbRandom: TRadioButton
      Left = 8
      Top = 24
      Width = 113
      Height = 17
      Caption = #1057#1083#1091#1095#1072#1081#1085#1099#1081
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbRandomClick
    end
    object rbSorted: TRadioButton
      Left = 8
      Top = 48
      Width = 113
      Height = 17
      Caption = #1054#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1085#1085#1099#1081
      TabOrder = 1
      OnClick = rbSortedClick
    end
    object rbInverted: TRadioButton
      Left = 8
      Top = 72
      Width = 113
      Height = 17
      Caption = #1055#1077#1088#1077#1074#1077#1088#1085#1091#1090#1099#1081
      TabOrder = 2
      OnClick = rbInvertedClick
    end
  end
  object chtGraphicBoxHeap: TChart
    Left = 24
    Top = 136
    Width = 550
    Height = 370
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      #1055#1080#1088#1072#1084#1080#1076#1072#1083#1100#1085#1072#1103' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1072)
    Chart3DPercent = 70
    TabOrder = 2
    object lnsrsSeries2: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
  object grpSortType: TGroupBox
    Left = 600
    Top = 120
    Width = 129
    Height = 129
    Caption = #1050#1088#1080#1090#1077#1088#1080#1081' '#1089#1086#1088#1090#1080#1088#1086#1074#1082#1080
    TabOrder = 3
    object rbComp: TRadioButton
      Left = 8
      Top = 64
      Width = 113
      Height = 17
      Caption = #1057#1088#1072#1074#1085#1077#1085#1080#1103
      TabOrder = 0
      OnClick = rbCompClick
    end
    object rbTime: TRadioButton
      Left = 8
      Top = 32
      Width = 105
      Height = 17
      Caption = #1042#1088#1077#1084#1103
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbTimeClick
    end
    object rbTransp: TRadioButton
      Left = 8
      Top = 96
      Width = 105
      Height = 17
      Caption = #1055#1077#1088#1077#1089#1090#1072#1085#1086#1074#1082#1080
      TabOrder = 2
      OnClick = rbTranspClick
    end
  end
  object btnDrawGraphic: TButton
    Left = 40
    Top = 544
    Width = 1273
    Height = 49
    Caption = #1055#1086#1089#1090#1088#1086#1080#1090#1100' '#1075#1088#1072#1092#1080#1082#1080
    TabOrder = 4
    OnClick = btnDrawGraphicClick
  end
  object btnTable: TButton
    Left = 968
    Top = 616
    Width = 345
    Height = 41
    Caption = #1058#1072#1073#1083#1080#1094#1099'/'#1043#1088#1072#1092#1080#1082#1080
    TabOrder = 5
    OnClick = btnTableClick
  end
  object strngrdHeap: TStringGrid
    Left = 232
    Top = 120
    Width = 369
    Height = 329
    ColCount = 4
    DefaultColWidth = 90
    RowCount = 13
    TabOrder = 6
    Visible = False
  end
  object strngrdBubble: TStringGrid
    Left = 728
    Top = 120
    Width = 369
    Height = 329
    ColCount = 4
    DefaultColWidth = 90
    RowCount = 13
    TabOrder = 7
    Visible = False
  end
  object btnFillTable: TBitBtn
    Left = 624
    Top = 616
    Width = 321
    Height = 41
    Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1091
    TabOrder = 8
    Visible = False
    OnClick = btnFillTableClick
  end
  object txtHeap: TStaticText
    Left = 288
    Top = 80
    Width = 260
    Height = 40
    Caption = #1055#1080#1088#1072#1084#1080#1076#1072#1083#1100#1085#1072#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -31
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    Visible = False
  end
  object txtBubble: TStaticText
    Left = 784
    Top = 80
    Width = 209
    Height = 40
    Caption = #1055#1091#1079#1099#1088#1100#1082#1086#1074#1072#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -31
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    Visible = False
  end
  object btnBack: TBitBtn
    Left = 1000
    Top = 672
    Width = 313
    Height = 25
    Caption = #1053#1072#1079#1072#1076
    TabOrder = 11
    OnClick = btnBackClick
  end
  object mmInformation: TMainMenu
    Left = 8
    object N1: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
    end
  end
end
