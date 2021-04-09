unit USale;

interface

uses UProductDescription, UMoney, UPayment, UDate, USalesLineItem,
  System.SysUtils, System.Generics.Defaults,
  System.Generics.Collections, System.Types;

type
  Sale = class
  private
    lineItems: TList<SalesLineItem>;
    date:Date;
    isComplete: boolean;
    payment: Payment;
  public
    function getBalance(): Money;
    function getTotal(): Money;
    procedure becomeComplete();
    procedure makeLineItem(desc: ProductDescription; quantity: integer);
    procedure makePayment(cashTendered: Money);
  end;

implementation

{ Sale }

procedure Sale.becomeComplete;
begin
  isComplete := True;
end;

function Sale.getBalance: Money;
begin
  result := payment.getAmount().minus(getTotal());
end;

function Sale.getTotal: Money;
var
  total, subtotal: Money;
  lineItem: SalesLineItem;
begin
  total := Money.Create(0);
  subtotal := Money.Create(0);
  for lineItem in lineItems do
  begin
    subtotal := lineItem.getSubtotal();
    total.add(subtotal);
  end;
  result := total;
end;

procedure Sale.makeLineItem(desc: ProductDescription; quantity: integer);
begin
  lineItems.add(SalesLineItem.Create(desc, quantity))
end;

procedure Sale.makePayment(cashTendered: Money);
begin
  payment := payment.Create(cashTendered);
end;

end.
