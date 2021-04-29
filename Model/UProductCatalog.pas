unit UProductCatalog;

interface

uses
  System.Generics.Collections, UItemID, UProductDescription, UMoney;

type
  IProductCatalog = interface
    function getProductDescription(id: TItemID): IProductDescription;
  end;

  TProductCatalog = class(TInterfacedObject, IProductCatalog)
  private
    Map: TDictionary<TItemID, IProductDescription>;
    descriptions: TDictionary<TItemID, IProductDescription>;
  public
    constructor Create();
    function getProductDescription(id: TItemID): IProductDescription;
  end;

implementation

{ ProductCatalog }

constructor TProductCatalog.Create;
var
  id1, id2: TItemID;
  price: IMoney;
  desc: IProductDescription;
begin
  id1 := TItemID.Create(100);
  id2 := TItemID.Create(200);
  price := TMoney.Create(3);
  desc := TProductDescription.Create(id1, price, 'товар1');
  descriptions.Add(id1, desc);
  desc := TProductDescription.Create(id2, price, 'товар2');
end;

function TProductCatalog.getProductDescription(id: TItemID)
  : IProductDescription;
begin
  result := descriptions[id];
end;

end.
