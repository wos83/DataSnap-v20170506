//
// Created by the DataSnap proxy generator.
// 06/05/2017 14:57:34
//

unit uCC;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TSMClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetEmployeeCommand: TDSRestCommand;
    FGetEmployeeCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetEmployee(const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetEmployee_Cache(const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TSM_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSM_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSM_GetEmployee: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSM_GetEmployee_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TSMClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TSM.EchoString';
    FEchoStringCommand.Prepare(TSM_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TSMClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TSM.ReverseString';
    FReverseStringCommand.Prepare(TSM_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TSMClient.GetEmployee(const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetEmployeeCommand = nil then
  begin
    FGetEmployeeCommand := FConnection.CreateCommand;
    FGetEmployeeCommand.RequestType := 'GET';
    FGetEmployeeCommand.Text := 'TSM.GetEmployee';
    FGetEmployeeCommand.Prepare(TSM_GetEmployee);
  end;
  FGetEmployeeCommand.Execute(ARequestFilter);
  if not FGetEmployeeCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetEmployeeCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetEmployeeCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetEmployeeCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMClient.GetEmployee_Cache(const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetEmployeeCommand_Cache = nil then
  begin
    FGetEmployeeCommand_Cache := FConnection.CreateCommand;
    FGetEmployeeCommand_Cache.RequestType := 'GET';
    FGetEmployeeCommand_Cache.Text := 'TSM.GetEmployee';
    FGetEmployeeCommand_Cache.Prepare(TSM_GetEmployee_Cache);
  end;
  FGetEmployeeCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetEmployeeCommand_Cache.Parameters[0].Value.GetString);
end;

constructor TSMClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSMClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSMClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetEmployeeCommand.DisposeOf;
  FGetEmployeeCommand_Cache.DisposeOf;
  inherited;
end;

end.

