unit UProductCatalog;

interface

uses
  System.Generics.Collections, UItemID, UProductDescription, UMoney;

type
  ProductCatalog = class
  private
    Map: TDictionary<ItemID, ProductDescription>;
    descriptions: TDictionary<ItemID, ProductDescription>;
  public
    constructor Create();
    function getProductDescription(id:ItemID): ProductDescription;
  end;

implementation

{ ProductCatalog }

constructor ProductCatalog.Create;
var
  id1, id2:ItemID;
  price:Money;
  desc:ProductDescription;

begin
  id1:=ItemID.Create(100);
  id2:=ItemID.Create(200);
  price:=Money.Create(3);
  desc:=ProductDescription.Create(id1, price, 'товар1');
  descriptions.Add(id1, desc);
  desc:=ProductDescription.Create(id2, price, 'товар2');
  descriptions.Add(id2, desc);

end;

function ProductCatalog.getProductDescription(id: ItemID): ProductDescription;
begin
  result:=descriptions[id];
end;

end.
