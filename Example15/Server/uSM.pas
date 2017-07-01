unit uSM;

interface

uses
   System.SysUtils,
   System.Classes,
   System.Json,
   DataSnap.DSProviderDataModuleAdapter,
   DataSnap.DSServer,
   DataSnap.DSAuth,
   FireDAC.Phys.FBDef,
   FireDAC.UI.Intf,
   FireDAC.VCLUI.Wait,
   FireDAC.Stan.Intf,
   FireDAC.Stan.Option,
   FireDAC.Stan.Error,
   FireDAC.Phys.Intf,
   FireDAC.Stan.Def,
   FireDAC.Stan.Pool,
   FireDAC.Stan.Async,
   FireDAC.Phys,
   FireDAC.Phys.FB,
   Data.DB,
   FireDAC.Comp.Client,
   FireDAC.Comp.UI,
   FireDAC.Phys.IBBase,
   FireDAC.Stan.Param,
   FireDAC.DatS,
   FireDAC.DApt.Intf,
   FireDAC.DApt,
   FireDAC.Comp.DataSet,
   Data.FireDACJSONReflect,
   FireDAC.Stan.StorageBin,
   FireDAC.Stan.StorageJSON,
   REST.Json,
   Data.DBXPlatform;

type
   TSM = class(TDSServerModule)
      FDPhysFBDriverLink: TFDPhysFBDriverLink;
      FDGUIxWaitCursor: TFDGUIxWaitCursor;
      FDConn: TFDConnection;
      FDQryEmployee: TFDQuery;
      FDStanStorageJSONLink: TFDStanStorageJSONLink;
      FDStanStorageBinLink: TFDStanStorageBinLink;
   private
      { Private declarations }
   public
      { Public declarations }
      function EchoString(Value: string): string;
      function ReverseString(Value: string): string;
      function GetEmployee: TFDJSONDataSets;
      function GetEmployeeJson: string;
   end;

implementation

{ %CLASSGROUP 'FMX.Controls.TControl' }

{$R *.dfm}

uses
   System.StrUtils,
   uEmployee;

function TSM.EchoString(Value: string): string;
begin
   Result := Value;
end;

function TSM.GetEmployee: TFDJSONDataSets;
begin
   FDQryEmployee.Close;
   Result := TFDJSONDataSets.Create;
   TFDJSONDataSetsWriter.ListAdd(Result, FDQryEmployee);
end;

function TSM.GetEmployeeJson: string;
var
   EmployeeList: TEmployeeList;
   LJsonString: string;
   SL: TStringList;
begin
   FDQryEmployee.Close;
   FDQryEmployee.Open;
   if not FDQryEmployee.IsEmpty then
   begin
      FDQryEmployee.First;

      EmployeeList := TEmployeeList.Create;

      while not FDQryEmployee.Eof do
      begin
         EmployeeList.List.Add(TEmployee.Create);

         EmployeeList.List.Last.EMP_NO := FDQryEmployee.FindField('EMP_NO').AsString;
         EmployeeList.List.Last.FIRST_NAME := FDQryEmployee.FindField('FIRST_NAME').AsString;
         EmployeeList.List.Last.LAST_NAME := FDQryEmployee.FindField('LAST_NAME').AsString;

         FDQryEmployee.Next;
      end;

      LJsonString := TJson.ObjectToJsonString(EmployeeList, [ //
         TJsonOption.joIgnoreEmptyStrings, //
         TJsonOption.joIgnoreEmptyArrays, //
         TJsonOption.joDateFormatISO8601 //
         ]);

      SL := TStringList.Create;
      try
         SL.Text := LJsonString;
         SL.SaveToFile(FormatDateTime('ymd_hns', Now)+'.json');
         Result := SL.Text;
      finally
         FreeAndNil(SL);
      end;

      GetInvocationMetadata(True).ResponseContentType := 'application/json';
   end;
end;

function TSM.ReverseString(Value: string): string;
begin
   Result := System.StrUtils.ReverseString(Value);
end;

end.
