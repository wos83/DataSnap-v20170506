unit uCM;

interface

uses
   System.SysUtils,
   System.Classes,
   uCC,
   Datasnap.DSClientRest,
   FireDAC.Stan.Intf,
   FireDAC.Stan.Option,
   FireDAC.Stan.Param,
   FireDAC.Stan.Error,
   FireDAC.DatS,
   FireDAC.Phys.Intf,
   FireDAC.DApt.Intf,
   Data.DB,
   FireDAC.Comp.DataSet,
   FireDAC.Comp.Client,
   FireDAC.Stan.StorageBin,
   FireDAC.Stan.StorageJSON;

type
   TCM = class(TDataModule)
      DSRestConn: TDSRestConnection;
      tbEmployee: TFDMemTable;
      FDStanStorageJSONLink: TFDStanStorageJSONLink;
      FDStanStorageBinLink: TFDStanStorageBinLink;
   private
      FInstanceOwner: Boolean;
      FSMClient: TSMClient;
      function GetSMClient: TSMClient;
      { Private declarations }
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
      property SMClient: TSMClient read GetSMClient write FSMClient;

   end;

var
   CM: TCM;

implementation

{ %CLASSGROUP 'FMX.Controls.TControl' }

{$R *.dfm}

constructor TCM.Create(AOwner: TComponent);
begin
   inherited;
   FInstanceOwner := True;
end;

destructor TCM.Destroy;
begin
   FSMClient.Free;
   inherited;
end;

function TCM.GetSMClient: TSMClient;
begin
   if FSMClient = nil then
      FSMClient := TSMClient.Create(DSRestConn, FInstanceOwner);
   Result := FSMClient;
end;

end.
