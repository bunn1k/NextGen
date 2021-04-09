unit USalesLineItem;

interface

uses UProductDescription, UMoney;

 type
 SalesLineItem = class
   function getSubtotal():Money;
   constructor Create(desc:ProductDescription; quatity:integer);
 end;
implementation

{ SalesLineItem }

constructor SalesLineItem.Create(desc: ProductDescription; quatity: integer);
begin

end;

function SalesLineItem.getSubtotal: Money;
begin

end;

end.
