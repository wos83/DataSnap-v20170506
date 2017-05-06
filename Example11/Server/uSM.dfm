object SM: TSM
  OldCreateOrder = False
  Height = 382
  Width = 543
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 64
    Top = 8
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 64
    Top = 56
  end
  object FDConn: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Database=C:\Firebird\Firebird_2_5\examples\empbuild\EMPLOYEE.FDB'
      'Password=masterkey'
      'Port=3050'
      'Server=localhost'
      'User_Name=sysdba')
    LoginPrompt = False
    Left = 64
    Top = 104
  end
  object tbCUSTOMER: TFDTable
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'CUSTOMER'
    TableName = 'CUSTOMER'
    Left = 216
    Top = 32
  end
  object dspCUSTOMER: TDataSetProvider
    DataSet = tbCUSTOMER
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 216
    Top = 80
  end
  object tbDEPARTMENT: TFDTable
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'DEPARTMENT'
    TableName = 'DEPARTMENT'
    Left = 336
    Top = 32
  end
  object dspDEPARTMENT: TDataSetProvider
    DataSet = tbDEPARTMENT
    Options = [poCascadeDeletes, poCascadeUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 336
    Top = 80
  end
end
