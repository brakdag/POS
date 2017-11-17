object Form1: TForm1
  Left = 192
  Top = 125
  Width = 524
  Height = 317
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 80
    Width = 199
    Height = 116
    Caption = 'peso'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -96
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object MSComm1: TMSComm
    Left = 80
    Top = 24
    Width = 32
    Height = 32
    ControlData = {
      2143341208000000ED030000ED03000001568A64000006000000010000040000
      00020000802500000000080000000000000000003F00000000000000}
  end
  object Button1: TButton
    Left = 144
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end
