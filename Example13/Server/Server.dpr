program Server;
{$APPTYPE GUI}

{$R *.dres}

uses
  FMX.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uFrmServer in 'uFrmServer.pas' {FrmServer},
  uSM in 'uSM.pas' {SM: TDSServerModule},
  uSC in 'uSC.pas' {SC: TDataModule},
  uWM in 'uWM.pas' {WM: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TFrmServer, FrmServer);
  Application.Run;
end.
