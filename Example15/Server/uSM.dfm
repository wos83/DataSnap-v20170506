object SM: TSM
  OldCreateOrder = False
  Height = 390
  Width = 527
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 64
    Top = 16
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 64
    Top = 64
  end
  object FDConn: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\Firebird\Firebird_2_5\examples\empbuild\EMPLOYEE.FDB')
    LoginPrompt = False
    Left = 64
    Top = 112
  end
  object FDQryEmployee: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'SELECT * FROM EMPLOYEE')
    Left = 64
    Top = 160
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
