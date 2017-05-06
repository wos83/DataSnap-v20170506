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
   FireDAC.Stan.Param,
   FireDAC.DatS,
   FireDAC.DApt.Intf,
   FireDAC.DApt,
   DataSnap.Provider,
   Data.DB,
   FireDAC.Comp.DataSet,
   FireDAC.Comp.Client,
   FireDAC.Comp.UI,
   FireDAC.Phys.IBBase;

type
   {$METHODINFO ON}
   TSM = class(TDSServerModule)
      FDPhysFBDriverLink: TFDPhysFBDriverLink;
      FDGUIxWaitCursor: TFDGUIxWaitCursor;
      FDConn: TFDConnection;
      tbEMPLOYEE: TFDTable;
      dspEMPLOYEE: TDataSetProvider;
   private
      { Private declarations }
   public
      { Public declarations }
      function EchoString(Value: string): string;
      function ReverseString(Value: string): string;
   end;
   {$METHODINFO OFF}

implementation

{$R *.dfm}

uses System.StrUtils;

function TSM.EchoString(Value: string): string;
begin
   Result := Value;
end;

function TSM.ReverseString(Value: string): string;
begin
   Result := System.StrUtils.ReverseString(Value);
end;

end.
