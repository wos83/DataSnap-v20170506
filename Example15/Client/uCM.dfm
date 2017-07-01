object CM: TCM
  OldCreateOrder = False
  Height = 271
  Width = 415
  object DSRestConn: TDSRestConnection
    Host = 'localhost'
    Port = 8080
    LoginPrompt = False
    Left = 56
    Top = 16
    UniqueId = '{29F6D1AB-E012-41F9-9AA6-452B1CBF28CD}'
  end
  object tbEmployee: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 56
    Top = 64
  end
  object FDStanStorageJSONLink: TFDStanStorageJSONLink
    Left = 232
    Top = 24
  end
  object FDStanStorageBinLink: TFDStanStorageBinLink
    Left = 232
    Top = 72
  end
end
