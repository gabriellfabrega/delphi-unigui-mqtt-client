object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 488
  ClientWidth = 625
  Caption = 'MainForm'
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  OnAjaxEvent = UniFormAjaxEvent
  TextHeight = 17
  object UniMemo1: TUniMemo
    Left = 359
    Top = 114
    Width = 250
    Height = 361
    Hint = ''
    TabOrder = 0
  end
  object gpConsumir: TUniGroupBox
    Left = 8
    Top = 104
    Width = 345
    Height = 137
    Hint = ''
    Caption = 'Consumir'
    TabOrder = 1
    object edtTopicoInscricao: TUniEdit
      Left = 14
      Top = 27
      Width = 309
      Height = 23
      Hint = ''
      Text = '/teste'
      TabOrder = 1
      EmptyText = 'Informe o t'#243'pico'
    end
    object btnInscrever: TUniButton
      Left = 212
      Top = 95
      Width = 111
      Height = 29
      Hint = ''
      Caption = 'Inscrever'
      TabOrder = 2
      OnClick = btnInscreverClick
    end
    object cbQosConsumo: TUniComboBox
      Left = 14
      Top = 60
      Width = 309
      Height = 25
      Hint = ''
      Style = csDropDownList
      Text = ''
      TabOrder = 3
      IconItems = <>
    end
  end
  object gpProduzir: TUniGroupBox
    Left = 8
    Top = 250
    Width = 345
    Height = 225
    Hint = ''
    Caption = 'Produzir'
    TabOrder = 2
    object edTopicoPublicacao: TUniEdit
      Left = 14
      Top = 27
      Width = 309
      Height = 23
      Hint = ''
      Text = '/teste'
      TabOrder = 1
      EmptyText = 'Informe o t'#243'pico'
    end
    object btnEnviar: TUniButton
      Left = 200
      Top = 176
      Width = 123
      Height = 29
      Hint = ''
      Caption = 'Enviar'
      TabOrder = 2
      OnClick = btnEnviarClick
    end
    object mmMsg: TUniMemo
      Left = 14
      Top = 95
      Width = 309
      Height = 71
      Hint = ''
      TabOrder = 3
    end
    object cbQosEnvio: TUniComboBox
      Left = 14
      Top = 60
      Width = 309
      Height = 25
      Hint = ''
      Style = csDropDownList
      Text = ''
      TabOrder = 4
      IconItems = <>
    end
  end
  object cbConexao: TUniGroupBox
    Left = 8
    Top = 10
    Width = 601
    Height = 81
    Hint = ''
    Caption = 'Consumir'
    TabOrder = 3
    object edBroker: TUniEdit
      Left = 14
      Top = 27
      Width = 255
      Height = 23
      Hint = ''
      Text = 'ws://127.0.0.1:8083/mqtt'
      TabOrder = 1
      EmptyText = 'Informe o broker'
    end
    object btnConectar: TUniButton
      Left = 476
      Top = 27
      Width = 111
      Height = 30
      Hint = ''
      Caption = 'Conectar'
      TabOrder = 2
      OnClick = btnConectarClick
    end
    object edClient: TUniEdit
      Left = 275
      Top = 27
      Width = 195
      Height = 23
      Hint = ''
      Text = 'client-unigui'
      TabOrder = 3
      EmptyText = 'Informe o t'#243'pico'
    end
  end
end
