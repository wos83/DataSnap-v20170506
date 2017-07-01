unit uSM;

interface

uses System.SysUtils,
   System.Classes,
   System.Json,
   DataSnap.DSProviderDataModuleAdapter,
   DataSnap.DSServer,
   DataSnap.DSAuth;

type
   TSM = class(TDSServerModule)
   private
      { Private declarations }
   public
      { Public declarations }
      function EchoString(Value: string): string;
      function ReverseString(Value: string): string;

      function Sum(A, B: Double): Double;
      function SumString(A, B: integer): string;
   end;

implementation

{ %CLASSGROUP 'FMX.Controls.TControl' }

{$R *.dfm}

uses System.StrUtils;

function TSM.EchoString(Value: string): string;
begin
   Result := Value;
end;

function TSM.ReverseString(Value: string): string;
begin
   Result := System.StrUtils.ReverseString(Value);
end;

function TSM.Sum(A, B: Double): Double;
begin
   Result := A + B;
end;

function TSM.SumString(A, B: integer): string;
begin
   Result := (A + B).ToString;
end;

end.
