unit uCM;

interface

uses
  System.SysUtils, System.Classes, uCC, Data.DBXDataSnap,
  Data.DBXCommon, IPPeerClient, Data.DB, Data.SqlExpr, Datasnap.DBClient,
  Datasnap.DSConnect;

type
  TCM = class(TDataModule)
    SQLConn: TSQLConnection;
    DSProviderConn: TDSProviderConnection;
    cdsEMPLOYEE: TClientDataSet;
    cdsEMPLOYEEEMP_NO: TSmallintField;
    cdsEMPLOYEEFIRST_NAME: TStringField;
    cdsEMPLOYEELAST_NAME: TStringField;
    cdsEMPLOYEEPHONE_EXT: TStringField;
    cdsEMPLOYEEHIRE_DATE: TSQLTimeStampField;
    cdsEMPLOYEEDEPT_NO: TStringField;
    cdsEMPLOYEEJOB_CODE: TStringField;
    cdsEMPLOYEEJOB_GRADE: TSmallintField;
    cdsEMPLOYEEJOB_COUNTRY: TStringField;
    cdsEMPLOYEESALARY: TBCDField;
    cdsEMPLOYEEFULL_NAME: TStringField;
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

{%CLASSGROUP 'Vcl.Controls.TControl'}

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
  begin
    SQLConn.Open;
    FSMClient:= TSMClient.Create(SQLConn.DBXConnection, FInstanceOwner);
  end;
  Result := FSMClient;
end;

end.
