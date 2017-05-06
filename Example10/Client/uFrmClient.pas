unit uFrmClient;

interface

uses
   Winapi.Windows,
   Winapi.Messages,
   System.SysUtils,
   System.Variants,
   System.Classes,
   Vcl.Graphics,
   Vcl.Controls,
   Vcl.Forms,
   Vcl.Dialogs,
   Data.DB,
   Vcl.StdCtrls,
   Vcl.ExtCtrls,
   Vcl.DBCtrls,
   Vcl.Grids,
   Vcl.DBGrids;

type
   TFrmClient = class(TForm)
      DBGrid1: TDBGrid;
      DBNavigator1: TDBNavigator;
      Panel1: TPanel;
      Button1: TButton;
      Button2: TButton;
      dsEMPLOYEE: TDataSource;
      procedure Button1Click(Sender: TObject);
      procedure Button2Click(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmClient: TFrmClient;

implementation

{$R *.dfm}

uses
   uCM;

procedure TFrmClient.Button1Click(Sender: TObject);
begin
   dsEMPLOYEE.DataSet.Open;
end;

procedure TFrmClient.Button2Click(Sender: TObject);
begin
   dsEMPLOYEE.DataSet.Close;
end;

end.
