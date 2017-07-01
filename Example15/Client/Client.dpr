program Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmClient in 'uFrmClient.pas' {FrmClient},
  uCC in 'uCC.pas',
  uCM in 'uCM.pas' {CM: TDataModule},
  Data.DB.Helper in '..\Server\Data.DB.Helper.pas',
  System.uJSON in '..\Server\System.uJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmClient, FrmClient);
  Application.CreateForm(TCM, CM);
  Application.Run;
end.
