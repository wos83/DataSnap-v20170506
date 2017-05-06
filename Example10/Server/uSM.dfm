object SM: TSM
  OldCreateOrder = False
  Height = 400
  Width = 579
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 64
    Top = 24
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 64
    Top = 72
  end
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=C:\Firebird\Firebird_2_5\examples\empbuild\EMPLOYEE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 64
    Top = 120
  end
  object tbEMPLOYEE: TFDTable
    Connection = FDConn
    UpdateOptions.UpdateTableName = 'EMPLOYEE'
    TableName = 'EMPLOYEE'
    Left = 64
    Top = 168
  end
  object dspEMPLOYEE: TDataSetProvider
    DataSet = tbEMPLOYEE
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 64
    Top = 216
  end
end
