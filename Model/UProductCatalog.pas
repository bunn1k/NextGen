unit UProductCatalog;

interface

uses
  System.Generics.Collections, UItemID, UProductDescription, UMoney;

type
  IProductCatalog = interface
    function getProductDescription(id: integer): IProductDescription;
  end;

  TProductCatalog = class(TInterfacedObject, IProductCatalog)
  private
    Map: TDictionary<TItemID, IProductDescription>;
    descriptions: TDictionary<integer, IProductDescription>;
  public
    constructor Create();
    function getProductDescription(id: integer): IProductDescription;
  end;

implementation

{ ProductCatalog }

constructor TProductCatalog.Create;
var
  id1, id2: integer;
  price: IMoney;
  desc: IProductDescription;
begin
  descriptions:=TDictionary<integer, IProductDescription>.create;;
  id1 := 100;
  id2 := 200;
  price := TMoney.Create(3);
  desc := TProductDescription.Create(id1, price, 'товар1');
  descriptions.Add(id1, desc);
  desc := TProductDescription.Create(id2, price, 'товар2');
end;

function TProductCatalog.getProductDescription(id: integer)
  : IProductDescription;
begin
  result := descriptions[id];
end;

end.
