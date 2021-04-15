unit UProductDescription;

interface

uses
  UItemID, UMoney;

 type
 TProductDescription = class
   constructor Create(id:TItemID; price:TMoney; name:string);
 end;
implementation

{ ProductDescription }

constructor TProductDescription.Create(id: TItemID; price: TMoney; name: string);
begin

end;

end.
