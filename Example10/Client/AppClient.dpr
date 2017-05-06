program AppClient;

uses
  Vcl.Forms,
  uFrmClient in 'uFrmClient.pas' {FrmClient},
  uCM in 'uCM.pas' {CM: TDataModule},
  uCC in 'uCC.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmClient, FrmClient);
  Application.CreateForm(TCM, CM);
  Application.Run;
end.
