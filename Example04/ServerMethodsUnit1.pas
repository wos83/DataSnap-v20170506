unit ServerMethodsUnit1;

interface

uses System.SysUtils,
   System.Classes,
   System.Json,
   Datasnap.DSServer,
   Datasnap.DSAuth;

type
   {$METHODINFO ON}
   TServerMethods1 = class(TDataModule)
   private
      { Private declarations }
   public
      { Public declarations }
      function EchoString(Value: string): string;
      function ReverseString(Value: string): string;
      function Sum(A, B: Double): Double;
   end;
   {$METHODINFO OFF}

implementation

{$R *.dfm}

uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
   Result := Value;
end;

function TServerMethods1.ReverseString(Value: string): string;
var
   strValue: string;
   strResult: string;
begin
   strValue := Value;
   strResult := System.StrUtils.ReverseString(strValue);
   Result := strResult;
end;

function TServerMethods1.Sum(A, B: Double): Double;
begin
   Result := A + B;
end;

end.
