//
// Created by the DataSnap proxy generator.
// 29/04/2017 14:18:50
//

unit uCC;

interface

uses
   System.JSON,
   Data.DBXCommon,
   Data.DBXClient,
   Data.DBXDataSnap,
   Data.DBXJSON,
   Datasnap.DSProxy,
   System.Classes,
   System.SysUtils,
   Data.DB,
   Data.SqlExpr,
   Data.DBXDBReaders,
   Data.DBXCDSReaders,
   Data.DBXJSONReflect;

type
   TSMClient = class(TDSAdminClient)
   private
      FEchoStringCommand: TDBXCommand;
      FReverseStringCommand: TDBXCommand;
   public
      constructor Create(ADBXConnection: TDBXConnection); overload;
      constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
      destructor Destroy; override;
      function EchoString(Value: string): string;
      function ReverseString(Value: string): string;
   end;

implementation

function TSMClient.EchoString(Value: string): string;
begin
   if FEchoStringCommand = nil then
   begin
      FEchoStringCommand := FDBXConnection.CreateCommand;
      FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
      FEchoStringCommand.Text := 'TSM.EchoString';
      FEchoStringCommand.Prepare;
   end;
   FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
   FEchoStringCommand.ExecuteUpdate;
   Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TSMClient.ReverseString(Value: string): string;
begin
   if FReverseStringCommand = nil then
   begin
      FReverseStringCommand := FDBXConnection.CreateCommand;
      FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
      FReverseStringCommand.Text := 'TSM.ReverseString';
      FReverseStringCommand.Prepare;
   end;
   FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
   FReverseStringCommand.ExecuteUpdate;
   Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

constructor TSMClient.Create(ADBXConnection: TDBXConnection);
begin
   inherited Create(ADBXConnection);
end;

constructor TSMClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
   inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TSMClient.Destroy;
begin
   FEchoStringCommand.DisposeOf;
   FReverseStringCommand.DisposeOf;
   inherited;
end;

end.
