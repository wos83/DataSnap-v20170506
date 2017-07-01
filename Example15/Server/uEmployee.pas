unit uEmployee;

interface

uses
   System.Generics.Collections,
   REST.Json;

type
   TEmployee = class
   private
      FEMP_NO: string;
      FFIRST_NAME: string;
      FLAST_NAME: string;
   public
      property EMP_NO: string read FEMP_NO write FEMP_NO;
      property FIRST_NAME: string read FFIRST_NAME write FFIRST_NAME;
      property LAST_NAME: string read FLAST_NAME write FLAST_NAME;
   end;

   TEmployeeList = class
   private
      FList: TObjectList<TEmployee>;
   public
      constructor Create;
      destructor Destroy;
      property List: TObjectList<TEmployee> read FList write FList;
   end;

implementation

{ TEmployeeList }

constructor TEmployeeList.Create;
begin
   FList := TObjectList<TEmployee>.Create;
end;

destructor TEmployeeList.Destroy;
begin
   FList.Destroy;
end;

end.
