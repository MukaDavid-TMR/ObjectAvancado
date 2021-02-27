object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Treinamento Minerva'
  ClientHeight = 514
  ClientWidth = 635
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
  object MemLog: TMemo
    Left = 256
    Top = 40
    Width = 345
    Height = 321
    Lines.Strings = (
      'MemLog')
    TabOrder = 0
  end
  object btnListaPropriedades: TButton
    Left = 32
    Top = 40
    Width = 153
    Height = 25
    Caption = 'Listar Propriedades'
    TabOrder = 1
    OnClick = btnListaPropriedadesClick
  end
  object btnListarAtributos: TButton
    Left = 32
    Top = 104
    Width = 153
    Height = 25
    Caption = 'Listar Atributos'
    TabOrder = 2
    OnClick = btnListarAtributosClick
  end
  object btnExibirRota: TButton
    Left = 32
    Top = 152
    Width = 153
    Height = 25
    Caption = 'Exibir Rota'
    TabOrder = 3
    OnClick = btnExibirRotaClick
  end
  object btnImprimirEtiqueta: TButton
    Left = 32
    Top = 208
    Width = 153
    Height = 25
    Caption = 'Imprimir Etiqueta'
    TabOrder = 4
    OnClick = btnImprimirEtiquetaClick
  end
  object btnClasseGenerica: TButton
    Left = 32
    Top = 264
    Width = 153
    Height = 25
    Caption = 'Classe Generica'
    TabOrder = 5
    OnClick = btnClasseGenericaClick
  end
  object btnIfGenerico: TButton
    Left = 32
    Top = 314
    Width = 153
    Height = 25
    Caption = 'If Generico'
    TabOrder = 6
    OnClick = btnIfGenericoClick
  end
  object cbxGenerico: TCheckBox
    Left = 33
    Top = 352
    Width = 97
    Height = 17
    Caption = 'Ativo'
    TabOrder = 7
  end
  object btnAprovarNota: TButton
    Left = 33
    Top = 400
    Width = 152
    Height = 25
    Caption = 'btnAprovarNota'
    TabOrder = 8
    OnClick = btnAprovarNotaClick
  end
end
