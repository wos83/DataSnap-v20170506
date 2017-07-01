unit uFrmClient;

interface

uses
   System.SysUtils,
   System.Types,
   System.UITypes,
   System.Classes,
   System.Variants,
   FMX.Types,
   FMX.Controls,
   FMX.Forms,
   FMX.Graphics,
   FMX.Dialogs,
   FMX.ListView.Types,
   FMX.ListView.Appearances,
   FMX.ListView.Adapters.Base,
   FMX.ListView,
   FMX.Controls.Presentation,
   FMX.StdCtrls,
   Data.FireDACJSONReflect,
   FireDAC.Comp.Client;

type
   TFrmClient = class(TForm)
      lstvEmployee: TListView;
      btnGetEmployee: TButton;
      procedure btnGetEmployeeClick(Sender: TObject);
   private
      LDatasetList: TFDJSONDataSets;
      procedure ClientGetEmployee;
      procedure DataList(AFDMemTable: TFDMemTable);
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmClient: TFrmClient;

implementation

uses uCM;

{$R *.fmx}

procedure TFrmClient.ClientGetEmployee;
begin
   CM.tbEmployee.Close;
   LDatasetList := CM.SMClient.GetEmployee;
   CM.tbEmployee.AppendData(TFDJSONDataSetsReader.GetListValue(LDatasetList, 0));
   CM.tbEmployee.Open;
   DataList(CM.tbEmployee);
end;

procedure TFrmClient.DataList(AFDMemTable: TFDMemTable);
var
   LItem: TListViewItem;
begin
   if not AFDMemTable.IsEmpty then
   begin
      lstvEmployee.Items.Clear;
      lstvEmployee.ItemAppearance.ItemAppearance := 'ImageListItemBottomDetail';

      AFDMemTable.First;
      while not AFDMemTable.Eof do
      begin
         LItem := lstvEmployee.Items.Add;
         LItem.Text := AFDMemTable.Fields[0].AsString + ' - ' + AFDMemTable.Fields[1].AsString+' '+ AFDMemTable.Fields[2].AsString;
         LItem.Detail := AFDMemTable.Fields[3].AsString + ' - ' + AFDMemTable.Fields[4].AsString;
         AFDMemTable.Next;
      end;
   end;
end;

procedure TFrmClient.btnGetEmployeeClick(Sender: TObject);
begin
   ClientGetEmployee;
end;

end.
