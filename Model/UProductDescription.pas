unit UProductDescription;

interface

uses
  UItemID, UMoney;

type
  IProductDescription = interface
    function getId: TItemId;
    function getPrice: IMoney;
    function getDescription: string;
  end;

  TProductDescription = class(TInterfacedObject, IProductDescription)
  private
    id: TItemId;
    price: IMoney;
    description: string;
  public
    function getId: TItemId;
    function getPrice: IMoney;
    function getDescription: string;
    constructor Create(id: TItemId; price: IMoney; description: string);
  end;

implementation


{ TProductDescription }

constructor TProductDescription.Create(id: TItemId; price: IMoney;
  description: string);
begin
   Self.id := id;
   Self.price:= price;
   Self.description:= description;
end;

function TProductDescription.getDescription: string;
begin
   Result:=description;
end;

function TProductDescription.getId: TItemId;
begin
   Result:=id;
end;

function TProductDescription.getPrice: IMoney;
begin
   Result:=price;
end;

end.
