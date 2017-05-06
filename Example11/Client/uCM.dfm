object CM: TCM
  OldCreateOrder = False
  Height = 271
  Width = 415
  object SQLConn: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'Port=211'
      'HostName=127.0.0.1'
      'CommunicationProtocol=tcp/ip'
      'DSAuthenticationPassword=123456'
      'DSAuthenticationUser=admin'
      'DatasnapContext=datasnap/')
    Connected = True
    Left = 56
    Top = 16
  end
  object DSProviderConn: TDSProviderConnection
    ServerClassName = 'TSM'
    Connected = True
    SQLConnection = SQLConn
    Left = 56
    Top = 64
  end
  object cdsCUSTOMER: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCUSTOMER'
    RemoteServer = DSProviderConn
    Left = 176
    Top = 40
  end
  object cdsDEPARTMENT: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDEPARTMENT'
    RemoteServer = DSProviderConn
    Left = 296
    Top = 40
  end
end
