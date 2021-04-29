unit USalesLineItem;

interface

uses UMoney, UProductDescription;

type
  ISalesLineItem = interface
    function getSubTotal(): IMoney;
  end;

  TSalesLineItem = class(TInterfacedObject, ISalesLineItem)
  private
    quantity: Integer;
    /// <link>aggregation</link>
    description: IProductDescription;
  public
    function getSubTotal(): IMoney;
    constructor Create(desc: IProductDescription; quantity: Integer);
  end;

implementation

{ SalesLineItem }

constructor TSalesLineItem.Create(desc: IProductDescription; quantity: integer);
begin
  Self.description:=desc;
  Self.quantity:=quantity;
end;

function TSalesLineItem.getSubTotal: IMoney;
begin
  Result:=description.getPrice().times(quantity);
end;

end.
