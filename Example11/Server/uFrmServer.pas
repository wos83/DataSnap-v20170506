unit uFrmServer;

interface

uses Winapi.Windows,
   Winapi.Messages,
   System.SysUtils,
   System.Variants,
   System.Classes,
   Vcl.Graphics,
   Vcl.Controls,
   Vcl.Forms,
   Vcl.Dialogs,
   Vcl.StdCtrls,
   IdBaseComponent,
   IdComponent,
   IdIPWatch;

type
   TFrmServer = class(TForm)
      IdIPWatch1: TIdIPWatch;
      Label1: TLabel;
      procedure FormShow(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmServer: TFrmServer;

implementation

{$R *.dfm}

procedure TFrmServer.FormShow(Sender: TObject);
begin
   IdIPWatch1.Active := True;
   Sleep(250);
   Label1.Caption := 'IP Server: ' + IdIPWatch1.LocalIP;
   IdIPWatch1.Active := False;
end;

end.
