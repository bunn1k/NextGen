unit USalesLineItem;

interface

uses UProductDescription, UMoney;

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

{ TSalesLineItem }

constructor TSalesLineItem.Create(desc: IProductDescription; quantity: Integer);
begin
   Self.description:=desc;
   Self.quantity:=quantity;
end;

function TSalesLineItem.getSubTotal: IMoney;
begin
   Result:=description.getPrice().times(quantity);
end;

end.
