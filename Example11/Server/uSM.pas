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
   Data.DB,
   FireDAC.Comp.Client,
   FireDAC.Comp.UI,
   FireDAC.Phys.IBBase,
   FireDAC.Phys.FB,
   FireDAC.Stan.Param,
   FireDAC.DatS,
   FireDAC.DApt.Intf,
   FireDAC.DApt,
   FireDAC.Comp.DataSet,
   DataSnap.Provider;

type
   TSM = class(TDSServerModule)
      FDPhysFBDriverLink: TFDPhysFBDriverLink;
      FDGUIxWaitCursor: TFDGUIxWaitCursor;
      FDConn: TFDConnection;
      tbCUSTOMER: TFDTable;
      dspCUSTOMER: TDataSetProvider;
      tbDEPARTMENT: TFDTable;
      dspDEPARTMENT: TDataSetProvider;
   private
      { Private declarations }
   public
      { Public declarations }
      function EchoString(Value: string): string;
      function ReverseString(Value: string): string;
   end;

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
