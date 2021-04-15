unit USale;

interface

uses UProductDescription, UMoney, UPayment, UDate, USalesLineItem,
  System.SysUtils, System.Generics.Defaults, System.Generics.Collections, System.Types;

type
  TSale = class
  private
    lineItems: TList<TSalesLineItem>;
    date: TDate;
    isComplete: boolean;
    payment: TPayment;
  public
    function getBalance(): TMoney;
    function getTotal(): TMoney;
    procedure becomeComplete();
    procedure makeLineItem(desc: TProductDescription; quantity: integer);
    procedure makePayment(cashTendered: TMoney);
    constructor Create();
  end;

implementation

{ Sale }

procedure TSale.becomeComplete;
begin
  isComplete := True;
end;

constructor TSale.Create;
begin
  date:=TDate.Create;
end;

function TSale.getBalance: TMoney;
begin
  result := payment.getAmount().minus(getTotal());
end;

function TSale.getTotal: TMoney;
var
  total, subtotal: TMoney;
  lineItem: TSalesLineItem;
begin
  total := TMoney.Create(0);
  subtotal := TMoney.Create(0);
  for lineItem in lineItems do
  begin
    subtotal := lineItem.getSubtotal();
    total.add(subtotal);
  end;
  result := total;
end;

procedure TSale.makeLineItem(desc: TProductDescription; quantity: integer);
begin
  lineItems.add(TSalesLineItem.Create(desc, quantity))
end;

procedure TSale.makePayment(cashTendered: TMoney);
begin
  payment := payment.Create(cashTendered);
end;

end.
