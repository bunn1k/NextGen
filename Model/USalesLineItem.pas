unit USalesLineItem;

interface

uses UProductDescription, UMoney;

 type
 TSalesLineItem = class
   function getSubtotal():TMoney;
   constructor Create(desc:TProductDescription; quatity:integer);
 end;
implementation

{ SalesLineItem }

constructor TSalesLineItem.Create(desc: TProductDescription; quatity: integer);
begin

end;

function TSalesLineItem.getSubtotal: TMoney;
begin

end;

end.
