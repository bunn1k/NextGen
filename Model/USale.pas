unit USale;

interface

uses System.SysUtils, System.Generics.Defaults, System.Generics.Collections,
  System.Types, UProductDescription, UMoney, USalesLineItem, UDate, UPayment;

type
  ISale = interface
    function getBalance(): IMoney;
    function getTotal(): IMoney;
    procedure becomeComplete();
    procedure makeLineItem(desc: IProductDescription; quantity: integer);
    procedure makePayment(cashTendered: IMoney);
  end;

  TSale = class(TInterfacedObject, ISale)
  private
    LineItems: TList<ISalesLineItem>;
    date: TDate;
    isComplete: boolean;
    /// <link>aggregation</link>
    payment: IPayment;
  public
    function getBalance(): IMoney;
    function getTotal(): IMoney;
    procedure becomeComplete();
    procedure makeLineItem(desc: IProductDescription; quantity: integer);
    procedure makePayment(cashTendered: IMoney);
    constructor Create();
  end;

implementation

{ Sale }

procedure TSale.becomeComplete;
begin
  isComplete := true;
end;

constructor TSale.Create;
begin
       LineItems:=TList<ISalesLineItem>.Create;
end;

function TSale.getBalance: IMoney;
begin
  result := payment.getAmount().minus(getTotal());
end;

function TSale.getTotal: IMoney;
var
  total, subtotal: IMoney;
  lineItem: ISalesLineItem;
begin
  total := TMoney.Create(0);
  subtotal := TMoney.Create(0);
  for lineItem in LineItems do
  begin
    subtotal := lineItem.getSubTotal();
    total.add(subtotal);
  end;
end;

procedure TSale.makeLineItem(desc: IProductDescription; quantity: integer);
begin
  LineItems.add(TSalesLineItem.Create(desc, quantity));
end;

procedure TSale.makePayment(cashTendered: IMoney);
begin
  payment := TPayment.Create(cashTendered);
end;

end.
