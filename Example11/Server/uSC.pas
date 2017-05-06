unit uSC;

interface

uses
   System.SysUtils,
   System.Classes,
   Datasnap.DSTCPServerTransport,
   Datasnap.DSServer,
   Datasnap.DSCommonServer,
   IPPeerServer,
   IPPeerAPI,
   Datasnap.DSAuth;

type
   TSC = class(TDataModule)
      DSServer1: TDSServer;
      DSTCPServerTransport1: TDSTCPServerTransport;
      DSServerClass1: TDSServerClass;
      DSAuthenticationManager1: TDSAuthenticationManager;
      procedure DSServerClass1GetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
      procedure DSAuthenticationManager1UserAuthenticate(Sender: TObject; const Protocol, Context, User, Password: string; var valid: Boolean; UserRoles: TStrings);
   private
      { Private declarations }
   public
   end;

var
   SC: TSC;

implementation

{$R *.dfm}

uses
   uSM;

procedure TSC.DSServerClass1GetClass(DSServerClass: TDSServerClass; //
   var PersistentClass: TPersistentClass);
begin
   PersistentClass := uSM.TSM;
end;

procedure TSC.DSAuthenticationManager1UserAuthenticate(Sender: TObject; //
   const Protocol, Context, User, Password: string; //
   var valid: Boolean; UserRoles: TStrings);
begin
   valid := (User = 'admin') and (Password = '123456');
end;

end.
