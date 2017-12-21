object Form2: TForm2
  Left = 356
  Top = 207
  BorderStyle = bsToolWindow
  Caption = 'Configuraci'#243'n'
  ClientHeight = 130
  ClientWidth = 282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 24
    Width = 87
    Height = 13
    Caption = 'Puerto de Balanza'
  end
  object Edit1: TEdit
    Left = 152
    Top = 24
    Width = 81
    Height = 21
    TabOrder = 0
    Text = 'COM2'
  end
  object CheckBox1: TCheckBox
    Left = 56
    Top = 48
    Width = 169
    Height = 17
    Caption = 'Usar balanza electr'#243'nica'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 192
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Guardar'
    TabOrder = 2
    OnClick = Button1Click
  end
end
