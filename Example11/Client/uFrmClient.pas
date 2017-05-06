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
   Vcl.Grids,
   Vcl.DBGrids,
   Vcl.DBCtrls,
   Vcl.ExtCtrls;

type
   TFrmClient = class(TForm)
      dsCUSTOMER: TDataSource;
      dsDEPARTMENT: TDataSource;
      Panel1: TPanel;
      DBNavigator1: TDBNavigator;
      DBGrid1: TDBGrid;
      Panel2: TPanel;
      Button1: TButton;
      Button2: TButton;
      Panel3: TPanel;
      DBNavigator2: TDBNavigator;
      DBGrid2: TDBGrid;
      Panel4: TPanel;
      Button3: TButton;
      Button4: TButton;
      procedure Button1Click(Sender: TObject);
      procedure Button2Click(Sender: TObject);
      procedure Button3Click(Sender: TObject);
      procedure Button4Click(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmClient: TFrmClient;

implementation

uses
   uCM;

{$R *.dfm}

procedure TFrmClient.Button1Click(Sender: TObject);
begin
   dsCUSTOMER.DataSet.Open;
end;

procedure TFrmClient.Button2Click(Sender: TObject);
begin
   dsCUSTOMER.DataSet.Close;
end;

procedure TFrmClient.Button3Click(Sender: TObject);
begin
   dsDEPARTMENT.DataSet.Open;
end;

procedure TFrmClient.Button4Click(Sender: TObject);
begin
   dsDEPARTMENT.DataSet.Open;
end;

end.
